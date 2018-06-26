var express = require('express');

var cartRepo = require('../repos/cartRepo');
var productRepo = require('../repos/productRepo');
var restrictNotLogged = require('../middle-wares/restrictNotLogged');

var router = express.Router();

router.get('/', restrictNotLogged, (req, res) => {
	if (req.session.cart.length === 0) {
        var vm = {
            isEmpty: true
        };
        res.render('cart/index', vm);
    } else {
        var arr_p = [];
        for (var i = 0; i < req.session.cart.length; i++) {
            var cartItem = req.session.cart[i];
            var p = productRepo.single(cartItem.ProId);
            arr_p.push(p);
        }

        var items = [];
        var sumAmount = 0;
        Promise.all(arr_p).then(result => {
            for (var i = result.length - 1; i >= 0; i--) {
                var pro = result[i][0];
                var item = {
                    Product: pro,
                    Quantity: req.session.cart[i].Quantity,
                    Amount: pro.Price * req.session.cart[i].Quantity
                };
                items.push(item);
                sumAmount += item.Amount;
            }

            var vm = {
                isEmpty: false,
                items: items,
                sumAmount: sumAmount
            };

            res.render('cart/index', vm);
        });
    }
});

router.post('/increase', (req, res) => {
    var item = {
        ProId: req.body.proId,
        Quantity: 1
    };
    cartRepo.add(req.session.cart, item);
    res.redirect(req.headers.referer);
});

router.post('/decrease', (req, res) => {
	var item = {
		ProId: req.body.proId,
	};
	cartRepo.decrease(req.session.cart, item);
	res.redirect(req.headers.referer);
});

router.post('/remove', (req, res) => {
	cartRepo.remove(req.session.cart, req.body.proId);
	res.redirect(req.headers.referer);
});

module.exports = router;