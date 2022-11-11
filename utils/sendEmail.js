const nodemailer = require("nodemailer");

module.exports = async (email, subject, text) => {
	try {
		const transporter = nodemailer.createTransport({
			host: process.env.HOST_MAIL,
			service: process.env.SERVICE,
			port: Number(process.env.EMAIL_PORT),
			secure: Boolean(process.env.SECURE),
			auth: {
				user: process.env.USER,
				pass: process.env.PASS,
				
			},
		});
      
		await transporter.sendMail({
			from: process.env.USER,
			to: email,
			subject: subject,
			text: text,
		},(error, info) => {
			if (error) {
			  return console.log(error);
			}
			console.log('Message sent: %s', info.messageId, info.accepted);
		
		  });
	
	} catch (error) {
		console.log("email not sent!");
		console.log(error);
		return error;
	}
};
/*
const nodemailer = require('nodemailer');
const { google } = require("googleapis");
const OAuth2 = google.auth.OAuth2;

//const accountTransport = require("./account_transport.json");

let accountTransport = {
	"service": "gmail",
	"auth": {
	  "type": "OAuth2",
	  "user": "twitter.fake.made.in.react@gmail.com",
	  "clientId": "913478395481-81orgmgb8rll0gvcucg1fm3ta1hau0ng.apps.googleusercontent.com",
	  "clientSecret": "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",
	  "refreshToken": "1//04Isr7qzKdFi_CgYIARAAGAQSNwF-L9Irle735ZcvFEPBXXjo59vE9T-p-WyVe0BFkY7_RSSLH5DIy_ak-6GgqaOMkfzxmYs_IEo"
	}
  }

const mail_rover = async (callback) => {
    const oauth2Client = new OAuth2(
        process.env.CLIENTID,
        process.env.CLIENTSECRET,
        "https://developers.google.com/oauthplayground",
    );
    oauth2Client.setCredentials({
        refresh_token: process.env.REFRESHTOKEN,
        tls: {
            rejectUnauthorized: false
        }
    });
    oauth2Client.getAccessToken((err, token) => {
        if (err)
            return console.log(err);;
        accountTransport.auth.accessToken = token;
        callback(nodemailer.createTransport(accountTransport));
    });
};


function send( calback) {

    mail_rover(function (emailTransporter) {

                json = {
                    url: _SERVER + 'check/', mail: emailTransporter, app: 'CHECK', from: 'Check <check@planck.biz>',
                    to: 'CHECK <check@planck.biz>',
                    slogan: '😋 Comida exquisita, entregas simples. 🛵 Compra YA! 👇🏻',
                    body_bienvanida: 'Mensaje personalizado', head_bienvanida: 'En Check pide a tu local favorito, o chatea con un asesor por medicina, y te lo llevamos lo antes posible.',
                    bcc: 'Info <planck.biz@gmail.com>', head: head, footer: footer
                };
                return calback(json);
        
    });
}*/