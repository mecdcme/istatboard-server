module.exports = (sequelize, Sequelize) => {
	const Mood = sequelize.define('mood', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  description: Sequelize.STRING
	}, {
		tableName: 'cls_moods'
 });
	
	return Mood;
}
 