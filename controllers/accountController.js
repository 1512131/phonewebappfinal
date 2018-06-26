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
	accountRepo.get(req.body.username).then(rows => {
		if (rows.length > 0) {
			var error = "Tên đăng nhập đã được sử dụng!";
			var vm = {
				username: req.body.username,
				password: req.body.password,
				retype: req.body.retype,
				name: req.body.name,
				email: req.body.email,
				dob: req.body.dob,
				usernameErrorMessage: error
			};
			res.render('account/register', vm);
		} else {
			var arr_errorMessage = [];
			var arr_isError = [];
			if (req.body.username.length < 4 || req.body.username.length > 32) {
				var error = "Tên đăng nhập gồm 4-32 kí tự!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else if (!req.body.username.match(/^[A-Za-z0-9_]{4,32}$/)) {
				var error = "Tên đăng nhập chỉ bao gồm chữ, số và dấu _";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			if (req.body.password.length < 4 || req.body.password.length > 32) {
				var error = "Mật khẩu gồm 4-32 kí tự!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			if (req.body.retype.length === 0) {
				var error = "Chưa nhập lại mật khẩu!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else if (req.body.password.indexOf(req.body.retype)===-1 || req.body.retype.indexOf(req.body.password)===-1) {
				var error = "Nhập lại mật khẩu không trùng khớp!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			if (req.body.name.length === 0) {
				var error = "Chưa nhập họ tên!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else if (req.body.name.length > 50) {
				var error = "Họ tên tối đa 50 kí tự!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			if (req.body.email.length === 0) {
				var error = "Chưa nhập email!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else if (req.body.email.length > 50) {
				var error = "Email tối đa 50 kí tự!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			if (req.body.dob.length === 0) {
				var error = "Chưa nhập ngày sinh!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else if (!moment(req.body.dob, 'D/M/YYYY').isValid()
				||  new Date(moment(req.body.dob, 'D/M/YYYY').format('YYYY-MM-DD')).getTime()>new Date().getTime()) {
				var error = "Ngày sinh không hợp lệ!";
				arr_errorMessage.push(error);
				arr_isError.push(true);
			} else {
				var error = "";
				arr_errorMessage.push(error);
			}
			Promise.all([arr_errorMessage, arr_isError]).then(([errorMessages, isErrors]) => {
				if (isErrors.length === 0) {
					var user = {
						username: req.body.username,
						password: SHA256(req.body.password).toString(),
						name: req.body.name,
						email: req.body.email,
						dob: moment(req.body.dob, 'D/M/YYYY').format('YYYY-MM-DD'),
						permission: 0
					};
					accountRepo.add(user).then(value => {
						var vm = {
							isSuccess: true
						};
						res.render('account/register', vm);
					}).catch(err => {
						var vm = {
							isFail: true
						};
						res.render('account/register', vm);
					});
				} else {
					var vm = {
						username: req.body.username,
						password: req.body.password,
						retype: req.body.retype,
						name: req.body.name,
						email: req.body.email,
						dob: req.body.dob,
						usernameErrorMessage: errorMessages[0],
						passwordErrorMessage: errorMessages[1],
						retypeErrorMessage: errorMessages[2],
						nameErrorMessage: errorMessages[3],
						emailErrorMessage: errorMessages[4],
						dobErrorMessage: errorMessages[5]
					};
					res.render('account/register', vm);
				}
			}).catch(err => {
				var vm = {
					isFail: true
				};
				res.render('account/register', vm);
			});
		}
	}).catch(err => {
		var vm = {
			isFail: true
		};
		res.render('account/register', vm);
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
	}).catch(err => {
		var vm = {
			isFail: true,
			errorMessage: 'Lỗi đăng nhập!'
		};
		res.render('account/login', vm);
	});
});

router.post('/logout', (req, res) => {
	req.session.isLogged = false;
	req.session.user = null;
	res.redirect(req.headers.referer);
});

module.exports = router;