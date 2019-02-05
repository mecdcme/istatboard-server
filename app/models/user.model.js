const ILogDiary = require('../models/ilogdiary.model.js');
module.exports = (sequelize, Sequelize) => {
	const User = sequelize.define('user', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  nickname: Sequelize.STRING,
	  sex: Sequelize.STRING,
	  age:Sequelize.INTEGER
	}, {
		tableName: 'cls_users'
 });
 //User.belongsTo(ILogDiary,{foreignKey: 'user'});
	return User;
}
 