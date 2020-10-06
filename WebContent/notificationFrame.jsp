<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="tools.NotificationTools"%>
<%@ page import="db.ActivityLog"%>
<%@ page import="java.sql.ResultSet"%>
<%
	HttpSession checksession = request.getSession(false);
	if (checksession.getAttribute("empid") != null) {
		NotificationTools ntools = new NotificationTools();
		int CountHomeOrders = ntools.CountOpenOrders("HOME");
		int CountTableOrders = ntools.CountOpenOrders("TABLE");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/notificationStyles.css">
</head>
<body>
	<div class = "notification-super-container">
		<div class="notification-container">
			<%
				ActivityLog alog = new ActivityLog();
					alog.UnSeenNotification();
					String MaxActivityID = alog.getMaxActivityID();
					while (alog.UnSeenNotification.next()) {
						String Activity = alog.UnSeenNotification.getString("Activity");
						String orderid = alog.UnSeenNotification.getString("orderID");
						String Activity_id = alog.UnSeenNotification.getString("Activity_id");
						String Type = alog.getOrderType(orderid);
						String Name = alog.getName(orderid);

						if (Type.equals("HOME")) {
							if (Activity.equals("NEW_ORDER")) {
			%>

			<div class="alert success">
				<div onclick="SetSeen(<%=Activity_id%>,'HOME','CLOSE')">
					<span class="closebtn">&times;</span>
				</div>
				<strong style="cursor: pointer;"
					onclick="SetSeen(<%=Activity_id%>,'HOME')">New Order</strong> There
				is a new Order! for Home delivery From
				<%=Name%>.<b>Order ID <%=orderid%>.
				</b>
			</div>
			<%
				} else if (Activity.equals("CANCELLED")) {
			%>

			<div class="alert warning">
				<div onclick="SetSeen(<%=Activity_id%>,'HOME','CLOSE')">
					<span class="closebtn">&times;</span>
				</div>
				<strong style="cursor: pointer;"
					onclick="SetSeen(<%=Activity_id%>,'HOME','SELECT')">Cancelled!</strong>
				The order by
				<%=Name%>
				for home delivery is cancelled by the Customer.<b>Order ID <%=orderid%>.
				</b>

			</div>

			<%
				}
						} else if (Type.equals("TABLE")) {
							String TableNo = alog.getTableNo(orderid);
							if (Activity.equals("NEW_ORDER")) {
			%>

			<div class="alert info">
				<div onclick="SetSeen(<%=Activity_id%>,'TABLE','CLOSE')">
					<span class="closebtn">&times;</span>
				</div>
				<strong style="cursor: pointer;"
					onclick="SetSeen(<%=Activity_id%>,'TABLE','SELECT')">New
					Order</strong> There is a new Order! for Home delivery From
				<%=Name%>
				on Table No
				<%=TableNo%>.<b>Order ID <%=orderid%>.
				</b>
			</div>
			<%
				} else if (Activity.equals("CANCELLED")) {
			%>

			<div class="alert warning">
				<div onclick="SetSeen(<%=Activity_id%>,'TABLE','CLOSE')">
					<span class="closebtn">&times;</span>
				</div>
				<strong style="cursor: pointer;"
					onclick="SetSeen(<%=Activity_id%>,'TABLE','SELECT')">Cancelled!</strong>
				The order on Table No
				<%=TableNo%>
				is cancelled by the Customer.<b>Order ID <%=orderid%>.
				</b>

			</div>

			<%
				}
						}
					}
			%>

		</div>
		<div class="status-container">

				<div class="status-block1"
					onclick="window.parent.location.href='OrderManagement.jsp'">
					<p>
						<b>On Table</b>
					</p>
					<p><%=CountTableOrders%>
						Orders are in Waiting list
					</p>
				</div>
				<div class="status-block2"
					onclick="window.parent.location.href='HomeOrderManagement.jsp'">
					<p>
						<b>Home delivery</b>
					</p>
					<p><%=CountHomeOrders%>
						Orders are in Waiting list
					</p>
				</div>

		</div>
	</div>

	<script>
		var close = document.getElementsByClassName("closebtn");
		var i;
		var timer = setInterval(SyncNotification, 1000);
		for (i = 0; i < close.length; i++) {
		  close[i].onclick = function(){
		    var div = this.parentElement.parentElement;
		    div.style.opacity = "0";
		    setTimeout(function(){ div.style.display = "none"; }, 600);
		  }
		}
		function SetSeen(Activity_id,Type,Action){
			var xhttp = new XMLHttpRequest();
			var url = "SetSeen?Activity_id=" + Activity_id;
			xhttp.open("GET", url, true);
			xhttp.send();
			if(Type == 'HOME' && Action != 'CLOSE'){
				window.top.location.href='HomeOrderManagement.jsp';
			}
			else if(Type == 'TABLE' && Action != 'CLOSE'){
				window.top.location.href='OrderManagement.jsp';
			}
			
		}
		var maxid = <%=MaxActivityID%>;
		function SyncNotification(){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
    			if (this.readyState == 4 && this.status == 200) {
    				if(this.responseText != maxid){
    					location.reload();
    				}
    			}
    		};
    		var url = "SyncNotification?MaxAcitivityID=" + maxid;
    		xhttp.open("GET", url, true);
    		xhttp.send();
			
		}
	</script>
	<%
		}
	%>
</body>
</html>