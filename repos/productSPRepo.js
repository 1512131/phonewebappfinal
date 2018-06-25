var db = require('../fn/db');
var config = require('../config/config1');

exports.loadAll = () => {
    var sql = 'select * from products';
    return db.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.TOP_PRODUCTS} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId}`;
    return db.load(sql);
}

exports.loadAllByMan = (manId, offset) => {
    var sql = `select * from products where ManID = ${manId} limit ${config.TOP_PRODUCTS} offset ${offset}`;
    return db.load(sql);
}

exports.countByMan = manId => {
	var sql = `select count(*) as total from products where ManID = ${manId}`;
    return db.load(sql);
}