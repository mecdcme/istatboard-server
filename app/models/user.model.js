
module.exports = (sequelize, Sequelize) => {
	const user = sequelize.define('user', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		user: Sequelize.STRING,
	  nickname: Sequelize.STRING,
	  sex: Sequelize.STRING,
	  age:Sequelize.INTEGER
	}, {
		tableName: 'users'
 });

	return user;
}
 