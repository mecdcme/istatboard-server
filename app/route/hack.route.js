module.exports = function (app) {

  const db = require('../config/db.config.js');
  const ilogdiary = db.ilogdiary;
  const user = db.user;
  const vUserWeek = db.v_user_week;
  const vUserWeekJoin = db.v_user_week_join;
  const timereport = db.timereport;
  const euMainActivityRate = db.EuMainActivityRate;

  
const multer = require('multer');
const path = require('path');

  // Retrieve all ilogdiaries
  app.get('/api/ilogdiary',
    function (req, res) {
      ilogdiary.findAll({
        include: [{
          model: user
        }],
        'limit': 10
      }).then(ilogdiaries => {
        // Send all customers to Client
        res.json(ilogdiaries);
      });
    });

  // Retrieve a single ilogdiaries by Id
  app.get('/api/ilogdiary/:ilogdiaryId',
    function (req, res) {
      ilogdiary.findByPk(req.params.ilogdiaryId).then(ilogdiary => {
        res.json(ilogdiary);
      });
    });


  // Retrieve all ilogdiaries
  app.get('/api/report/userweek',
    function (req, res) {
      vUserWeek.findAll().then(vUserWeeks => {
        // Send all customers to Client
        res.json(vUserWeeks);
      });
    });

  // Retrieve all ilogdiaries
  app.get('/api/report/userweekjoin',
    function (req, res) {
      vUserWeekJoin.findAll().then(vUserWeekJoins => {
        // Send all customers to Client
        res.json(vUserWeekJoins);
      });
    });



  // Retrieve all report
  app.get('/api/report/list/:source',
    function (req, res) {
      db.sequelize.query('SELECT * FROM reports r where r.source=:source', { replacements: { source: req.params.source }, type: db.sequelize.QueryTypes.SELECT })
        .then(function (rows) {
          res.json(rows);
        });
    });




  // Retrieve report by reportid
  app.get('/api/table/report/:reportId',
    function (req, res) {
      db.sequelize.query(' select dbquery FROM hack.reports  where id= ' + req.params.reportId,
        { type: db.sequelize.QueryTypes.SELECT }).then(function (rows) {
          console.log(rows[0].dbquery);
          getReportData(res, rows[0].dbquery);
        });
    });

  function getReportData(res, dbquery) {
    db.sequelize.query(' select * FROM hack.' + dbquery,
      { type: db.sequelize.QueryTypes.SELECT }).then(function (rows) {
        res.json(rows);
      });
  }

  // CALL a Procedure MYSQL
  app.get('/api/proc/report/:reportId/:params',
    function (req, res) {
      db.sequelize.query(' select dbquery FROM hack.reports  where id= ' + req.params.reportId,
        { type: db.sequelize.QueryTypes.SELECT }).then(function (rows) {
          console.log(rows[0].dbquery);
          getReportDataProcedure(res, rows[0].dbquery, req.params.params);
        });
    });
  function getReportDataProcedure(res, dbquery, params) {
    var param_name = '';
    var param_value = '';
    var params_array = params.split("&");
    for (i = 0; i < params_array.length; i++) {
      var items_array = params_array[i].split("=");
      param_name += ':' + items_array[0] + ',';
      param_value += '\'' + items_array[1] + '\',';
    }

    if (param_name.length > 0) param_name = param_name.substring(0, param_name.length - 1);
    if (param_value.length > 0) param_value = param_value.substring(0, param_value.length - 1);

    let query = 'call ' + dbquery + '(' + param_value + ')';
    console.log(query);
    console.log(param_value);


    db.sequelize.query(query, {type: db.sequelize.QueryTypes.RAW }
    ).then(function (rows) {
      res.json(rows);
    });
  }


  // Retrieve all eu_activities
  app.get('/api/report/eumainactivityrate/:country/:sex/:activity',
    function (req, res) {
      euMainActivityRate.findAll({
        attributes: ['start_time', 'value'],
        where: {
          country: req.params.country,
          sex: req.params.sex,
          activity: req.params.activity
        }
      }).then(euMainActivityRate => {
        // Send all activities to Client
        res.json(euMainActivityRate);
      });
    });

  // Retrieve all cls values
  app.get('/api/cls/values/:cls',
    function (req, res) {
      db.sequelize.query('SELECT id, description FROM hack.' + req.params.cls, { type: db.sequelize.QueryTypes.SELECT })
        .then(function (rows) {
          res.json(rows);
        });
    });


// Retrieve all pivot
app.get('/api/pivot/list/:source',
function (req, res) {
  db.sequelize.query('SELECT * FROM pivots p where p.source=:source', { replacements: { source: req.params.source }, type: db.sequelize.QueryTypes.SELECT })
    .then(function (rows) {
      res.json(rows);
    });
});
//get pivot data by Id
app.get('/api/pivot/:pivotid',
function (req, res) {
  db.sequelize.query(' select vtable FROM hack.pivots  where id=:pivotid',
    { replacements: { pivotid: req.params.pivotid },type: db.sequelize.QueryTypes.SELECT }).then(function (rows) {
      console.log(rows[0].vtable);
      getReportData(res, rows[0].vtable);
    });
});








const DIR = './uploads';
 
let storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, DIR);
    },
    filename: (req, file, cb) => {
      cb(null, file.fieldname + '-' + Date.now() +  path.extname(file.originalname));
    }
});
let upload = multer({storage: storage});
 


app.post('/api/upload',upload.single('photo'), function (req, res) {
  if (!req.file) {
      console.log("No file received");
      return res.send({
        success: false
      });
  
    } else {
      console.log('file received');
      return res.send({
        success: true
      })
    }
});




  // Retrieve all report
  app.get('/api/select/:table',
    function (req, res) {
      db.sequelize.query('SELECT distinct geohash FROM  hack.' + req.params.table, {  type: db.sequelize.QueryTypes.SELECT })
        .then(function (rows) {
  var arraya=[]

          for (i = 0; i < rows.length; i++) {
            var item='';
            var geoitem={};
            try {
              item = rows[i].geohash ;
              geoitem =  Geohash.decode( rows[i].geohash) ;

              db.sequelize.query('INSERT INTO cls_geohash (geohash,lat,lon) VALUES(\''+item+'\','+geoitem.lat+','+geoitem.lon+')' ); 
            }
            catch(err) {
              console.log( 'ERROR GEOHASH ITEM :'+item);
            }

             
          var a={geohash:item,latlong:geoitem}
      
          arraya.push(a);
          }
       
          res.json(  arraya );
        });
    });


     
 
    var Geohash = require('latlon-geohash');
// => 'ecy697h3ggnm'
 
 
  }//end file
