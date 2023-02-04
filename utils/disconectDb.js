const db = require('../config/db')

module.exports =  () => {
    
	setTimeout(() => {
        db.end()
    }, 3600*1000);
};