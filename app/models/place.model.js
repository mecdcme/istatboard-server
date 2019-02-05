module.exports = (sequelize, Sequelize) => {
	const Place = sequelize.define('place', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  description: Sequelize.STRING
	}, {
		tableName: 'cls_places'
 });
	
	return Place;
}
 