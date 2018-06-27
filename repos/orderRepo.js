var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from orders';
    return db.load(sql);
}

exports.single = (id) => {
	var sql = `select * from orders where OrderID = ${id}`;
	return db.load(sql);
}

exports.update = (id, stt) => {
	var sql = `update orders set State = ${stt} where OrderID = ${id}`;
	return db.save(sql);
}