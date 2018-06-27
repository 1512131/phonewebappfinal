var express = require('express');
var productRepo = require('../repos/productSPRepo');
var config = require('../config/config1');
var productRepo1 = require('../repos/productRepo');

var router = express.Router();

router.get('/byCat/:catId', (req, res) => {
    var catId = req.params.catId;

    var page = req.query.page;
    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.TOP_PRODUCTS;

    var p1 = productRepo.loadAllByCat(catId, offset);
    var p2 = productRepo.countByCat(catId);
    Promise.all([p1, p2]).then(([pRows, countRows]) => {
        // console.log(pRows);
        // console.log(countRows);

        var total = countRows[0].total;
        var nPages = total / config.TOP_PRODUCTS;
        if (total % config.TOP_PRODUCTS > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers
        };
        res.render('product/byCat', vm);
    });
});

router.get('/byMan/:manId', (req, res) => {
    var manId = req.params.manId;

    var page = req.query.page;
    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.TOP_PRODUCTS;

    var p1 = productRepo.loadAllByMan(manId, offset);
    var p2 = productRepo.countByMan(manId);
    Promise.all([p1, p2]).then(([pRows, countRows]) => {
        var total = countRows[0].total;
        var nPages = total / config.TOP_PRODUCTS;
        if (total % config.TOP_PRODUCTS > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            products: pRows,
            noProducts: pRows.length === 0,
            page_numbers: numbers
        };
        res.render('product/byMan', vm);
    });
});

router.get('/detail/:proId', (req, res) => {
    var proId = req.params.proId;
    productRepo.ProToCat(proId).then(rows => {
        if (rows.length > 0) {
            var p1 = productRepo.loadFiveByCat(rows[0].CatID,rows[0].Price);
            var p2 = productRepo.loadFiveByMan(rows[0].ManID,rows[0].Price);
            Promise.all([p1, p2]).then(([p1Rows, p2Rows]) => {
                var vm = {
                    product: rows[0],
                    lastestProducts: p1Rows,
                    mostViewProducts: p2Rows
                }
                res.render('product/detail', vm);
            });
        } else {
            res.redirect('/');
        }
    });
});

module.exports = router;