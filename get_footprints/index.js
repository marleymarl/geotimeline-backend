exports.handler = (event, context, callback) => {
  var mysql = require('mysql');
  context.callbackWaitsForEmptyEventLoop = false

var connection =  mysql.createConnection({
  host     : process.env.DB_HOST,
  user     : process.env.DB_USER,
  password : process.env.DB_PASS,
  database : process.env.DB_DB,
  
})

    console.log(JSON.stringify(event))
    
  

    

    let footprintQuery = `SELECT case_id, date, time, latitude, longitude FROM footprints`

    connection.connect((connErr) => {
          if (connErr) {
              callback(connErr);
              return;
      }
    
    
    
    connection.query(footprintQuery, function(err, res) {
          if (err) { callback(err); return}
          else { 
            callback(null, JSON.stringify(res))
        
          }
    })
    
    })

   
  
}