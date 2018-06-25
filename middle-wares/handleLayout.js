var categoryRepo = require('../repos/categoryRepo');
var manufacturerRepo = require('../repos/manufacturerRepo');

module.exports = (req, res, next) => {
	if (req.session.isLogged === undefined) {
		req.session.isLogged = false;
	}

	var c = categoryRepo.loadAll();
    var m = manufacturerRepo.loadAll();
    Promise.all([c, m]).then(([catRows, manRows]) => {
		res.locals.layoutVM = {
           	categories: catRows,
           	manufacturers: manRows,
           	isLogged: req.session.isLogged,
           	user: req.session.user
    	};
        next();
    });
}