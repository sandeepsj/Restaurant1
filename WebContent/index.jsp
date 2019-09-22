<%@ page import="db.*"%>
<%@ page import="java.sql.*"%>
<%
	Foods food = new Foods();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">

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
<link id="changeable-colors" rel="stylesheet"
	href="css/colors/orange.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

<!-- Modernizer -->
<script src="js/modernizer.js"></script>
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.input-number-group {
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
}

.input-number-group input[type=number]::-webkit-inner-spin-button,
	.input-number-group input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	appearance: none;
}

.input-number-group .input-group-button {
	line-height: calc(40px/ 2 - 5px);
}

.input-number-group .input-number {
	width: 40px;
	padding: 0 12px;
	vertical-align: top;
	text-align: center;
	outline: none;
	display: block;
	margin: 0;
}

.input-number-group .input-number, .input-number-group .input-number-decrement,
	.input-number-group .input-number-increment {
	border: 1px solid #cacaca;
	height: 20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border-radius: 0;
}

.input-number-group .input-number-decrement, .input-number-group .input-number-increment
	{
	display: inline-block;
	width: 20px;
	background: #e6e6e6;
	color: #0a0a0a;
	text-align: center;
	font-weight: bold;
	cursor: pointer;
	font-size: 2rem;
	font-weight: 400;
}

.input-number-group .input-number-decrement {
	margin-right: 0.3rem;
}

.input-number-group .input-number-increment {
	margin-left: 0.3rem;
}
</style>
<script type="text/javascript">
        $('.input-number-increment').click(function() {
          var $input = $(this).parents('.input-number-group').find('.input-number');
          var val = parseInt($input.val(), 10);
          $input.val(val + 1);
        });

        $('.input-number-decrement').click(function() {
          var $input = $(this).parents('.input-number-group').find('.input-number');
          var val = parseInt($input.val(), 10);
          $input.val(val - 1);
        })


    </script>

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
									<li class="active"><a href="#banner">Home</a></li>
									<li><a href="#about">About us</a></li>
									<li><a href="#menu">Menu</a></li>
									<li><a href="#reservation">Reservaion</a></li>
									<li><a href="#footer">Contact us</a></li>
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
	<div id="banner" class="banner full-screen-mode parallax">
		<div class="container pr">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="banner-static">
					<div class="banner-text">
						<div class="banner-cell">
							<h1>
								Dinner with us <span class="typer" id="some-id" data-delay="200"
									data-delim=":" data-words="Friends:Family:Officemates"
									data-colors="red"></span><span class="cursor"
									data-cursorDisplay="_" data-owner="some-id"></span>
							</h1>
							<h2>Accidental appearances</h2>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
								sed diem nonummy nibh euismod</p>
							<div class="book-btn">
								<a href="#reservation"
									class="table-btn hvr-underline-from-center">Book my Table</a>
							</div>
							<a href="#about">
								<div class="mouse"></div>
							</a>
						</div>
						<!-- end banner-cell -->
					</div>
					<!-- end banner-text -->
				</div>
				<!-- end banner-static -->
			</div>
			<!-- end col -->
		</div>
		<!-- end container -->
	</div>
	<!-- end banner -->
	<div id="about" class="about-main pad-top-100 pad-bottom-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="wow fadeIn" data-wow-duration="1s"
						data-wow-delay="0.1s">
						<h2 class="block-title">About Us</h2>
						<h3>IT STARTED, QUITE SIMPLY, LIKE THIS...</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusm incididunt ut labore et dolore magna aliqua. Ut enim
							ad minim venia, nostrud exercitation ullamco.</p>

						<p>Aenean commodo ligula eget dolor aenean massa. Cum sociis
							nat penatibu set magnis dis parturient montes, nascetur ridiculus
							mus. quam felisorat, ultricies nec, Aenean commodo ligula eget
							dolor penatibu set magnis is parturient montes, nascetur
							ridiculus mus. quam felisorat, ultricies nec, pellentesque eu,
							pretium quis, sem. quat massa quis enim. Donec vitae sapien ut
							libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget
							eros.</p>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusm incididunt ut labore et dolore magna aliqua. Ut enim
							ad minim venia, nostrud exercitation ullamco.</p>
					</div>
				</div>
				<!-- end col -->
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="wow fadeIn" data-wow-duration="1s"
						data-wow-delay="0.1s">
						<div class="about-images">
							<img class="about-main" src="images/about-main.jpg"
								alt="About Main Image"> <img class="about-inset"
								src="images/about-inset.jpg" alt="About Inset Image">
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<form method="post" class="reservations-box" name="contactform"
		id="contactform" action="BookTable">
		<div id="menu" class="menu-main pad-top-100 pad-bottom-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="wow fadeIn" data-wow-duration="1s"
							data-wow-delay="0.1s">
							<h2 class="block-title text-center">Our Menu</h2>
							<p class="title-caption text-center">There are many
								variations of passages of Lorem Ipsum available, but the
								majority have suffered alteration in some form, by injected
								humour, or randomised words which don't look even slightly
								believable.</p>
						</div>
						<div class="tab-menu">
							<div class="slider slider-nav">
								<div class="tab-title-menu">
									<h2>STARTERS</h2>
									<p>
										<i class="flaticon-canape"></i>
									</p>
								</div>
								<div class="tab-title-menu">
									<h2>MAIN DISHES</h2>
									<p>
										<i class="flaticon-dinner"></i>
									</p>
								</div>
								<div class="tab-title-menu">
									<h2>DESERTS</h2>
									<p>
										<i class="flaticon-desert"></i>
									</p>
								</div>
								<div class="tab-title-menu">
									<h2>DRINKS</h2>
									<p>
										<i class="flaticon-coffee"></i>
									</p>
								</div>
							</div>
							<div class="slider slider-single">
								<%
                        while(food.nextDomain()){
                        	out.println("<div>");
                        	ResultSet a = food.curDomain();
                            while(a.next()){
                            	if(!food.isAvailableToday(a.getInt("ItemCode")))
                            		continue;
                            	%>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
									<div class="offer-item">
										<img src=" <%= a.getString("imagePath") %> " alt=""
											class="img-responsive">
										<div>
											<h3><%= a.getString("FoodItemName").toUpperCase() %>

											</h3>
											<div class="input-group input-number-group">
												<div class="input-group-button">
													<span class="input-number-decrement">-</span>
												</div>
												<input class="input-number" type="number" value="0" min="0"
													max="1000" name="<%= a.getInt("itemCode") %>">
												<div class="input-group-button">
													<span class="input-number-increment">+</span>
												</div>
											</div>
											<br>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Nunc mollis eleifend dapibus.</p>
										</div>
										<span class="offer-price"><%= a.getString("Price") %></span>
									</div>
								</div>
								<!-- end col -->
								<%
                                }
                            a.close();
                            out.println("</div>");
                        }
                        %>
							</div>
						</div>
						<!-- end tab-menu -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
		<!-- end menu -->
		<div id="reservation"
			class="reservations-main pad-top-100 pad-bottom-100">
			<div class="container">
				<div class="row">
					<div class="form-reservations-box">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="wow fadeIn" data-wow-duration="1s"
								data-wow-delay="0.1s">
								<h2 class="block-title text-center">Book Your Table</h2>
							</div>
							<h4 class="form-title">PLACE YOUR ORDER</h4>
							<p>PLEASE FILL OUT ALL REQUIRED* FIELDS. THANKS!</p>


							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="text" name="form_name" id="form_name"
										placeholder="Name" required="required"
										data-error="Firstname is required.">
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<select name="table_no" id="no_of_persons" class="selectpicker">
										<option selected disabled>Table</option>
										<% for (int i = 1; i<= food.no_of_tables;i++){
                                        out.println("<option>"+i+"</option>");
                                        }%>
									</select>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="reserve-book-btn text-center">
									<button class="hvr-underline-from-center" type="submit"
										value="Submit" id="submit">BOOK MY TABLE</button>
								</div>
							</div>
							<!-- end col -->
							<!-- end form -->
						</div>
						<!-- end col -->
					</div>
					<!-- end reservations-box -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
		<!-- end reservations-main -->
	</form>
	<!-- Footer -->
	<div id="footer" class="footer-main">
        <div class="footer-news pad-top-100 pad-bottom-70 parallax">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <h2 class="ft-title color-white text-center"> Newsletter </h2>
                            <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        </div>
                        <form>
                            <input type="email" placeholder="Enter your e-mail id">
                            <a href="#" class="orange-btn"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
                        </form>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end footer-news -->
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
			<a title="orange" class="switcher orange-bg"></a> <a
				title="strong-blue" class="switcher strong-blue-bg"></a> <a
				title="moderate-green" class="switcher moderate-green-bg"></a> <a
				title="vivid-yellow" class="switcher vivid-yellow-bg"></a>
		</div>
	</section>

	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>
</body>

</html>