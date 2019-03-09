const env = require('./env.js');

const Sequelize = require('sequelize');
const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  port: env.port,
  dialect: env.dialect,
  operatorsAliases: false,
  define: {
    timestamps: false
},

  pool: {
    max: env.pool.max,
    min: env.pool.min,
    acquire: env.pool.acquire,
    idle: env.pool.idle,
    idleTimeoutMillis: 500,
    evictionRunIntervalMillis: 50,
    softIdleTimeoutMillis: 50
  }
});

 
const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

//Models/tables


db.activity = require('../models/activity.model.js')(sequelize, Sequelize);
db.mood = require('../models/mood.model.js')(sequelize, Sequelize);
db.person = require('../models/person.model.js')(sequelize, Sequelize);
db.place = require('../models/place.model.js')(sequelize, Sequelize);
db.user = require('../models/user.model.js')(sequelize, Sequelize);
db.timereport = require('../models/timereport.model.js')(sequelize, Sequelize);
db.v_user_week = require('../models/v_user_week.model.js')(sequelize, Sequelize);
db.v_user_week_join = require('../models/v_user_week_join.model.js')(sequelize, Sequelize);
db.ilogdiary = require('../models/ilogdiary.model.js')(sequelize, Sequelize);
db.EuMainActivityRate = require('../models/eu_main_activity_rate.model.js')(sequelize, Sequelize);

db.ilogdiary.hasOne(db.user, {foreignKey :'id', targetKey: 'user'});
//db.ilogdiary .belongsTo(db.user, {as :'user', targetKey: 'id'});
//	ILogDiary.hasOne(User, {as: 'user', foreignKey: 'id'});
//db.activity.belongsTo(db.ilogdiary);
//db.activity.belongsTo(db.ilogdiary);
 //ILogDiary.belongsTo(User,{foreignKey: 'id'});
module.exports = db;