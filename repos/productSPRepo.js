var db = require('../fn/db');
var config = require('../config/config1');
var config1 = require('../config/config2');

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

exports.single = proId => {
    var sql = `select * from products where ProID = ${proId}`;
    return db.load(sql);
}

exports.ProToCat = proId => {
    var sql = `select * from products where ProID = ${proId}`;
    return db.load(sql);
}

exports.loadFiveByCat = (catId, price) => {
    var sql = `select * from products where CatID = ${catId} order by ABS(Price-${price}) ASC LIMIT 5`;
    return db.load(sql);
}

exports.loadFiveByMan = (manId, price) => {
    var sql = `select * from products where ManID = ${manId} order by ABS(Price-${price}) ASC LIMIT 5`;
    return db.load(sql);
}