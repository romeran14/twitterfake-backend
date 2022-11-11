const db = require('../config/db')

module.exports =  async (TwArray) => {
        const readyResults = TwArray.map((tweet) => {
          return new Promise(function (resolve, reject) {
            if (tweet.Retweet !== null) {
              const idRtwOrigin = tweet.Retweet;
      
              db.query(
                "SELECT users.Username,users.user_img, users.Userid from users WHERE ( SELECT twetts.users_Userid from twetts WHERE twetts.idtwetts=?) = users.Userid; SELECT twetts.Retweet_count, twetts.Like_count, twetts.Comments_count  from twetts WHERE twetts.idtwetts=?; ",
                [idRtwOrigin, idRtwOrigin],
                (err, results) => {
                  if (err) {
                    console.log(err);
                    return reject(err);
                  }
                  
                  tweet.Retweet_original_username = results[0][0].Username;
                  tweet.user_img = results[0][0].user_img;
                  tweet.rtwUserid = results[0][0].Userid;
                  tweet.Retweet_count  = results[1][0].Retweet_count ;
                  tweet.Like_count  = results[1][0].Like_count ;
                  tweet.Comments_count = results[1][0].Comments_count
                  return resolve(tweet);
                }
              );
            } else if(tweet.LikesId !== null){
              const idLiketwOrigin = tweet.LikesId;
              
              db.query(
                "SELECT users.Username,users.user_img, users.Userid from users WHERE ( SELECT twetts.users_Userid from twetts WHERE twetts.idtwetts=?) = users.Userid; SELECT twetts.Like_count, twetts.Retweet_count, twetts.Comments_count  from twetts WHERE twetts.idtwetts=?;",
                [idLiketwOrigin, idLiketwOrigin],
                (err, results) => {
                  if (err) {
                    console.log(err);
                    return reject(err);
                  }
          
                  tweet.Like_original_username = results[0][0].Username;
                  tweet.user_img = results[0][0].user_img;
                  tweet.lkUserid = results[0][0].Userid;
                  tweet.Like_count  = results[1][0].Like_count ;
                  tweet.Retweet_count  = results[1][0].Retweet_count ;
                  tweet.Comments_count = results[1][0].Comments_count
                  return resolve(tweet);
                }
              );
            }else if(tweet.Is_comment !== null){
              const idCommenttwOrigin = tweet.Is_comment;
          
              db.query(
                "SELECT users.Username,users.user_img from users WHERE ( SELECT twetts.users_Userid from twetts WHERE twetts.idtwetts=?) = users.Userid;",
                [idCommenttwOrigin, idCommenttwOrigin],
                (err, results) => {
                  if (err) {
                    console.log(err);
                    return reject(err);
                  }
               
                  tweet.Comment_original_username = results[0].Username;
               //   tweet.user_img = results[0].user_img;
              //    tweet.Like_count  = results[1][0].Like_count ;
              //    tweet.Retweet_count  = results[1][0].Retweet_count ;
               //   tweet.Comments_count = results[1][0].Comments_count LOS COMENTARIOS NO DEBERIAN TENER SUS PROPIOS CONTEOS PORQUE NO ES EL MISMO TW
                  return resolve(tweet);
                }
              );
            }
            
            else {
              return resolve(tweet);
            }
          });
        });
       return await  Promise.all(readyResults).then((arrayReady) => {
         
          return arrayReady
        }).catch((err)=>{
          console.log(`error: ${err.message}`)
         
        });
      };
      

