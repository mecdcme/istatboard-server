module.exports = (sequelize, Sequelize) => {
	const VUserWeekjoin = sequelize.define('vuserweekjoin', {
		user: Sequelize.STRING,

		activity: Sequelize.STRING,
		mood: Sequelize.STRING,
		place: Sequelize.STRING,
		person: Sequelize.STRING,
		hours: Sequelize.INTEGER

	}, {
			tableName: 'view_user_week_join'

		}
	);


	VUserWeekjoin.removeAttribute('id');
	return VUserWeekjoin;
}

