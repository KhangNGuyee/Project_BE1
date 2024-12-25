<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Sản phẩm bán chạy</h3>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                 <?php
                                    if(isset($arr_product_top_selling)){
                                        foreach ($arr_product_top_selling as $value) {
                                            echo "<div class=\"product\">
                                                        <div class=\"product-img\">
                                                            <img src=\"./image/{$value['product_img']}\" alt=\"\">
                                                        </div>
                                                        <div class=\"product-body\">
                                                            <p class=\"product-category\">{$value['cat_name']}</p>
                                                            <h3 class=\"product-name\"><a href=\"product.php?mode=detail&id={$value['product_id']}\">{$value['product_name']}</a></h3>
                                                            <h4 class=\"product-price\">".number_format($value['product_price'],0,'',',')."<sup>đ</sup></h4>
                                                            <div class=\"product-rating\">
                                                                <i class=\"fa fa-star\"></i>
                                                                <i class=\"fa fa-star\"></i>
                                                                <i class=\"fa fa-star\"></i>
                                                                <i class=\"fa fa-star\"></i>
                                                                <i class=\"fa fa-star\"></i>
                                                            </div>
                                                            <div class=\"product-btns\">                     
                                                                <button class=\"quick-view\"><i class=\"fa fa-eye\"></i><span class=\"tooltipp\">quick view</span></button>
                                                            </div>
                                                        </div>
                                                        <div class=\"add-to-cart\">
                                                            <button onClick=\"AddProductToCart('{$value['product_id']}','".addslashes($value['product_name'])."','{$value['product_price']}','{$value['product_img']}','{$value['cat_name']}')\" class=\"add-to-cart-btn\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>
                                                        </div>
                                                    </div>";
                                        }
                                    }
                                 ?>                                 
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>