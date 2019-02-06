const env = require('./env.js');

const Sequelize = require('sequelize');
const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,
  operatorsAliases: false,
  define: {
    timestamps: false
},

  pool: {
    max: env.max,
    min: env.pool.min,
    acquire: env.pool.acquire,
    idle: env.pool.idle
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
db.v_user_week = require('../models/v_user_week.model.js')(sequelize, Sequelize);
db.ilogdiary = require('../models/ilogdiary.model.js')(sequelize, Sequelize);

db.ilogdiary .belongsTo(db.user, {foreignKey: 'id', targetKey: 'id'});
//	ILogDiary.hasOne(User, {as: 'user', foreignKey: 'id'});
//db.activity.belongsTo(db.ilogdiary);
//db.activity.belongsTo(db.ilogdiary);
 //ILogDiary.belongsTo(User,{foreignKey: 'id'});
module.exports = db;