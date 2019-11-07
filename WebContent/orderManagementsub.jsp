<%@ page import = "java.util.ArrayList" %>
<%@ page import="db.OrderHistory"%>
<%@ page import="db.OrderHistory.TableOrders"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%

OrderHistory to = new OrderHistory();

TableOrders ood1 = to.new TableOrders().OpenOrders();
TableOrders ood2 = to.new TableOrders().ClosedOrders();
TableOrders ood3 = to.new TableOrders().RejectedOrders();
TableOrders ood4 = to.new TableOrders().CancelledOrders();
HttpSession checksession = request.getSession(false);
if(checksession.getAttribute("empid") == null){
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

    <!-- Modernizer -->
    <script src="js/modernizer.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .fixedRow{
            height: 170px;
            overflow-y:scroll;
        }
    </style>

</head>

<body>
    
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
                	<%for(int i =0; i < ood1.openorders.size(); i++){ 
                    	ArrayList<String> items = ood1.openorders.get(i);
                    	String NameOfCustomer = ood1.Name.get(i); 
                    	float TotalAmount = ood1.TotalAmount.get(i);
                    	int TableNo = ood1.TableNo.get(i);
                    	int OrderId = ood1.OrderId.get(i);
                    %>
                    <!-- item -->
                    
                    <div class="col-md-3 col-sm-3 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p>Total:<span>$<%= TotalAmount %></span></p>
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
						Orders Confirmed
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
                    
                    <div class="col-md-3 col-sm-3 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p>Total:<span>$<%= TotalAmount %></span></p>
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
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick = "Reject(<%= OrderId%>)">Change to Reject</a>
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
						Orders Rejected
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
                    
                    <div class="col-md-3 col-sm-3 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p>Total:<span>$<%= TotalAmount %></span></p>
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
                                <a class="btn btn-lg btn-block hvr-underline-from-center" onclick="Close(<%= OrderId%>)">Change to Confirm</a>
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
						Orders Rejected
					</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut orci varius, elementum lectus nec, aliquam lectus. Duis neque augue, maximus in sapien ut, porta pharetra odio.</p>
                </div>
                <div class="panel-pricing-in">
                	<%for(int i =0; i < ood4.openorders.size(); i++){ 
                    	ArrayList<String> items = ood4.openorders.get(i);
                    	String NameOfCustomer = ood4.Name.get(i); 
                    	float TotalAmount = ood4.TotalAmount.get(i);
                    	int TableNo = ood4.TableNo.get(i);
                    	int OrderId = ood4.OrderId.get(i);
                    %>
                    <!-- item -->
                    
                    <div class="col-md-3 col-sm-3 text-center">
                        <div class="panel panel-pricing">
                            <div class="panel-heading">
                                <div class="pric-icon">
                                    <img src="images/food.png" alt="" />
                                </div>
                                <h3>Table No:<%=TableNo %>--<%=NameOfCustomer %></h3>
                            </div>
                    
                            <div class="panel-body text-center">
                                <p>Total:<span>$<%= TotalAmount %></span></p>
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

    <form type="hidden" id="orderStatus" action="SetCurStatusOfOrder">
        <input id="Action" type="hidden" name="Action">
        <input id="OrderId" type="hidden" name="OrderId">
        <input id="Type" type="hidden" name="Type" value="TABLE">
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
    <script type="text/javascript">
    	var timer = setInterval(status, 500);
    	function status(){
    		var xhttp = new XMLHttpRequest();
    		xhttp.onreadystatechange = function() {
    			if (this.readyState == 4 && this.status == 200) {
    				if(this.responseText != <%= to.LastOrderId %>){
    					alert("There is a new Order!")
    					location.reload();
    				}
    			}
    		};
    		var url = "LastOrder";
    		xhttp.open("GET", url, true);
    		xhttp.send();
    	}
    </script>
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