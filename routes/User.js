const express = require("express")
const router = express.Router()
const bcrypt = require("bcrypt")
const bodyParser = require("body-parser")
const cookieParser = require("cookie-parser")
const session = require("express-session")



const db = require('../config/db')
const saltRounds = 10

const sendEmail = require('../utils/sendEmail')
const prepairTwetts = require('../utils/prepairtweeta')
const crypto = require("crypto")
const { AsyncResource } = require("async_hooks")

function LoginClass(Userid, Username, user_img, about_me ) {
  this.Userid = Userid;
  this.Username = Username;
  this.user_img = user_img;
  this.about_me = about_me;
}

router.post("/register", async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  const image = req.body.image;
  const email = req.body.email;
  const creationDate = req.body.creationDate;
  const aboutMe = req.body.aboutMe

  const token =  crypto.randomBytes(32).toString("hex")

  bcrypt.hash(password, saltRounds, (err, hash) => {
    if (err) {
      console.log(err);
    }
    db.query(
      "INSERT INTO users (Username , password, user_img, Email, creationDate, about_me, token) VALUES (?, ?, ?, ?, ?, ?, ?);",
      [username, hash, image, email, creationDate, aboutMe, token],
     async (err, results) => {
        console.log(err);
       
        const url = `${process.env.BASE_URL}user/${username}/verify/${token}`;
        try{
         await sendEmail(email, "Verify Email", url)
         res.send({ emailSent : true,  message: "Your account has been successfully registered. A verification email has been sent to your email"});
        }catch (error){
            console.log(error)
            res.status(500).send({ message: "Internal Server Error" });
        }
      }
    );

  });


});

router.get("/:id/verify/:token/", async (req, res) => {
  const username = req.params.id 
  const token = req.params.token
	try {
    db.query(
      "SELECT * FROM users WHERE Username = ?;",
      username,
      (err, result) => {
        if (err) {
          res.send({ err: err });
        }
        if (result.length > 0) {
          //console.log('base de datos',result[0].token)

          if (result[0].token === token) {
            db.query(
              "UPDATE users SET verified = 1, token = NULL WHERE Username = ?;",
              username,
              (err, result) => {
         
                if (err) {
                  res.send({ err: err, verified: false });
                }
                if (result.changedRows === 1) {
                  res.status(200).send({ message: "Email verified successfully", verified: true });
            
                }
              }

              )
            console.log("coinciden los tokens");
          } else {
            res.send({ message: "no coinciden los tokens" });
          }
        } else {
          res.send({ message: "User doesn't exist" });
        }
      }
    );

	} catch (error) {
		res.status(500).send({ message: "Internal Server Error" });
	}
});

router.get("/login", (req, res) => {
  if (req.session.user) {

         console.log('Si hay una sesion iniciada')
          const loginResponse = new LoginClass(
            req.session.user[0][0].Userid,
            req.session.user[0][0].Username,
            req.session.user[0][0].user_img,
            req.session.user[0][0].about_me,
            
          );

          res.send({ loginResponse, loggedIn: true, allUsers: req.session.user[1] });
  } else {
    res.send({
      loggedIn: false,
      message: "User is not logged" 
    });
  }
});

 router.post("/login", (req, res) => {
   const username = req.body.username;
   const password = req.body.password;

   db.query(
     "SELECT * FROM users WHERE Username = ? LIMIT 1; SELECT Userid, Username, user_img FROM `users`; ",
     username,
     (err, result) => {
       if (err) {
         res.send({ err: err });
       }
     
       if (result.length > 0) {
         bcrypt.compare(
           password.toString(),
           result[0][0].password,
           (error, response) => {
             if (response) {
               req.session.user = result;
             
               if (result[0][0].verified === 1) {
               
                 const loginResponse = new LoginClass(
                   result[0][0].Userid,
                   result[0][0].Username,
                   result[0][0].user_img,
                   result[0][0].about_me
                 );
                 res.send({ loginResponse, loggedIn: true, allUsers: result[1] });
               } else {
                 res.send({
                   message: "Usuario no verificado",
                   loggedIn: false,
                 });
               }
             } else {
               res.send({ message: "Wrong username/password Combination" });
             }
           }
         );
       } else {
         res.send({ message: "User doesn't exist" });
       }
     }
   );
 });

 router.post("/restorepassword", async (req, res) => {
  const username = req.body.username;

  db.query(
    "SELECT * FROM users WHERE Username = ?;",
    username,
   async (err, result) => {
      if (err) {
        res.send({ err: err });
      }
      if (result.length > 0) {

              if (result[0].verified === 1 ){
                if (result[0].token === null){
                  const token =  crypto.randomBytes(32).toString("hex")

                  db.query(
                     "UPDATE users SET  token = ? WHERE Username = ?;",
                    [token,  username],
                    (err, results) => {
                      console.log('error db query',err);
                      console.log('results db query',results);
                    }
                  );
              
             
                const url = `${process.env.BASE_URL}user/${username}/restore/${token}`;
                try{
                 await sendEmail(result[0].Email, "Restore Password", url)
                 res.send({ emailSent : true,  message: "A verification email has been sent to your email"});
                }catch (error){
                    console.log(error)
                    res.status(500).send({ message: "Internal Server Error" });
  
               }
                }else{
                  res.send({ message: "A message has already been sent to your email. Please check your mail." });
                }
                }else{
               res.send({ message: "Unverified user" });
              }  

          } else {
        res.send({ message: "User doesn't exist" });
      }
    }
  );
});


router.get("/:id/restore/:token/", async (req, res) => {
  const username = req.params.id 
  const token = req.params.token
	try {
    db.query(
      "SELECT * FROM users WHERE Username = ?;",
      username,
      (err, result) => {
        if (err) {
          res.send({ err: err });
        }
        if (result.length > 0) {

          if (result[0].token === token) {
            res.status(200).send({ message: "User is able to change password", passwordAble: true });
            
          } else {
            res.send({ message: "Authentication issues" });
          }
        } else {
          res.send({ message: "User doesn't exist" });
        }
      }
    );

	} catch (error) {
		res.status(500).send({ message: "Internal Server Error" });
	}
});

router.post("/newpassword", async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  const token = req.body.token;
  db.query(
    "SELECT * FROM users WHERE Username = ?;",
    username,
   async (err, result) => {
      if (err) {
        res.send({ err: err });
      }
      if (result.length > 0) {

                if (result[0].token === token){
                  bcrypt.hash(password, saltRounds, (err, hash) => {
                    if (err) {
                      console.log(err);
                    }
                    db.query(
                      "UPDATE users SET  password = ?, token = NULL WHERE Username = ?;",
                      [hash, username],
                      (err, results) => {
                        console.log("error db query", err);
                        console.log("results db query", results);
                        res.send({ message: "Password changed", passwordChanged: true });
                      }
                    );
                  });

                }else{
                  res.send({ message: "Your password has already been changed" } );
                }
          } else {
        res.send({ message: "Internal Server Error" });
      }
    }
  );




});


 // DELETE /api/auth/logout
router.delete('/logout', (req, res) => {
  if (req.session) {
    req.session.destroy(err => {
      if (err) {
        res.status(400).send('Unable to log out')
      } else {
        res.send('Logout successful')
      }
    });
  } else {
    res.end()
  }
})


router.get("/infouser/:id", (req, res)=>{
  const id =Number(req.params.id)

db.query("SELECT * FROM users WHERE Userid = ?; SELECT * FROM twetts WHERE users_Userid = ?",[id,id], async ( err, results) =>{ 
   if (err) {
      console.log(err)
      res.send({ status: false })
   }
   const infouser = results[0]
   const tosend = await prepairTwetts(results[1]);
   //puse hasmore en false porque por ahora se van a traer todos los tweets del usuario
   //podes usar el status true para manipular el apagado de los spinners y mostrar el contenido
   res.send({ status: true,infouser: infouser, twsUser: tosend,hasMore:false })
})
})


 module.exports = router;