require('dotenv').config();
'use strict';


const express = require('express');
const bodyParser = require('body-parser');
const pg = require('pg');

const app = new express();
const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: true
});

// register JSON parser middlewear
app.use(bodyParser.json());

// routes
app.get('/', (req, res) => {
    res.send('Welcome to the DB app!<br>'+process.env.DATABASE_URL);
});

app.get('/db', (req, res) => {
    pool.connect(function (err, client, done) {
        if (err) {
            res.send('Cannot connect to db! ' + err);
        }
        client.query('SELECT table_schema, table_name FROM information_schema.tables where table_schema="public";', function (err, result) {
            done();
            if (err) {
                res.send('Cannot retrieve data! ' + err);
            }
            res.send(result.rows);
        })
    });
});

let port = process.env.PORT;
if (port == null || port == "") {
    port = 8000;
}
app.listen(port, () => {
    console.log('Server up!');
});
