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
											<span class = "decrement" name = "<%= a.getInt("itemCode") %>">-</span>
											<input class="input-number" id = "<%= a.getInt("itemCode") %>" type="number" value="0" min="0" max="1000" name="<%= a.getInt("itemCode") %>">
											<span class = "increment" name = "<%= a.getInt("itemCode") %>">+</span>
											<!--<div class="input-group input-number-group">
												<div class="input-group-button">
													<span class="input-number-decrement">-</span>
												</div>
												<input class="input-number" type="number" value="0" min="0"
													max="1000" name="<%= a.getInt("itemCode") %>">
												<div class="input-group-button">
													<span class="input-number-increment">+</span>
												</div>
											</div>
											-->
											<br>
											<p><%= a.getString("Description") %></p>
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
				<br>
				<br>
				
			</div>
			<!-- end container -->
			
		</div>
		<!-- end menu -->
	
		<div id="reservation" class="reservations-main pad-top-100 pad-bottom-100">
			<div class="container">
				<div class="row">
					<div class="form-reservations-box">
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="wow fadeIn" data-wow-duration="1s"
								data-wow-delay="0.1s">
								<h2 class="block-title text-center">Home Delivery</h2>
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
									<input type="text" name="address" id="address"
										placeholder="Address" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-box">
									<input type="number" name="phno" id="phno"
										placeholder="Contact Number" required="required"
										data-error="Firstname is required.">
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="reserve-book-btn text-center">
									<button class="hvr-underline-from-center" type="submit"
										value="Submit" id="submit">PLACE THE ORDER</button>
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