module.exports = (sequelize, Sequelize) => {
	const VUserWeek = sequelize.define('vuserweek', {
	 	user:  Sequelize.INTEGER,
		 
		activity: Sequelize.INTEGER,
		mood: Sequelize.INTEGER,
		place: Sequelize.INTEGER,
		person: Sequelize.INTEGER,
		hours: Sequelize.INTEGER

	}, {
			tableName: 'view_user_week'
		 
	}
	);

//	ILogDiary.hasOne(User, {as: 'user', foreignKey: 'id'});
	//ILogDiary.belongsTo(User,{foreignKey: 'id'});
	//ILogDiary.hasOne(User,{foreignKey: 'user'});
	VUserWeek.removeAttribute('id');
	return VUserWeek;
}

