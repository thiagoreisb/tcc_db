require('dotenv').config();
'use strict';


const express = require('express');
const bodyParser = require('body-parser');
const pg = require('pg');

const app = new express();
const pool = new pg.Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASS,
    port: process.env.DB_PORT
});

// register JSON parser middlewear
app.use(bodyParser.json());

// routes
app.get('/', (req, res) => {
    res.send('Welcome to the DB app!');
});

app.get('/db', (req, res) => {
    pool.connect(function (err, client, done) {
        if (err) {
            res.send('Cannot connect to db! ' + err);
        }
        client.query('SELECT * FROM pg_catalog.pg_tables WHERE schemaname = \'public\';', function (err, result) {
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
