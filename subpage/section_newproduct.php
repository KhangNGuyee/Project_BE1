<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Sản phẩm mới</h3>
                </div>
            </div>
            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <!-- product --> 
                                <?php
                                    if(isset($arr_products_new)){
                                        foreach ($arr_products_new as $value) {
                                            echo "<div class=\"product\">
                                                        <div class=\"product-img\">
                                                            <img src=\"./image/{$value['product_img']}\" alt=\"\">
                                                            <div class=\"product-label\">
                                                                <span class=\"sale\">-30%</span>
                                                                <span class=\"new\">NEW</span>
                                                            </div>
                                                        </div>
                                                        <div class=\"product-body\">
                                                            <p class=\"product-category\">{$value['cat_name']}</p>
                                                            <h3 class=\"product-name\"><a href=\"product.php?mode=detail&id={$value['product_id']}\">{$value['product_name']}</a></h3>
                                                            <h4 class=\"product-price\">".number_format($value['product_price'],0,'','.')."<sup>đ</sup></h4>
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
                                                            <button class=\"add-to-cart-btn\" onClick=\"AddProductToCart('{$value['product_id']}','".addslashes($value['product_name'])."','{$value['product_price']}','{$value['product_img']}','{$value['cat_name']}')\"><i class=\"fa fa-shopping-cart\"></i> add to cart</button>
                                                        </div>
                                                    </div>";
                                        }
                                    }
                                 ?>
                                
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
