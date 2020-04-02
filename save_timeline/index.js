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
    
    const timeline = event
    let timelineDataArray = timeline.map(Object.values)

    

    let footprintSQL = `INSERT INTO footprints (case_id, date, time, latitude, longitude) VALUES ?`

    connection.connect((connErr) => {
          if (connErr) {
              callback(connErr);
              return;
      }
    
    console.log(connection)
    
    connection.query(footprintSQL, [timelineDataArray] , function(err, res) {
          if (err) { callback(err); return}
          else { 
            callback(null, JSON.stringify(res))
            console.log(JSON.stringify(res))
        
          }
    })
    
    })

   
  
}