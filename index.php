<?php
	if(!isset($_SESSION)) session_start();
	
?>
<!DOCTYPE html>
<html lang="en">
<?php
	include "config/config.php";
	include ROOT."/include/function.php";
	spl_autoload_register("loadClass");
?>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Trang chủ</title>
		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
	<body onload="SetDefault();">
				<!-- jQuery Plugins -->
		<?php 
			include 'mode.php';
			include_once 'subpage/header.php';
			include_once 'subpage/navigation.html';
			include_once 'subpage/section_introduce.html';
			include_once 'subpage/section_newproduct.php';
			include_once 'subpage/section_topselling.php';
			include_once 'subpage/footer.html';
		 ?>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>		

	</body>
</html>
