const express = require("express")
const router = express.Router()

const db = require('../config/db')
const prepairTwetts = require('../utils/prepairtweeta')

router.get("/:id/:limitInf/:limitSup", (req, res) => {
    const limitInf = Number(req.params.limitInf);
    const limitSup = Number(req.params.limitSup);
    const id = Number(req.params.id);

    db.query(
      "SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username, twetts.rtwUserid, twetts.lkUserid , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid WHERE twetts.users_Userid=?  ORDER BY twetts.creationDate DESC LIMIT ?,?;SELECT twetts.idtwetts, twetts.text, twetts.creationDate, twetts.Retweet, twetts.Retweet_count,twetts.Retweet_original_username, twetts.LikesId, twetts.Like_count,twetts.Like_original_username, twetts.users_Userid, twetts.img, twetts.Comments_count, twetts.Is_comment, twetts.Comment_original_username, twetts.rtwUserid, twetts.lkUserid , users.Userid,users.Username,users.user_img from twetts INNER JOIN users ON twetts.users_Userid=users.Userid",
      [id, limitInf,limitSup],
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

  module.exports = router;