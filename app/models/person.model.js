module.exports = (sequelize, Sequelize) => {
	const Person = sequelize.define('person', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  description: Sequelize.STRING
	}, {
		tableName: 'cls_persons'
 });
	
	return Person;
}
 