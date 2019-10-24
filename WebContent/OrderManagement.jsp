<%@ page import = "java.util.ArrayList" %>
<%@ page import="db.TodaysOrders"%>
<%@ page import="db.TodaysOrders.OpenOrderDetails"%>
<%
TodaysOrders to = new TodaysOrders();
OpenOrderDetails ood = to.OpenOrders();
OpenOrderDetails ood2 = to.ClosedOrders();
OpenOrderDetails ood3 = to.CancelledOrders();
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
    <link id="changeable-colors" rel="stylesheet" href="css/colors/moderate-green.css" />

    <!-- Modernizer -->
    <script src="js/modernizer.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .fixedRow{
            height: 200px;
            overflow-y:scroll;
        }
    </style>

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
						Orders Waiting
					</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut orci varius, elementum lectus nec, aliquam lectus. Duis neque augue, maximus in sapien ut, porta pharetra odio.</p>
                </div>
                <div class="panel-pricing-in">
                	<%for(int i =0; i < ood.openorders.size(); i++){ 
                    	ArrayList<String> items = ood.openorders.get(i);
                    	String NameOfCustomer = ood.Name.get(i); 
                    	float TotalAmount = ood.TotalAmount.get(i);
                    	int TableNo = ood.TableNo.get(i);
                    	int OrderId = ood.OrderId.get(i);
                    %>
                    <!-- item -->
                    
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p><strong>Total:<span>$<%= TotalAmount %></span></strong></p>
                            </div>
                            <div class = "fixedRow">
                            <ul class="list-group text-center">
                            <% 
                            for(String item : items){
                            %>
                                <li class="list-group-item"><i class="fa fa-check"></i><%=item%></li>
                            <%} %>
                            </ul>
                            </div>
                            
                            <div class="panel-footer" >
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick="Close(<%= OrderId%>)">Confirm</a>
                            </div>
                            <div class="panel-footer" >
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick = "Reject(<%= OrderId%>)">Reject</a>
                            </div>
                            
                        </div>
                    
                    </div>
                    <!-- /item -->
                    <%} %>

                </div>
            </div>
            <!-- end row -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="block-title text-center">
						Orders Closed
					</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut orci varius, elementum lectus nec, aliquam lectus. Duis neque augue, maximus in sapien ut, porta pharetra odio.</p>
                </div>
                <div class="panel-pricing-in">
                	<%for(int i =0; i < ood2.openorders.size(); i++){ 
                    	ArrayList<String> items = ood2.openorders.get(i);
                    	String NameOfCustomer = ood2.Name.get(i); 
                    	float TotalAmount = ood2.TotalAmount.get(i);
                    	int TableNo = ood2.TableNo.get(i);
                    	int OrderId = ood2.OrderId.get(i);
                    %>
                    <!-- item -->
                    
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p><strong>Total:<span>$<%= TotalAmount %></span></strong></p>
                            </div>
                            <div class = "fixedRow">
                            <ul class="list-group text-center">
                            <% 
                            for(String item : items){
                            %>
                                <li class="list-group-item"><i class="fa fa-check"></i><%=item%></li>
                            <%} %>
                            </ul>
                            </div>
                            
                            <div class="panel-footer" >
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick = "Reject(<%= OrderId%>)">Reject</a>
                            </div>
                            
                        </div>
                    
                    </div>
                    <!-- /item -->
                    <%} %>

                </div>
            </div>
            <!-- end row -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="block-title text-center">
						Orders Cancelled
					</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut orci varius, elementum lectus nec, aliquam lectus. Duis neque augue, maximus in sapien ut, porta pharetra odio.</p>
                </div>
                <div class="panel-pricing-in">
                	<%for(int i =0; i < ood3.openorders.size(); i++){ 
                    	ArrayList<String> items = ood3.openorders.get(i);
                    	String NameOfCustomer = ood3.Name.get(i); 
                    	float TotalAmount = ood3.TotalAmount.get(i);
                    	int TableNo = ood3.TableNo.get(i);
                    	int OrderId = ood3.OrderId.get(i);
                    %>
                    <!-- item -->
                    
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p><strong>Total:<span>$<%= TotalAmount %></span></strong></p>
                            </div>
                            
                            <div class = "fixedRow">
                            <ul class="list-group text-center">
                            <% 
                            for(String item : items){
                            %>
                                <li class="list-group-item"><i class="fa fa-check"></i><%=item%></li>
                            <%} %>
                            </ul>
                            </div>
                            
                            <div class="panel-footer" >
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick="Close(<%= OrderId%>)">Confirm</a>
                            </div>
                            
                            
                        </div>
                    
                    </div>
                    <!-- /item -->
                    <%} %>

                </div>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end pricing-main -->

    
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
    <form type="hidden" id="orderStatus" action="SetCurStatusOfOrder">
        <input type="text" id="Action" type="hidden" name="Action">
        <input type="text" id="OrderId" type="hidden" name="OrderId">
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
    <script type="text/javascript">
        function Close(OrderId){
            document.getElementById("Action").value = "Close"
            document.getElementById("OrderId").value = OrderId;
            document.getElementById("orderStatus").submit();

        }
        function Reject(OrderId){
            document.getElementById("Action").value = "Reject"
            document.getElementById("OrderId").value = OrderId;
            document.getElementById("orderStatus").submit();
        }
    </script>
    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
</body>

</html>