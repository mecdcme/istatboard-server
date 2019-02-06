const user = require('../models/user.model.js');
module.exports = (sequelize, Sequelize) => {
	const ilogdiary = sequelize.define('ilogdiary', {
		id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		// user: Sequelize.INTEGER,
	 	activity: Sequelize.INTEGER,
		mood: Sequelize.INTEGER,
		place: Sequelize.INTEGER,
		person: Sequelize.INTEGER,
		timepoint: Sequelize.DATE

	}, {
			tableName: 'ilogdiary'
		 
	}
	);


//	ILogDiary.hasOne(User, {as: 'user', foreignKey: 'id'});
	//ILogDiary.belongsTo(User,{foreignKey: 'id'});
	//ILogDiary.hasOne(User,{foreignKey: 'user'});
 
	return ilogdiary;
}

