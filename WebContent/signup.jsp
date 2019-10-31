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
	href="css/colors/strong-blue.css" />
<script type="text/javascript"
	src="js/jquery.min.js"></script>

<!-- Modernizer -->
<script src="js/modernizer.js"></script>
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
	.btn-default.btn-on-4.active{background-color: #006FFC;color: #5BB75B;}
.btn-default.btn-off-4.active{background-color: #DA4F49;color: #DA4F49;}
.decrement,.increment
	{
		cursor:pointer;
		text-decoration: none;
		background-color: #bbbbbb;
		color: #333333;
		padding: 2px 6px 2px 6px;
		border-radius: 4px;
		height: 22px;
	}

.input-number
	{
	text-align: center;
	border-radius: 4px;
  
		width: 33px;
	height: 22px;
    position: relative;
    border: 2px solid #cdcdcd;
    border-color: rgba(0, 0, 0, .14);
    background-color: AliceBlue;
    font-size: 14px;
	}
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
	$(document).ready(function() {
		$('.increment').on('click', function(){
			var name = this.getAttribute("name");
			
			var val = document.getElementById(name).value;
			document.getElementById(name).value = Number(val)+1;
		});
		$('.decrement').on('click', function(){
			var name = this.getAttribute("name");
			console.log(name);
			var val = document.getElementById(name).value;
			document.getElementById(name).value = Number(val)-1;
		});
	});

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
									
                                    <li><a href="signin.jsp">Sign In</a></li>
                                    <li class="active"><a href="signup.jsp">Sign Up</a></li>
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

	<div id="banner-small" class="banner-small full-screen-mode parallax">
	</div>
	<!-- end banner -->
	<form method="post" class="reservations-box" name="contactform"
		id="contactform" action="signup">
		
		<div id="reservation" class="reservations-main pad-top-100 pad-bottom-100">
			<div class="container">
				<div class="row">
					<div class="form-reservations-box">
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="wow fadeIn" data-wow-duration="1s"
								data-wow-delay="0.1s">
								<h2 class="block-title text-center">Sign Up</h2>
							</div>
							<h4 class="form-title">Create a new account</h4>
							<p>PLEASE FILL OUT ALL REQUIRED* FIELDS. THANKS!</p>
						

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="text" name="name" id="form_name"
										placeholder="Name" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="number" name="salary" id="address"
										placeholder="salary" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="text" name="address" id="phno"
										placeholder="address" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="text" name="designation" id="phno"
										placeholder="designation" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="password" name="password" id="phno"
										placeholder="password" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="password" name="phno" id="phno"
										placeholder="confirm password" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="number" name="phonenumber" id="phno"
										placeholder="Phone Number" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="reserve-book-btn text-center">
									<button class="hvr-underline-from-center" type="submit"
										value="Submit" id="submit">Sign Up</button>
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
	
	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>
</body>

</html>