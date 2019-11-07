<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="tools.NotificationTools" %>
<%@ page import="db.ActivityLog" %>
<%@ page import="java.sql.ResultSet" %>
<%
	HttpSession checksession = request.getSession(false);
	if (checksession.getAttribute("empid") == null) {
		response.sendRedirect("signin.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">

    <!-- Site Metas -->
    <title>Food Funday Restaurant - One page HTML Responsive</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- color -->
    <link id="changeable-colors" rel="stylesheet" href="css/colors/strong-blue.css" />
    <link rel="stylesheet" href="css/notificationframe.css">
    <!-- Modernizer -->
    <script src="js/modernizer.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>
    <div id="loader">
        <div id="status"></div>
    </div>
    <div id="site-header">
		<header id="header" class="header-block-top">
			<div class="container">
				<div class="row">
					<div class="main-menu">
						<!-- navbar -->
						<nav class="navbar navbar-default" id="mainNav">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#navbar"
									aria-expanded="false" aria-controls="navbar">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<div class="logo">
									<a class="navbar-brand js-scroll-trigger logo-header" href="#">
										<img src="images/logo.png" alt="">
									</a>
								</div>
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<ul class="nav navbar-nav navbar-right">
									<li class="active"><a href="home.jsp">Home</a></li>
									<li><a href="todaysMenuEditor.jsp">Today's Menu</a></li>
									<li><a href="FoodTableEditor.jsp">Food DB</a></li>
									<li><a href="OrderManagement.jsp">Todays Orders</a></li>
                                    <li><a href="HomeOrderManagement.jsp">Home Delivery</a></li>
									<li><a href="OrderHistory.jsp">Order History</a></li>
                                    <li class="dropdown">
                                    	<a href="#" class="notification dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    		  <span>Account</span>
                                    		  <span class="badge">new</span>
                                    	</a>
                                        <ul class="dropdown-menu nav navbar-nav navbar-right" style="border-radius: 15px 15px 15px 15px ;padding-bottom: 20px;">







                                            

                                        		<iframe class = "notification-frame-container" src="notificationFrame.jsp" scrolling="no" style="border:none;" id="myIframe">
                                        		</iframe>
                                        	
                                            






                                            <div class="navigator-container">
	                                            <li>
	                                            	<div class="navigator">
	                                            	<a href="profile.jsp">Your Profile</a>
	                                            	</div>
	                                            
	                                            	<div class="navigator">
	                                            	<a onclick="signout()">Sign Out</a>
	                                            	</div>
	                                            </li>
                                        	</div>
                                            
                                        </ul>
                                    </li>
								</ul>
							</div>
							<!-- end nav-collapse -->
						</nav>
						<!-- end navbar -->
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container-fluid -->
		</header>
		<!-- end header -->
	</div>
	<!-- end site-header -->
    <div id="blog" class="blog-main pad-top-100 pad-bottom-100 parallax">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="block-title text-center">
					Home
				</h2>
                    <div class="blog-box clearfix">
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <div class="col-md-6 col-sm-6">
                                <div class="blog-block">
                                    <div class="blog-img-box">
                                        <img src="images/featured-image-01.jpg" alt="" />
                                        <div class="overlay">
                                            <a href="todaysMenuEditor.jsp"><i class="fa fa-link" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="blog-dit">
                                        <h2>Edit Todays Menu</h2>
                                        <p><span>Choose the food items which are available for today from the food database</span></p>
                                        
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <div class="col-md-6 col-sm-6">
                                <div class="blog-block">
                                    <div class="blog-img-box">
                                        <img src="images/featured-image-02.jpg" alt="" />
                                        <div class="overlay">
                                            <a href="FoodTableEditor.jsp"><i class="fa fa-link" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="blog-dit">
                                        
                                        <h2>Edit Food Database</h2>
                                        <p><span>You can Add, Edit, Delete food items from the food table.</span></p>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <div class="col-md-6 col-sm-6">
                                <div class="blog-block">
                                    <div class="blog-img-box">
                                        <img src="images/featured-image-03.jpg" alt="" />
                                        <div class="overlay">
                                            <a href="OrderManagement.jsp"><i class="fa fa-link" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="blog-dit">
                                        
                                        <h2>Manage Todays Order</h2>
                                        <p><span>Accept or Reject the orders coming on real time</span></p>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <div class="col-md-6 col-sm-6">
                                <div class="blog-block">
                                    <div class="blog-img-box">
                                        <img src="images/featured-image-04.jpg" alt="" />
                                        <div class="overlay">
                                            <a href="OrderHistory.jsp"><i class="fa fa-link" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="blog-dit">
                                        
                                        <h2>See The History of Orders</h2>
                                        <p><span>The Entire History of orders are available here</span></p>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                    </div>
                    <!-- end blog-box -->

                 
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end blog-main -->

    
   
    <div id="footer" class="footer-main">
        
        <div class="footer-box pad-top-70">
            <div class="container">
                <div class="row">
                    <div class="footer-in-main">
                        <div class="footer-logo">
                            <div class="text-center">
                                <img src="images/logo.png" alt="" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-a">
                                <h3>About Us</h3>
                                <p>Aenean commodo ligula eget dolor aenean massa. Cum sociis nat penatibu set magnis dis parturient montes.</p>
                                <ul class="socials-box footer-socials pull-left">
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa  fa-facebook"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-twitter"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-google-plus"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-pinterest"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-linkedin"></i></div>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                            <!-- end footer-box-a -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-b">
                                <h3>New Menu</h3>
                                <ul>
                                    <li><a href="#">Italian Bomba Sandwich</a></li>
                                    <li><a href="#">Double Dose of Pork Belly</a></li>
                                    <li><a href="#">Spicy Thai Noodles</a></li>
                                    <li><a href="#">Triple Truffle Trotters</a></li>
                                </ul>
                            </div>
                            <!-- end footer-box-b -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-c">
                                <h3>Contact Us</h3>
                                <p>
                                    <i class="fa fa-map-signs" aria-hidden="true"></i>
                                    <span>6 E Esplanade, St Albans VIC 3021, Australia</span>
                                </p>
                                <p>
                                    <i class="fa fa-mobile" aria-hidden="true"></i>
                                    <span>
									+91 80005 89080 
								</span>
                                </p>
                                <p>
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span><a href="#">support@foodfunday.com</a></span>
                                </p>
                            </div>
                            <!-- end footer-box-c -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-d">
                                <h3>Opening Hours</h3>

                                <ul>
                                    <li>
                                        <p>Monday - Thursday </p>
                                        <span> 11:00 AM - 9:00 PM</span>
                                    </li>
                                    <li>
                                        <p>Friday - Saturday </p>
                                        <span>  11:00 AM - 5:00 PM</span>
                                    </li>
                                </ul>
                            </div>
                            <!-- end footer-box-d -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end footer-in-main -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
            <div id="copyright" class="copyright-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h6 class="copy-title"> Copyright &copy; 2017 Food Funday is powered by <a href="#" target="_blank"></a> </h6>
                        </div>
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </div>
            <!-- end copyright-main -->
        </div>
        <!-- end footer-box -->
    </div>
    <!-- end footer-main -->

    <a href="#" class="scrollup" style="display: none;">Scroll</a>

    <section id="color-panel" class="close-color-panel">
        <a class="panel-button gray2"><i class="fa fa-cog fa-spin fa-2x"></i></a>
        <!-- Colors -->
        <div class="segment">
            <h4 class="gray2 normal no-padding">Color Scheme</h4>
            <a title="orange" class="switcher orange-bg"></a>
            <a title="strong-blue" class="switcher strong-blue-bg"></a>
            <a title="moderate-green" class="switcher moderate-green-bg"></a>
            <a title="vivid-yellow" class="switcher vivid-yellow-bg"></a>
        </div>
    </section>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    	<script>
	function signout(){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				alert("successfully signed out");
				location.reload();
			}
		};
		var url = "signout";
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	</script>
	

</body>

</html>