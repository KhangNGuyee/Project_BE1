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
		<title>Chính sách</title>
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
						<h3 class="breadcrumb-header">Chính sách</h3>
						<ul class="breadcrumb-tree">
							<li><a href="index.php">Home</a></li>
							<li class="active">Chính sách</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
					<ul>							
							<li>
								<p><h3>Chất Lượng Sản Phẩm/Dịch Vụ</h3></p>
								<p>Chúng tôi đảm bảo tất cả các sản phẩm và dịch vụ đều đạt chất lượng cao, được kiểm tra và chọn lọc kỹ lưỡng.</p>
                                <p> Mọi sản phẩm đều đi kèm với hướng dẫn sử dụng rõ ràng và đầy đủ thông tin.</p>
							</li>
							<li>
								<p><h3>Quy Trình Mua Hàng</h3></p>
								<p>Đặt hàng: Quá trình đặt hàng có thể thực hiện qua website, điện thoại hoặc email</p>
                                <p>Xác nhận đơn hàng: Sau khi nhận được đơn hàng, chúng tôi sẽ xác nhận với khách hàng qua email/điện thoại trong vòng [thời gian] để đảm bảo tính chính xác của đơn hàng.</p>
                                <p>Giao hàng: Chúng tôi cam kết giao hàng trong thời gian từ [thời gian giao hàng] kể từ khi xác nhận đơn hàng.</p>
                            </li>
							<li>
                            <p><h3>Bảo hành</h3></p>
								<p>Các sản phẩm được bảo hành theo chính sách bảo hành của nhà sản xuất. Thời gian bảo hành và điều kiện bảo hành sẽ được ghi rõ trong thông tin sản phẩm.</p>
                                <p>Để yêu cầu bảo hành, khách hàng cần cung cấp hóa đơn mua hàng và sản phẩm còn nguyên vẹn.</p>
							</li>
							<li>
								<p><h3>Chính Sách Đổi Trả Hàng Hóa</h3></p>
								<p>Khách hàng có thể yêu cầu đổi hoặc trả hàng trong vòng [thời gian, ví dụ: 7 ngày] kể từ ngày nhận hàng, nếu sản phẩm bị lỗi hoặc không đúng với đơn đặt hàng.</p>
                                <p>Các sản phẩm đổi trả phải còn nguyên vẹn, chưa qua sử dụng và có đầy đủ bao bì, nhãn mác.</p>
							</li>
							<li>
                            <p><h3> Bảo Mật Thông Tin Khách Hàng</h3></p>
								<p>Mọi thông tin của khách hàng sẽ được bảo mật tuyệt đối và chỉ sử dụng cho mục đích phục vụ khách hàng.</p>
                                <p>Chúng tôi không chia sẻ thông tin khách hàng cho bất kỳ bên thứ ba nào mà không có sự đồng ý của khách hàng.</p>    
							</li>						
						</ul>
					</div>
				</div>	
			</div>
		</div>
		<!-- FOOTER -->
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
