module.exports = (sequelize, Sequelize) => {
	const Activity = sequelize.define('activity', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  description: Sequelize.STRING
	}, {
		tableName: 'cls_activities'
 });
	
	return Activity;
}
 