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
		<title>Liên hệ</title>
 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">
 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>
	<body onload="SetDefault();">
		<?php 
		include_once 'subpage/header.php';
		include_once 'subpage/navigation.html';
		?>
		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<div class="container">	
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Trung tâm CSKH</h3>
						<ul class="breadcrumb-tree">
							<li><a href="index.php">Home</a></li>
							<li class="active">Liên hệ</li>
						</ul>
					</div>
				</div>	
			</div>	
		</div>
		<div class="section">	
			<div class="container">
				<div class="row">
					<div class="col-sm-6 center">
						<form action="index.php" method="get">
							<div class="billing-details center">
								<div class="section-title">
									<h3 class="title center">Liên hệ</h3>
								</div>
								<div class="form-group">
									<input type="hidden" name='mode' value='user'>
									<input type="hidden" name='ac' value='contact'>
									<input class="input" type="email" name="email" placeholder="Email">
								</div>
								<div class="form-group">
									<textarea name="opinition" pattern="[a-zA-Z0-9]{10-500}" class="input" placeholder="Ý kiến đóng góp"></textarea>
								</div>
								<div class="form-group">
									<div class="input-checkbox">
										<input type="checkbox" id="create-account">
										<label for="create-account">
											<span></span>
											Xác thực
										</label>
										<div class="caption">
										<p>Cam kết những từ ngữ không vi phạm tiêu chuẩn cộng đồng</p>
										</div>
										<div class="border border-white">
										<a href="index.php">Gửi</a>
										</div>
										
									</div>
								</div>
								
							</div>
						</form>
					</div>
				</div>					
			</div>
		</div>
		<?php include'subpage/footer.html';?>
		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>
