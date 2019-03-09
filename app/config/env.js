const env = {
  database: 'hack',
  username: 'root',
  password: 'root',
  host: 'localhost',
  port: 3306,
  dialect: 'mysql',
  pool: {
	  max:100,
    min: 0,
    idle: 200000,
	  acquire: 30000,
	  idle: 1000000
  }
};

module.exports = env;
 