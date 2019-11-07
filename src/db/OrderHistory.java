package db;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderHistory extends RestaurantDB{
	public class OrderDetails{
		public ArrayList<ArrayList<String>> openorders = new ArrayList<ArrayList<String>>();
		public ArrayList<String> Name = new ArrayList<String>();
		public ArrayList<Float> TotalAmount = new ArrayList<Float>();
		public ArrayList<String> mod = new ArrayList<String>();
		public ArrayList<Integer> OrderId = new ArrayList<Integer>();
	}
	/*
	 * Table Order is for storing the data of orders which are ordered to the table only while
	 * home order stores data of orders demanding home delivery
	 */
	
	/*
	 * ---------------------------------------------------------------------------
	 *                       class for Table orders
	 *----------------------------------------------------------------------------                      
	 */
	public class TableOrders extends OrderDetails{
		public ArrayList<Integer> TableNo = new ArrayList<Integer>();
		public TableOrders OpenOrders() throws ClassNotFoundException, SQLException {
			TableOrders OpenOrder = new TableOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, orders_on_table as otable where torder.cur_Status = 'OPEN' and torder.order_mod = 'TABLE' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.TableNo.add(OpenOrders.getInt("table_no"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		
		public TableOrders ClosedOrders() throws ClassNotFoundException, SQLException {
			TableOrders OpenOrder = new TableOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, orders_on_table as otable where torder.cur_Status = 'CLOSED' and torder.order_mod = 'TABLE' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.TableNo.add(OpenOrders.getInt("table_no"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		
		public TableOrders CancelledOrders() throws ClassNotFoundException, SQLException {
			TableOrders OpenOrder = new TableOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, orders_on_table as otable where torder.cur_Status = 'CANCELLED' and torder.order_mod = 'TABLE' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.TableNo.add(OpenOrders.getInt("table_no"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		public TableOrders RejectedOrders() throws ClassNotFoundException, SQLException {
			TableOrders OpenOrder = new TableOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, orders_on_table as otable where torder.cur_Status = 'REJECTED' and torder.order_mod = 'TABLE' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.TableNo.add(OpenOrders.getInt("table_no"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
	}
	
	
	/*
	 * -----------------------------------------------------------------
	 *                     class for homeOrders
	 * -----------------------------------------------------------------
	 */
	public class HomeOrders extends OrderDetails{
		public ArrayList<String> address = new ArrayList<String>();
		public ArrayList<String> contact_number = new ArrayList<String>();
		public HomeOrders OpenOrders() throws ClassNotFoundException, SQLException {
			HomeOrders OpenOrder = new HomeOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, order_at_home as otable where torder.cur_Status = 'OPEN' and torder.order_mod = 'HOME' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.address.add(OpenOrders.getString("address"));
				OpenOrder.contact_number.add(OpenOrders.getString("contact_number"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		
		public HomeOrders ClosedOrders() throws ClassNotFoundException, SQLException {
			HomeOrders OpenOrder = new HomeOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, order_at_home as otable where torder.cur_Status = 'CLOSED' and torder.order_mod = 'HOME' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.address.add(OpenOrders.getString("address"));
				OpenOrder.contact_number.add(OpenOrders.getString("contact_number"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		
		public HomeOrders CancelledOrders() throws ClassNotFoundException, SQLException {
			HomeOrders OpenOrder = new HomeOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, order_at_home as otable where torder.cur_Status = 'CANCELLED' and torder.order_mod = 'HOME' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.address.add(OpenOrders.getString("address"));
				OpenOrder.contact_number.add(OpenOrders.getString("contact_number"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
		public HomeOrders RejectedOrders() throws ClassNotFoundException, SQLException {
			HomeOrders OpenOrder = new HomeOrders();
			int i = 0;
			String sql = "Select * from todays_orders torder, order_at_home as otable where torder.cur_Status = 'REJECTED' and torder.order_mod = 'HOME' and torder.orderID = otable.orderID;";
			ResultSet OpenOrders = DataRequest.executeQuery(sql); 
			while(OpenOrders.next()) {
				OpenOrder.TotalAmount.add(OpenOrders.getFloat("Total_Amount"));
				OpenOrder.address.add(OpenOrders.getString("address"));
				OpenOrder.contact_number.add(OpenOrders.getString("contact_number"));
				OpenOrder.Name.add(OpenOrders.getString("Name_of_customer"));
				OpenOrder.OrderId.add(OpenOrders.getInt("orderID"));
				ArrayList<String> orderdetails = new ArrayList<String>();
				orderdetails = orderDetails(OpenOrders.getString("order_list"));
				OpenOrder.openorders.add(orderdetails);
				
			}
			OpenOrders.close();
			return OpenOrder;
		}
	}
	public int LastOrderId;
	public ResultSet todaysOrders;
	public int totalAmount;
	public ResultSetMetaData OrderMeta;
	public int no_of_columns;
	public OrderHistory() throws ClassNotFoundException, SQLException {
		super();
		Query = "SELECT max(Orderid) from order_history;";
		todaysOrders = DataRequest.executeQuery(Query);
		todaysOrders.next();
		LastOrderId = todaysOrders.getInt(1);
		Query = "Select * from order_history;";
		todaysOrders = DataRequest.executeQuery(Query);
		OrderMeta = todaysOrders.getMetaData();
		no_of_columns = OrderMeta.getColumnCount();
	}
	
	public void changeCurStatus(String Action, int OrderId) throws SQLException {
		String sql = "UPDATE order_history set cur_Status = ";
		if(Action.compareTo("Close") == 0) {
			sql += "\"CLOSED\" ";
		}
		else if(Action.compareTo("Reject") == 0) {
			sql += "\"REJECTED\" ";
		}
		else if(Action.compareTo("Cancelled") == 0) {
			sql += "\"CANCELLED\" ";
		}
		sql += "WHERE orderID = "+OrderId;
		DataRequest.executeUpdate(sql);
	}
	
	
	
	//Function to convert int array of itemcode and number of items into a single string of json format
	public String itemDetailsToString(int[][] itemDetails) {
		String StrItemDetails="";
		
		for (int i[] : itemDetails) {
			if(i[1] != 0)
				StrItemDetails += i[0]+":"+i[1]+";";
		}
		return StrItemDetails;
	}
	
	/* 
	 * The mthod Insert has two versions which are differentiated with parameter type 
	 * Which is required to deal with both orders to the table and home delivery
	 */
	public String Insert(int TableNo, String Name, int[][] itemDetails) throws SQLException, ClassNotFoundException {
		
		String StrItemDetails=itemDetailsToString(itemDetails);//Call function itemDetailsToString()
		
		/*Using the Stored procedure InsertTableOrder since 
		 * its required into insert values into two tables
		 *  1-orderHistory and 2-order_table
		 */
		Query = "{CALL `InsertTableOrder`(?,?,?,?,?,?)}";
		//Query = "CALL `InsertTableOrder`('"+StrItemDetails+"','"+Name+"','"+"OPEN"+"',"+TotalAmount(StrItemDetails)+","+TableNo+")";
		CallableStatement cstmt = conn.prepareCall(Query);
		cstmt.setString(1, StrItemDetails);
		cstmt.setString(2, Name);
		cstmt.setString(3, "OPEN");
		cstmt.setInt(4, (int)TotalAmount(StrItemDetails));
		cstmt.setInt(5, TableNo);
		cstmt.registerOutParameter(6, java.sql.Types.INTEGER);
		cstmt.executeUpdate();
		int orderid = cstmt.getInt(6);
		
		/*refresh is used to get the new table details after a row is inserted the prvious result 
		 * set is now updated with the latest changes made to the table
		 */
		Refresh();
		StrItemDetails = orderid + "$" + StrItemDetails;
		return StrItemDetails;
	}
	public String Insert(String Name, int[][] itemDetails,String address,String phno) throws SQLException, ClassNotFoundException {

		String StrItemDetails=itemDetailsToString(itemDetails);//Call function itemDetailsToString()
		
		/*Using the Stored procedure InsertTableOrder since 
		 * its required into insert values into two tables
		 *  1-orderHistory and 2-order_home(which is made to keep details of home delivery)
		 */
		Query = "{CALL `InsertHomeOrder`(?,?,?,?,?,?,?)}";
		//Query = "CALL `InsertHomeOrder`('"+StrItemDetails+"','"+Name+"','"+"OPEN"+"',"+TotalAmount(StrItemDetails)+",'"+address+"','"+phno+"')";
		CallableStatement cstmt = conn.prepareCall(Query);
		cstmt.setString(1, StrItemDetails);
		cstmt.setString(2, Name);
		cstmt.setString(3, "OPEN");
		cstmt.setInt(4, (int)TotalAmount(StrItemDetails));
		cstmt.setString(5, address);
		cstmt.setString(6, phno);
		cstmt.registerOutParameter(7, java.sql.Types.INTEGER);
		cstmt.executeUpdate();
		int orderid = cstmt.getInt(7);
		
		
		/*refresh is used to get the new table details after a row is inserted the prvious result 
		 * set is now updated with the latest changes made to the table
		 */
		Refresh();
		StrItemDetails = orderid + "$" + StrItemDetails;
		return StrItemDetails;
	}
	
	public float TotalAmount(String StrItemDetails) throws ClassNotFoundException, SQLException {
		Foods f = new Foods();
		StringTokenizer st = new StringTokenizer(StrItemDetails,";");
		float amount = 0;
		while(st.hasMoreTokens()) {
			StringTokenizer item = new StringTokenizer(st.nextToken(),":");
			amount += f.PriceTable.get(Integer.parseInt(item.nextToken()))* Float.parseFloat(item.nextToken());
		}
		return amount;
	}
	
	public ArrayList<String> orderDetails(String StrItemDetails) throws ClassNotFoundException, SQLException {
		Foods f = new Foods(0);
		StringTokenizer st = new StringTokenizer(StrItemDetails,";");
		ArrayList<String> orderdetails = new ArrayList<String>();
		int i = 0;
		while(st.hasMoreTokens()) {
			StringTokenizer item = new StringTokenizer(st.nextToken(),":");
			int itemCode = Integer.parseInt(item.nextToken());
			Float CostPerItem = f.PriceTable.get(itemCode);
			int NoItem = Integer.parseInt(item.nextToken());
			float totalPerItem = CostPerItem * NoItem;
			ResultSet itemName = f.ExecuteQuerie("SELECT FoodItemName from Foods where ItemCode = " + itemCode);
			itemName.next();
			String temp = itemName.getString(1) + " X " + NoItem + " :	" + totalPerItem;;
			orderdetails.add(temp); 
		}
		return orderdetails;
	}
	
	public String curStatus(int OrderId) throws SQLException {
		String sql = "SELECT cur_Status from order_history where orderID = "+OrderId ;
		ResultSet status = DataRequest.executeQuery(sql);
		status.next();
		return status.getString(1);
	}
	
	public ResultSet selectAll() throws SQLException {
		Refresh();
		return todaysOrders;
	}
	public void Refresh() throws SQLException {
		Query = "SELECT * FROM order_history;";
		todaysOrders = DataRequest.executeQuery(Query);
	}
	protected void finalize() throws Throwable{
		todaysOrders.close();
	}
}
