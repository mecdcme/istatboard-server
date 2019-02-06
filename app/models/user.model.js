
module.exports = (sequelize, Sequelize) => {
	const User = sequelize.define('user', {
	  id: {
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: true
	  },
	  nickname: Sequelize.STRING,
	  sex: Sequelize.STRING,
	  age:Sequelize.INTEGER
	}, {
		tableName: 'cls_users'
 });

	return User;
}
 