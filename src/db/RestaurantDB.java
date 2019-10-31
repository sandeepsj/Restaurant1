package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RestaurantDB {
	public Statement DataRequest;
	//public static Statement staticDataRequest;
	public static Connection conn;
	public String Query;
	public static int no_of_tables = 18;
	/*
	 * here Static block is used. Because creating connection for each instance makes it easy to exceed the 
	 * maximum limit of connections set by the database manager. creating connection statically 
	 * makes that common for all the objects and only one connection is used for entire application
	 */
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC#", "root", null);
		//	staticDataRequest = conn.createStatement();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public RestaurantDB() throws ClassNotFoundException, SQLException {
		DataRequest = conn.createStatement();
	}
	protected void finalize() throws Throwable{
		DataRequest.close();
	}
	public int getRowCount(ResultSet rs) throws SQLException {
		int n = 0;
		while(rs.next())
			n++;
		rs.first();
		rs.previous();
		return n;
	}
}
