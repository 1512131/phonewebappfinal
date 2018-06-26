var express = require('express');
var productRepo = require('../repos/productRepo'),
	categoryRepo = require('../repos/categoryRepo'),
	manufacturerRepo = require('../repos/manufacturerRepo'),
	orderRepo = require('../repos/orderRepo');
var moment = require('moment');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/admin/product/index');
});

router.get('/product', (req, res) => {
	res.redirect('/admin/product/index');
});

router.get('/product/index', (req, res) => {

	var p_arr = [];

	productRepo.loadAll().then(rows => {
		for (var i = 0; i < rows.length; i++) {

			p_arr.push({
				ProID: rows[i].ProID,
				ProName: rows[i].ProName,
				Price: rows[i].Price,
				Sold: rows[i].Sold,
				Quantity: rows[i].Quantity,
				ReceiveDate: moment(rows[i].ReceiveDate).format('YYYY-MM-DD'),
				View: rows[i].View,
				Origin: rows[i].Origin
			});
		}
		var vm = {
			products: p_arr,
			layout: 'admin'
		}

		res.render('admin/product', vm);
	});
});

router.get('/product/add', (req, res) => {
	var vm = {
		layout: 'admin'
	};

	res.render('admin/product/add', vm);

});

router.get('/product/edit', (req, res) => {
	var vm = {
		layout: 'admin'
	};

	res.render('admin/product/edit', vm);

});

router.get('/product/delete', (req, res) => {
	var vm = {
		layout: 'admin'
	};

	res.render('admin/product/delete', vm);

});

router.get('/category', (req, res) => {
	res.redirect('/admin/category/index');
});

router.get('/category/index', (req, res) => {
	categoryRepo.loadAll().then(rows => {
		var vm = {
			categories: rows,
			layout: 'admin'
		}

		res.render('admin/category/index', vm);
	});
});

router.get('/category/add', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/category/add', vm);
});

router.get('/category/edit', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/category/edit', vm);
});

router.get('/manufacturer', (req, res) => {
	res.redirect('/admin/manufacturer/index');
});

router.get('/manufacturer/index', (req, res) => {
	manufacturerRepo.loadAll().then(rows => {
		var vm = {
			manufacturers: rows,
			layout: 'admin'
		}
		res.render('admin/manufacturer/index', vm);
	});
});

router.get('/manufacturer/add', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/manufacturer/add', vm);
});

router.get('/manufacturer/edit', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/manufacturer/edit', vm);
});

router.get('/order', (req, res) => {
	res.redirect('/admin/order/index');
});

router.get('/order/index', (req, res) => {

	var o_arr = [];

	orderRepo.loadAll().then(rows => {

		for (var i = 0; i < rows.length; i++) {
			o_arr.push({
				OrderID: rows[i].OrderID,
				OrderDate: moment(rows[i].OrderDate).format('YYYY-MM-DD'),
				UserID: rows[i].UserID,
				Total: rows[i].Total,
				Paid: rows[i].Paid===true?'Đã thanh toán':'Chưa thanh toán'
			});
		}

		var vm = {
			orders: o_arr,
			layout: 'admin'
		}

		res.render('admin/order/index', vm);
	});
});

router.get('/order/edit', (req, res) => {

	var vm = {
		layout: 'admin'
	};

	res.render('admin/order/edit', vm);
});

module.exports = router;