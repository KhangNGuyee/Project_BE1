<?php
$configDB = array();
define('DB_NAME', 'computer_store');
/** MySQL database username */
define('DB_USER', 'root');
/** MySQL database password */
define('DB_PASS', '');
/** MySQL hostname */
define('HOST', 'localhost');
/** port number of DB */
define('PORT', "3306");
/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');
define('ROOT', dirname(dirname(__FILE__) ) );
define("BASE_URL", "http://".$_SERVER['SERVER_NAME']);