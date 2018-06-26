var db = require('../fn/db');
var config = require('../config/config');

exports.loadLastestProducts = () => {
	var sql = `select * from products order by ReceiveDate DESC LIMIT ${config.TOP_PRODUCTS}`;
	return db.load(sql);
}

exports.loadMostBuyProducts = () => {
	var sql = `select * from products order by QuantitySold DESC LIMIT ${config.TOP_PRODUCTS}`;
	return db.load(sql);
}

exports.loadMostViewProducts = () => {
	var sql = `select * from products order by View DESC LIMIT ${config.TOP_PRODUCTS}`;
	return db.load(sql);
}

exports.single = proId => {
	var sql = `select * from products where ProID='${proId}'`;
	return db.load(sql);
}

exports.loadAll = () => {
    var sql = 'select * from products';
    return db.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId}`;
    return db.load(sql);
}

exports.loadAllByMan = (manId, offset) => {
    var sql = `select * from products where ManID = ${manId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByMan = manId => {
	var sql = `select count(*) as total from products where ManID = ${manId}`;
    return db.load(sql);
}