var express = require('express');
var bodyParser = require('body-parser');
var zxcvbn = require('./dist/zxcvbn.js');

var app = express();

var port = 3000;

app.use(bodyParser.json());

app.post('*', function (req, res, next) {
    if (req.body.password) {
        next();
    } else {
        res
            .status(400)
            .json({
                error: {
                    code: 400,
                    message: "password missing in POST body"
                }
            });
    }
});

app.post('/zxcvbn', function (req, res) {
    res.send(zxcvbn(req.body.password, req.body.weakList, req.body.language));
});

app.post('/zxcvbn/score', function (req, res) {
    res.send({
        score: zxcvbn(req.body.password, req.body.weakList, req.body.language).score
    });
});

app.listen(port, () => console.log(`App listening on port ${port}!`));

module.exports = app;
