if (process.env.NODE_ENV != 'production'){
   require('dotenv').config();
}
const express = require('express');
const app = express();
const cors = require('cors')
const bodyParser = require("body-parser")
const cookieParser = require("cookie-parser")
const session = require("express-session")
const PORT = process.env.PORT || 3001;
const CLIENT_PORT = process.env.CLIENT_PORT
const SECRET = process.env.SECRET



app.use(express.json())
app.use(cors({
  // origin: [CLIENT_PORT],
  // methods: ["GET", "POST", "DELETE", "PUT"],
   //credentials: true,

}));

app.use(cookieParser())


app.use(bodyParser.urlencoded({ extended: true}))

app.use(
   session({
    key:"userId",
    secret:SECRET,
    resave: false,
    saveUninitialized: false,
    cookie:{
      expires: 60*60*24*1000,

    },
}))

const userRoute = require('./routes/User')
app.use('/user', userRoute);


const uploadRoute = require('./routes/Upload');
app.use('/upload', uploadRoute);

const tweetsOfRoute = require('./routes/TweetsOf');
app.use('/tweetsof', tweetsOfRoute);

app.listen(PORT, (req, res) => {
   console.log('Server running..', CLIENT_PORT)
});