package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Employee extends RestaurantDB{
	public Employee() throws ClassNotFoundException, SQLException{
		
	}
	public void insertRow(String name,float salary,String address,String designation,String password,String phonenumber) throws SQLException {
		Query = "insert into employee values(null,'"+name+"',"+salary+",'"+address+"','"+designation+"','"+password+"','"+phonenumber+"')";
		DataRequest.executeUpdate(Query);
	}
	public boolean validateUserCredential(String empid,String password) throws SQLException {
		Query = "select count(*) from employee where empid="+empid+" and password='"+password+"';";
		ResultSet rs = DataRequest.executeQuery(Query);
		rs.next();
		if(rs.getInt(1) == 0) {
			rs.close();
			return false;
		}
		rs.close();
		return true;
					
	}
	protected void finalize() throws Throwable{
	
	}
}
