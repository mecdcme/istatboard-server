module.exports = function(app) {
 
   const db = require('../config/db.config.js');
   const iLogDiary = db.ilogdiary;
  
    // Retrieve all ilogdiaries
    app.get('/api/ilogdiary',
    function (req, res)  {
        iLogDiary.findAll().then(ilogdiaries => {
          // Send all customers to Client
          res.json(ilogdiaries);
        });
    });
 
    // Retrieve a single ilogdiaries by Id
    app.get('/api/ilogdiary/:ilogdiaryId',
     function (req, res) {	
        iLogDiary.findById(req.params.ilogdiaryId).then(ilogdiary => {
            res.json(ilogdiary);
        });
    });
 
   
}
