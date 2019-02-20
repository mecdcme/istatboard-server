module.exports = (sequelize, Sequelize) => {
	const EuMainActivityRate = sequelize.define('eumainactivityrate',{
		activity: Sequelize.STRING,
		start_time: Sequelize.STRING,
		unit: Sequelize.STRING,
        sex: Sequelize.STRING,
        country: Sequelize.STRING,
        year: Sequelize.INTEGER,
		value: Sequelize.INTEGER
	}, {
		tableName: 'eu_main_activity_rate'
	});

	EuMainActivityRate.removeAttribute('id');
	return EuMainActivityRate;
}