module.exports = function(app) {
 
   const db = require('../config/db.config.js');
   const ilogdiary = db.ilogdiary;
   const user = db.user;
   const vUserWeek = db.v_user_week; 
  
    // Retrieve all ilogdiaries
    app.get('/api/ilogdiary',
    function (req, res)  {
        ilogdiary.findAll({
            include:[{
              model:user
            }],
            'limit':10
        }).then(ilogdiaries => {
          // Send all customers to Client
          res.json(ilogdiaries);
        });
    });
 
    // Retrieve a single ilogdiaries by Id
    app.get('/api/ilogdiary/:ilogdiaryId',
     function (req, res) {	
        ilogdiary.findByPk(req.params.ilogdiaryId ).then(ilogdiary => {
            res.json(ilogdiary);
        });
    });
 
      
    // Retrieve all ilogdiaries
    app.get('/api/report/userweek',
    function (req, res)  {
        vUserWeek.findAll().then(vUserWeeks => {
          // Send all customers to Client
          res.json(vUserWeeks);
        });
    });
   
}
