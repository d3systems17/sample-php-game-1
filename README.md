# sample-php-game
This is some work on the sample game to be used with GamblingTec

Requirements

*) PHP Version 7.0.32 or greater
    cURL support	enabled
    SSL Version	OpenSSL/1.0.2p or greater


*) Mysql PDO support	

*) Create database 
    1) Import the sql data from sql_data/samplegame.sql

 
*) Open dbconfig.ini in eidtor like notepad etc and updated data with your details
 
    dbname = "database-name" // your databse name
    user = "database-username" // your databse user name
    pass = "database-password"   //// your databse password


    clientId = xxxxxxx //   client Id provided by Gampling tec
    clientSecret = xxxxxxx //  client Secret provided by Gampling tec
    gameProviderUuid = xxxxxxxx-bbbb-cccc-dddd-eeeeeeeeeeee //  Game Uuid   provided by Gampling tec
    private_key  = 501ee1944b81bb7018c7d10316854911 //  (HMAC private key)   provided by Gampling tec

    redirectUri = http://www.abcgame.com/login.php  //your server redirec url 
    depositRetunUrl = http://www.abcgame.com/depositsuccess.php  // your success page url if it is there  
