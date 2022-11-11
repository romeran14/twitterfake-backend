const express = require("express")
const router = express.Router()

const db = require('../config/db')
const prepairTwetts = require('../utils/prepairtweeta')

const findTwRef = (twMother) => {

  let ref = null;

  if(twMother.Retweet !==null || twMother.LikesId !==null ){
    const arr = [

      twMother.Retweet,
      twMother.LikesId
    ];
  
    if (arr.length === 0) {
      return -1;
    }
  
    var max = arr[0];
    var maxIndex = 0;
  
    for (var i = 1; i < arr.length; i++) {
      if (arr[i] > max) {
        maxIndex = i;
        max = arr[i];
      }
    }
  
    switch (maxIndex) {
  
      case 0:
        ref = twMother.Retweet;
        break;
      case 1:
        ref = twMother.LikesId;
        break;
      default:
        ref = twMother.idtwetts;
    }
   
  }else{
      ref= twMother.idtwetts
  }
  return ref;
};

router.post('/', (req, res) => {
    const idusername = req.body.userid;
    const text = req.body.text;
    const image = req.body.image;
    const retweet = req.body.retweet;
    const date = req.body.creationDate;
    db.query("INSERT INTO twetts (users_Userid, text, img, Retweet,  creationDate) VALUES (?, ?, ?, ?, ?);", [ idusername, text, image, retweet, date],
    (err, results) => {
       console.log(err)
      
       res.send({results, message: 'Tweet has been created succesfully'});
    }
    );
 })

 router.post('/deletetweet', (req, res) => {
  const idtwetts = req.body.idtwetts;
  const retweetId = req.body.retweetId;
  const likesId = req.body.likesId;
  const is_comment = req.body.is_comment

  db.query("DELETE twetts FROM twetts WHERE idtwetts = ? ", idtwetts,
  (err, results) => {
     console.log(err)

     res.send({results, message: 'Tweet has been deleted Succesfully', status: true});
  }
  );

  if (retweetId !== null){
    db.query(
      "UPDATE twetts SET Retweet_count=Retweet_count - 1 WHERE idtwetts=?;",
      retweetId,
      (err, results) => {
        if (err) {
          console.log(`fallo descontar RT`, err);
        }
     
      }
    );
  }

  if (likesId !== null){
    db.query(
      "UPDATE twetts SET Like_count=Like_count - 1 WHERE idtwetts=?;",
      likesId,
      (err, results) => {
        if (err) {
          console.log(`fallo descontar lk`, err);
        }
      
      }
    );
  }

  if (is_comment !== null){
    db.query(
      "UPDATE twetts SET Comments_count=Comments_count - 1 WHERE idtwetts=?;",
      is_comment,
      (err, results) => {
        if (err) {
          console.log(`fallo descontar comment`, err);
        }
       
      }
    );
  }

})

 router.post("/uploadretweet", (req, res) => {
   const idusername = req.body.userid;
   const retweet = req.body.retweetId;
   const date = req.body.creationDate;
   const text = req.body.text;
   const img = req.body.img;
   const retweet_state = req.body.retweet_state
   const Is_comment = req.body.Is_comment
   const Comment_original_username = req.body.Comment_original_username


  if(retweet_state){
    db.query(
      "UPDATE twetts SET Retweet_count=Retweet_count-1 WHERE idtwetts=?; DELETE FROM twetts WHERE users_Userid= ? AND text=? ORDER BY idtwetts DESC LIMIT 1;",
      [retweet,idusername, text],
      (err, results) => {
        if (err) {
          console.log(`fallo`, err);
        }
        //res.send(results)
      
      }
    );
  }else{
    db.query(
      "UPDATE twetts SET Retweet_count=Retweet_count+1 WHERE idtwetts=?;INSERT INTO twetts (users_Userid, text, img, Retweet, creationDate, Is_comment, Comment_original_username) VALUES (?, ?, ?, ?, ?, ?, ?); ",
      [retweet,idusername, text, img, retweet, date, Is_comment, Comment_original_username],
      (err, results) => {
        if (err) {
          console.log(`fallo`, err);
        }
        //res.send(results)

      }
    );
  }
 });

 router.post("/uploadlike", (req, res) => {
  const idusername = req.body.userid;
  const like = req.body.likeId;
  const date = req.body.creationDate;
  const text = req.body.text;
  const img = req.body.img;
  const like_state = req.body.like_state;
  const Is_comment = req.body.Is_comment
  const Comment_original_username = req.body.Comment_original_username
 if(like_state){
   db.query(
     "UPDATE twetts SET Like_count=Like_count-1 WHERE idtwetts=?; DELETE FROM twetts WHERE users_Userid= ? AND text=? ORDER BY idtwetts DESC LIMIT 1;",
     [like,idusername, text],
     (err, results) => {
       if (err) {
         console.log(`fallo -like`, err);
       }
       //res.send(results)
      // console.log(results);
     }
   );
 }else{
   db.query(
     "UPDATE twetts SET Like_count=Like_count+1 WHERE idtwetts=?;INSERT INTO twetts (users_Userid, text, img, LikesId, creationDate, Is_comment , Comment_original_username) VALUES (?, ?, ?, ?, ?, ?, ?); ",
     [like,idusername, text, img, like, date, Is_comment, Comment_original_username],
     (err, results) => {
       if (err) {
         console.log(`fallo like`, err);
       }
       //res.send(results)
       //console.log(results);
     }
   );
 }
});

 router.get("/:limitInf/:limitSup", (req, res) => {
   const limitInf = Number(req.params.limitInf);
   const limitSup = Number(req.params.limitSup);

   db.query(
     "SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username, twetts.rtwUserid, twetts.lkUserid , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid ORDER BY twetts.creationDate DESC LIMIT ?,?;SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username, twetts.rtwUserid, twetts.lkUserid , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid",
     [limitInf,limitSup],
     async (err, results) => {
       if (err) {
         console.log(err);
       }

       const tosend = await prepairTwetts(results[0]);
       const allTw = await prepairTwetts(results[1])
   
       let hasMore = null
       if(limitSup===1){
        //Esto es para cuando se solicita un solo tweet( dispatcher:NEW TWEET)
        hasMore = true
       }else{
         hasMore =  tosend.length < 15 ? false : true
       }
       
       res.send({ tweets: tosend, hasMore:hasMore, hasResults: results.length > 0 ? true : false, allTw:allTw});
     }
   );
 });

 router.put("/tweetbyid/:tweetid", (req, res) => {
  const tweetid = Number(req.params.tweetid);
 

  db.query(
    "SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username  , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid WHERE idtwetts=?;",
    tweetid,
    async (err, results) => {
      if (err) {
        console.log(err);
      }

      const tosend = await prepairTwetts(results);
      res.send({ tweets: tosend, hasMore:true, hasResults: true, message:'nuevo comentario' });
    }
  );
});

 //SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid WHERE twetts.Is_comment=393 ORDER BY twetts.creationDate DESC LIMIT 0,10

 router.get("/commentsof/:idtwetts/:limitInf/:limitSup", (req, res) => {
  const idtwetts = Number(req.params.idtwetts);
  const limitInf = Number(req.params.limitInf);
  const limitSup = Number(req.params.limitSup);

  db.query(
    "SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username  , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid WHERE twetts.Is_comment=? ORDER BY twetts.creationDate DESC LIMIT ?,?;",
    [idtwetts,limitInf,limitSup],
    async (err, results) => {
      if (err) {
        console.log(err);
      }
   
      const tosend = await prepairTwetts(results);
  
      
      res.send({ tweets: tosend, hasMore:tosend.length < 10 ? false : true, hasResults: results.length > 0 ? true : false});
    }
  );
});


 router.post("/uploadcomment", (req, res) => {
  const idusername = req.body.userid;
  const date = req.body.creationDate;
  const text = req.body.text;
  const img = req.body.img;
  const twMother = req.body.ref

  //DISCERNIR SI EL TW RECIBIDIO ES UN TW LK O RT

  const twRef = findTwRef(twMother)
  

   db.query(
     "UPDATE twetts SET Comments_count=Comments_count+1 WHERE idtwetts=?;INSERT INTO twetts (users_Userid, text, img, is_comment, creationDate, Comment_original_username) VALUES (?, ?, ?, ?, ?, ?); ",
     [ twRef,idusername, text, img,  twRef, date, twMother.Username],
     (err, results) => {
       if (err) {
         console.log(`fallo`, err);
         res.send({results, message: 'Error on server', status:false});
       }
       res.send({results, message: 'Tweet has been commented succesfully', status:true});
    
     }
   );
 }
);

 module.exports = router;