module.exports = function (app) {

  const db = require('../config/db.config.js');
  const ilogdiary = db.ilogdiary;
  const user = db.user;
  const vUserWeek = db.v_user_week;
  const vUserWeekJoin = db.v_user_week_join;
  const timereport = db.timereport;
  const euMainActivityRate = db.EuMainActivityRate;

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
  // Retrieve all ilogdiaries
  app.get('/api/report/time',
    function (req, res) {
      timereport.findAll().then(timereports => {
        // Send all customers to Client
        res.json(timereports);
      });
    });

  // Retrieve all ilogdiaries
  app.get('/api/report/:name',
    function (req, res) {
      db.sequelize.query('SELECT * FROM ' + req.params.name, { type: db.sequelize.QueryTypes.SELECT })
        .then(function (rows) {
          res.json(rows);
        });
    });
  
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
}
