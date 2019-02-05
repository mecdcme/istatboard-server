module.exports = (sequelize, Sequelize) => {
	const ILogDiary = sequelize.define('ilogdiary', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  user: Sequelize.INTEGER,
	  activity: Sequelize.INTEGER,
	  mood: Sequelize.INTEGER,
	  place: Sequelize.INTEGER,
    person:Sequelize.INTEGER,
	  timepoint: Sequelize.DATE
	 
	}, {
		tableName: 'ilogdiary'
 });
	
	return ILogDiary;
}
 