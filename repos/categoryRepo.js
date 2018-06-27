var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select CatID,upper(CatName) as CatName from categories';
	return db.load(sql);
}

exports.single = (CatID) => {
	var sql = `select CatID,upper(CatName) as CatName from categories where CatID = ${CatID}`;
	return db.load(sql);
}

exports.update = (cat) => {
	var sql = `update categories set CatName = '${cat.CatName}' where CatID = ${cat.CatID}`;
	return db.save(sql);
}

exports.add = (CatName) => {
	var sql = `insert into categories(CatName) values('${CatName}')`;
	return db.save(sql);
}