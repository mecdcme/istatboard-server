var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json())


//upload photo
app.use(bodyParser.urlencoded({extended: true}));
 
app.use(function (req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:4200');
  res.setHeader('Access-Control-Allow-Methods', 'POST');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});
  
const cors = require('cors')
const corsOptions = {
  origin: 'http://localhost:4200',
  optionsSuccessStatus: 200
}

app.use(cors(corsOptions));

const db = require('./app/config/db.config.js');
  
// force: true will drop the table if it already exists
//db.sequelize.sync().then(() => {
 // console.log('Drop and Resync with { force: true }');
 // initial();
//});


require('./app/route/hack.route.js')(app);
 
// Create a Server
var server = app.listen(8080, function () {
 
  let host = server.address().address
  let port = server.address().port

  console.log("App listening at http://%s:%s", host, port);
})


