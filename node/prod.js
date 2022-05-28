var express = require('express');
var app = express();

app.get('/', function(req, res){
  const data = [
    'prod',
    process.env.A,
    process.env.B,
    process.env.C,
    process.env.D
  ]
  res.send(data.join(','));
});

app.listen(3000);