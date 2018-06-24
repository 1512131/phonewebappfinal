var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select CatID,upper(CatName) as CatName from categories';
	return db.load(sql);
}