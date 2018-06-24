var db = require('../fn/db.js');

exports.loadAll = () => {
	var sql = 'select ManID,upper(ManName) as ManName from manufacturers';
	return db.load(sql);
}