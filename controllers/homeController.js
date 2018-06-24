var express = require('express');
var productRepo = require('../repos/productRepo');

var router = express.Router();

router.get('/', (req, res) => {
	var p1 = productRepo.loadLastestProducts();
	var p2 = productRepo.loadMostViewProducts();
	Promise.all([p1, p2]).then(([p1Rows, p2Rows]) => {
		var vm = {
			lastestProducts: p1Rows,
			mostViewProducts: p2Rows
		};
		res.render('home/index', vm);
	});
});
module.exports = router;