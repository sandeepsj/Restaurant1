package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RestaurantDB {
	public ResultSet result;
	public Statement DataRequest;
	public Connection conn;
	public String Query;
	public int no_of_tables;
	public RestaurantDB() throws ClassNotFoundException, SQLException {
		no_of_tables = 18;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC#", "root", null);
		DataRequest = conn.createStatement();
	}
	protected void finalize() throws Throwable{
		result.close();
		conn.close();
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
