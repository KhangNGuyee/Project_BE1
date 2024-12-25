<?php
	if(!isset($_SESSION)) session_start();
?>
<!DOCTYPE html>
<html lang="en">
<?php
	include "config/config.php";
	include ROOT."/include/function.php";
	spl_autoload_register("loadClass");
	$masp = getIndex('id');
	$mode = getIndex('mode');
	if($masp != '' && $mode!= ''){
		$page = getIndex("page",1);
		$products_clt = new Product();
		$products = $products_clt->searchById($masp);
		$product = $products[0];
		//var_dump($product);
		$products_clt->setPageSize(4);
		$related_products = $products_clt->basic_seachByCategory(1,'',$product['cat_id']);
		//var_dump($related_products);
	}
	else {
		echo "<script>alert('Lỗi chi tiết'); window.location.href = 'store.php';</script>";
		exit;
	}
?>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Thông tin sản phẩm</title>
 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">
 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
	<body onload="SetDefault();">
		<?php 
		include 'mode.php'; 
		include 'subpage/header.php'; 
		include_once 'subpage/navigation.html'
		?>
		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li><a href="#">Home</a></li>
							<li><a href="store.php">Danh mục</a></li>
							<li><a href="#">Linh kiện</a></li>							
							<li class="active">Thông tin chi tiết</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- SECTION -->
		<div class="section">
			<div class="container">
				<div class="row">
					<!-- Product main img -->
					<div class="col-md-5 col-md-6">
						<div id="product-main-img">				
								<img src="./image/<?php echo $product['product_img']; ?>" alt="">						
						</div>
					</div>
					<!-- Product details -->
					<div class="col-md-6">
						<div class="product-details">
							<h2 class="product-name"><?php echo $product['product_name'];?></h2>							
							<div>
								<h3 class="product-price"><?php echo number_format($product['product_price'],0,'',',').' <sup>đ</sup>'; ?></h3>
							</div>
							<p><?php echo nl2br($product['product_description']);?></p>

							<div class="add-to-cart">
								<div class="row">
									<div class="col-xs-2">
										<h4 style='margin-top:8px'>SL</h4>
									</div>
									<div class="col-xs-3">
										<div class='form-group'>
										<input class='form-control' id='quantity' type="number" value='1' min='1' max='99'>
										</div>
									</div>
									<div class="col-xs-7">	
										<?php echo "<button class='add-to-cart-btn' id='quantity-cart' onClick=\"AddProductToCart('{$product['product_id']}','".addslashes($product['product_name'])."','{$product['product_price']}','{$product['product_img']}','{$product['cat_name']}','y')\">
														<i class='fa fa-shopping-cart'></i> Add to cart
													</button>" ?>										
									</div>
								</div>																
							</div>
							<ul class="product-links">
								<li>Danh mục:</li>
								<li><a href="store.php?cat-id=<?php echo $product['cat_id']; ?>&key=&mode=product&ac=search&basic-search=Search"><?php echo $product['cat_name']; ?></a></li>	
							</ul>
						</div>
					</div>
					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Thông tin chi tiết</a></li>	
							</ul>
							<!-- product tab content -->
							<div class="tab-content">
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p><?php echo nl2br($product['product_detail']);?></p>
										</div>
									</div>
								</div>
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Section -->
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title text-center">
							<!-- Related Products -->
							<h3 class="title">Những sản phẩm liên quan</h3>
						</div>
					</div>

					<!-- product -->
					<?php 
						foreach ($related_products as $value) {
							echo '<div class="col-md-3 col-xs-6">
									<div class="product">
										<div class="product-img">
											<img src="./image/'.$value['product_img'].'" alt="">
											<div class="product-label">
												<span class="sale">-35%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">'.$value['cat_name'].'</p>
											<h3 class="product-name"><a href="product.php?mode=detail&id='.$value['product_id'].'">'.$value['product_name'].'</a></h3>
											<h4 class="product-price">'.number_format($value['product_price'],0,'',',').'<sup> đ</sup></h4>											
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button onClick="AddProductToCart(\''.$value['product_id'].'\',\''.addslashes($value['product_name']).'\',\''.$value['product_price'].'\',\''.$value['product_img'].'\',\''.$value['cat_name'].'\')" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
										</div>
									</div>
								</div>';
						}
					?>
				</div>
			</div>
		</div>
		<?php include 'subpage/footer.html';?>
		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>
