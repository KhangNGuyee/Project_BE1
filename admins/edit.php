<?php 
     if(!isset($_SESSION)) session_start();
    //  $name = isset($_COOKIE['name'])?$_COOKIE['name']:header("location:login.php");
     if(isset($_SESSION['admin'])) $info = $_SESSION['admin'];
     else{
        echo "<script>location.href = 'login.php'</script>"; exit;
     }
?>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Administrator</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
</head>

<body>
<?php 
        include "../config/config.php";
        include ROOT."/include/function.php";
        spl_autoload_register("loadClass");
?>

    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="../img/logo1.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="index.html"> <h3 class="menu-title">Dashboard</h3><!-- /.menu-title --> </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Quản lý</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i><a href="index.php?mode=provider">Provider</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="index.php?mode=category">Category</a></li>
                            <li><i class="fa fa-bars"></i><a href="index.php?mode=user">User</a></li>
                            <li><i class="fa fa-share-square-o"></i><a href="index.php?mode=order">Order</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="index.php?mode=product">Product</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Thống kê</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="index.php?mode=order&ac=revenue">Doanh Thu</a></li>
                            <li><i class="fa fa-table"></i><a href="index.php?mode=product&ac=sold">Sản phẩm đã bán</a></li>
                        </ul>
                    </li>

                    
                </ul>
            </div>
        </nav>
    </aside>
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="header-menu">
                <div class="col-sm-7">
                    <div class="header-left">
                                           
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a class="nav-link" href="#"><i class="fa fa-user"></i>Hi, <?php echo $info['ad_user'];?></a>
                        <a class="nav-link" href="index.php?mode=exit"><i class="fa fa-power-off"></i> Logout</a>

                    </div>

                    <div class="language-select dropdown" id="language-select">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown"  id="language" aria-haspopup="true" aria-expanded="true">
                            <i class="flag-icon flag-icon-vn"></i>
                        </a>
                    </div>

                </div>
            </div>

        </header>
        <!-- Header-->
        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>  

        <div class="container"> 
            <div class="row"> 
                <?php 
                    
                    include 'layout/update.php';
                ?>
                
                
            </div>
        </div>
    </div>  
    <!-- Right Panel -->

    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>
