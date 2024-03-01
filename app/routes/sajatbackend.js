const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function kapcsolat(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'webes_utazas_lg_tv'
    })
    
    connection.connect()
    
  }
  
  
  app.get('/film', (req, res) => {
    kapcsolat()
    connection.query('SELECT * from film', function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
  })


  app.post('/szavazatfelvitel', (req, res) => {
    kapcsolat()
    connection.query('insert into szavazat values (null,'+req.body.bevitel1+')', function (err, rows, fields) {
      if (err) {
        console.log("Szavazatát rögzítettük!")
        res.send("Szavazatát rögzítettük!")
      }
      else {
      console.log("Szavazatát rögzítettük!")
      res.send("Szavazatát rögzítettük!")
    }
    })
    connection.end()
  })
app.post('/keres', (req, res) => {
  kapcsolat()    
    let parancs='SELECT * from film where film_cim like "%'+req.body.bevitel1+'%"'
    connection.query(parancs, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
      }
    else{
      console.log(rows)
      res.send(rows)
    }
     
    })
    
    connection.end()
 })
 
  
//Viktor backend végpont

app.get('/erdekessegek', (req, res) => {
  kapcsolat()
  connection.query('SELECT * from erdekessegek', function (err, rows, fields) {
    if (err) throw err
    console.log(rows)
    res.send(rows)
  })
  
  connection.end()
})

app.post('/keresvaros', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM varosok inner join erdekessegek on erdekessegek.varos_id=varosok.varos_id WHERE varos_neve like "%${req.body.bevitel1}%"`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
  })
  connection.end() 
  })

  app.get('/diagram', (req, res) => {
    kapcsolat()
    connection.query('SELECT film.film_cim, count(*) as darabszam  from szavazat INNER join film on film.film_id=szavazat.szavazat_film GROUP by film_id' , function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
  })

  app.delete('/torles_erd', (req, res) => {
    kapcsolat()
    connection.query(`delete from erdekessegek where erd_id=${req.body.bevitel1}`, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
        res.send("Hiba")
      }
      else {
      console.log("Sikeres törlés")
      res.send("Sikeres törlés")
    }
    })
    connection.end()
  })

  app.delete('/torles_rep', (req, res) => {
    kapcsolat()
    connection.query(`delete from repulok where repulok_id=${req.body.bevitel1}`, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
        res.send("Hiba")
      }
      else {
      console.log("Sikeres törlés")
      res.send("Sikeres törlés")
    }
    })
    connection.end()
  })

  app.delete('/torles_varos', (req, res) => {
    kapcsolat()
    connection.query(`delete from varosok where varos_id=${req.body.bevitel1}`, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
        res.send("Hiba")
      }
      else {
      console.log("Sikeres törlés")
      res.send("Sikeres törlés")
    }
    })
    connection.end()
  })

  /// SAJÁT 
  app.delete('/Torles_orszag', (req, res) => {
    kapcsolat()
    connection.query(`delete from orszag where Orszag_id=${req.body.bevitel1}`, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
        res.send("Hiba")
      }
      else {
      console.log("Sikeres törlés")
      res.send("Sikeres törlés")
    }
    })
    connection.end()
  })



  app.delete('/Torles_nevezetessegek', (req, res) => {
    kapcsolat()
    connection.query(`delete from nevezetessegek where Nevezetesseg_id=${req.body.bevitel1}`, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
        res.send("Hiba")
      }
      else {
      console.log("Sikeres törlés")
      res.send("Sikeres törlés")
    }
    })
    connection.end()
  })

  app.post('/keresnevezetessegek', (req, res) => {
    kapcsolat()
    
    connection.query(`SELECT * FROM nevezetessegek INNER JOIN orszag ON nevezetessegek.Orszag_id = orszag.Orszag_id WHERE Nevezetesseg_nev like "${req.body.bevitel1}%"`, (err, rows, fields) => {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
    })
    connection.end() 
    })

    app.post('/keresorszagok', (req, res) => {
      kapcsolat()
      
      connection.query(`SELECT * FROM orszag WHERE Orszag_nev like "${req.body.bevitel1}%"`, (err, rows, fields) => {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
      })
      connection.end() 
      })
  
  
  

    app.get('/orszag', (req, res) => {
    
      kapcsolat()
      connection.query('SELECT * FROM orszag', (err, rows, fields) => {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      connection.end() 
      })
  
      app.get('/nevezetesseg_get', (req, res) => {
    
        kapcsolat()
        connection.query('SELECT * FROM nevezetessegek', (err, rows, fields) => {
          if (err) throw err
        
          console.log(rows)
          res.send(rows)
        })
        connection.end() 
        })
};
