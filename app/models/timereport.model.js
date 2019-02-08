module.exports = (sequelize, Sequelize) => {
	const timereport = sequelize.define('timereport', {
	  user:Sequelize.STRING,
		moods: Sequelize.STRING,
		timeps: Sequelize.STRING
		
	}, {
		tableName: 'view_user_mood_time'
 });
 timereport.removeAttribute('id');
	return timereport;
}
 