var express = require('express');

var router = express.Router();


router.get('/', (req, res) => {
	res.redirect('/admin/product')
});

router.get('/product', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/product', vm);
});

router.get('/category', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/category', vm);
});

router.get('/manufacture', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/manufacture', vm);
});

router.get('/order', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/order', vm);
});

module.exports = router;