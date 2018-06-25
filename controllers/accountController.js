var express = require('express');
var SHA256 = require('crypto-js/sha256');
var moment = require('moment');

var accountRepo = require('../repos/accountRepo');
var restrictLogged = require('../middle-wares/restrictLogged');

var router = express.Router();

router.get('/register', restrictLogged, (req, res) => {
	res.render('account/register');
});

router.post('/register', (req, res) => {
	var dob = moment(req.body.dob, 'D/M/YYYY').format('YYYY-MM-DD');
	var user = {
		username: req.body.username,
		password: SHA256(req.body.password).toString(),
		name: req.body.name,
		email: req.body.email,
		dob: dob,
		permission: 0
	};
	accountRepo.add(user).then(value => {
		res.render('account/register');
	});
});

router.get('/login', restrictLogged, (req, res) => {
	res.render('account/login');
});

router.post('/login', (req, res) => {
	var user = {
		username: req.body.username,
		password: SHA256(req.body.password).toString()
	}

	accountRepo.login(user).then(rows => {
		if (rows.length > 0) {
			req.session.isLogged = true;
			req.session.user = rows[0];
			req.session.cart = [];

			var url = '/';
			if (req.query.retUrl) {
				url = req.query.retUrl;
			}

			res.redirect(url);
		} else {
			var vm = {
				isFail: true,
				errorMessage: 'Tài khoản hoặc mật khẩu không đúng!'
			};
			res.render('account/login', vm);
		}
	});
});

router.post('/logout', (req, res) => {
	req.session.isLogged = false;
	req.session.user = null;
	res.redirect(req.headers.referer);
});
module.exports = router;