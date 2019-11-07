package db;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ActivityLog extends RestaurantDB{
	public ResultSet UnSeenNotification;
	public ActivityLog() throws ClassNotFoundException, SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	public void UnSeenNotification() throws SQLException {
		Query = "SELECT * FROM activity_log WHERE SEEN = 'NOT SEEN' and (Activity = 'NEW_ORDER' or Activity = 'CANCELLED') order by Activity_id desc";
		UnSeenNotification = DataRequest.executeQuery(Query);
	}
	public String getOrderType(String orderid) throws SQLException {
		Query = "SELECT order_mod FROM order_history where orderID = "+orderid;
		Statement st = conn.createStatement();
		ResultSet r = st.executeQuery(Query);
		r.next();
		String Type = r.getString(1);
		return Type;
	}
	public String getName(String orderid) throws SQLException {
		Query = "SELECT name_of_customer FROM order_history where orderID = "+orderid;
		Statement st = conn.createStatement();
		ResultSet r = st.executeQuery(Query);
		r.next();
		String name = r.getString(1);
		return name;
	}
	public String getTableNo(String orderid) throws SQLException{
		Query = "SELECT table_no FROM orders_on_table where orderID = "+orderid;
		Statement st = conn.createStatement();
		ResultSet r = st.executeQuery(Query);
		r.next();
		String tableno = r.getString(1);
		return tableno;
	}
	public void setSeen(String Activity_id) throws SQLException {
		Query = "UPDATE ACTIVITY_LOG SET SEEN = 'SEEN' WHERE ACTIVITY_ID = "+Activity_id;
		Statement st = conn.createStatement();
		st.executeUpdate(Query);
	}
	public String getMaxActivityID() throws SQLException {
		Query = "SELECT MAX(Activity_id) from Activity_log";
		Statement st = conn.createStatement();
		ResultSet r = st.executeQuery(Query);
		r.next();
		String Activity_id = r.getString(1);
		return Activity_id;
	}

}
