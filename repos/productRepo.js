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
    var sql = 'select * from products where Active=1';
    return db.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId} and Active = 1`;
    return db.load(sql);
}

exports.loadAllByMan = (manId, offset) => {
    var sql = `select * from products where ManID = ${manId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByMan = manId => {
	var sql = `select count(*) as total from products where ManID = ${manId} and Active = 1`;
    return db.load(sql);
}

exports.add = (product) => {
	var sql = `insert into products(ProName, TinyDes, FullDes, Price, Quantity, Sold, ReceiveDate, View, CatID, ManID, Origin, Active) values('${product.ProName}', '${product.TinyDes}', '${product.FullDes}', ${product.Price}, ${product.Quantity}, 0, '${product.ReceiveDate}', 0, ${product.CatID}, ${product.ManID}, '${product.Origin}', 1)`;
	return db.save(sql);
}

exports.update = (product) => {
	var sql = `update products set ProName = '${product.ProName}', TinyDes = '${product.TinyDes}', FullDes = '${product.FullDes}', Price = ${product.Price}, Quantity = ${product.Quantity}, ReceiveDate = '${product.ReceiveDate}', CatID = ${product.CatID}, ManID = ${product.ManID}, Origin = '${product.Origin}' where ProID = ${product.ProID}`;
	return db.save(sql);
}

exports.delete = (ProID) => {
	var sql = `update products set Active = 0 where ProId = ${ProID}`;
	return db.save(sql);
}