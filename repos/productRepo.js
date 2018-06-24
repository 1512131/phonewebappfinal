var db = require('../fn/db');
var config = require('../config/config');

exports.loadLastestProducts = () => {
	var sql = `select * from products order by ReceiveDate DESC LIMIT ${config.TOP_PRODUCTS}`;
	return db.load(sql);
}

exports.loadMostViewProducts = () => {
	var sql = `select * from products order by View DESC LIMIT ${config.TOP_PRODUCTS}`;
	return db.load(sql);
}