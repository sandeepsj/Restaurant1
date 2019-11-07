package tools;

import java.sql.ResultSet;
import java.sql.SQLException;

import db.RestaurantDB;

public class NotificationTools extends RestaurantDB{
	
	public NotificationTools() throws ClassNotFoundException, SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int CountOpenOrders(String Type) throws SQLException {
		if(Type.equals("HOME")) {
			Query = "SELECT count(*) FROM todays_orders as `to` ,order_at_home as oh WHERE `to`.cur_status = 'OPEN' and `to`.orderID = oh.orderID";
			ResultSet r = DataRequest.executeQuery(Query);
			r.next();
			int count = r.getInt(1);
			return count;
		}
		else if(Type.equals("TABLE")) {
			Query = "SELECT count(*) FROM todays_orders as `to` ,orders_on_table as oh WHERE `to`.cur_status = 'OPEN' and `to`.orderID = oh.orderID";
			ResultSet r = DataRequest.executeQuery(Query);
			r.next();
			int count = r.getInt(1);
			return count;
		}
		return -1;
	}
}
