<%@ page import = "java.util.ArrayList" %>
<%@ page import="db.TodaysOrders"%>
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
    <link id="changeable-colors" rel="stylesheet" href="css/colors/moderate-green.css" />

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
									<li class="active"><a href="index.jsp">Home</a></li>
									
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
    
    <div id="pricing" class="pricing-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="block-title text-center">
						Your Order Details	
					</h2>
                    
                </div>
                <div class="panel-pricing-in">
                    
                    <!-- item -->
                    <div class="col-md-12 col-sm-12 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Your Order</h3>
                            </div>
                            
                            <ul class="list-group text-center">
                            <% 
                            TodaysOrders todaysOrders = new TodaysOrders();
                            ArrayList<String> orders = todaysOrders.orderDetails(request.getParameter("Orders"));
                            for(String s : orders){
                            %>
                                <li class="list-group-item"><i class="fa fa-check"></i><%=s%></li>
                            <%} %>
                            </ul>
                            <div class="panel-body text-center">
                                <p><strong>Total:<span>$<%= request.getParameter("TotalAmount") %></span></strong></p>
                            </div>
                            <div class="panel-footer">
                                <a class="btn btn-lg btn-block hvr-underline-from-center" href="#"><p id="orderStatus">Waiting</p></a>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /item -->

                    
                </div>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end pricing-main -->
    <form type="hidden" id="orderidform">
    	<input type="hidden" id="orderid" >
    </form>
    
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
    <script type="text/javascript">
    	var timer = setInterval(status, 5000);
    	function status(){
    		var xhttp = new XMLHttpRequest();
    		xhttp.onreadystatechange = function() {
    			if (this.readyState == 4 && this.status == 200) {
    				document.getElementById("orderStatus").innerHTML = this.responseText;
    				if(this.responseText == "CANCELLED"){
    					document.getElementById("orderStatus").innerHTML = "Sorry Your Order is Rejected! Contact any Staff"
    					clearInterval(timer);
    				}
    				if(this.responseText == "OPEN"){
    					document.getElementById("orderStatus").innerHTML = "Your Order is in Queue, Please Wait for a Response"
    				}
    				if(this.responseText == "CLOSED"){
    					document.getElementById("orderStatus").innerHTML = "Your Order is Confirmed."
    					clearInterval(timer);
    				}
    			}
    		};
    		var url = "CurStatus?OrderId=" + "<%= request.getParameter("OrderId") %>";
    		xhttp.open("GET", url, true);
    		xhttp.send();
    	}
    </script>
</body>

</html>