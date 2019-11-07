package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Employee extends RestaurantDB{
	public ResultSet EmployeeRow;
	public Employee() throws ClassNotFoundException, SQLException{
		
	}
	public int insertRow(String name,float salary,String address,String designation,String password,String phonenumber) throws SQLException {
		Query = "insert into employee values(null,'"+name+"',"+salary+",'"+address+"','"+designation+"','"+password+"','"+phonenumber+"')";
		DataRequest.executeUpdate(Query);

		Query = "select empid from employee where name='"+name+"' AND salary = "+salary+" AND address = '"+address+"' AND designation = '"+designation+"' AND password = '"+password+"' AND phone_number = '"+phonenumber+"'";

		ResultSet r = DataRequest.executeQuery(Query);r.next();
		int empid =r.getInt(1); 
		return empid;
	}
	public void getrow(int empid) throws SQLException {
		Query = "Select * from employee where empid = "+empid;
		EmployeeRow =  DataRequest.executeQuery(Query);
		EmployeeRow.next();
	}
	public void updaterow(String empid,String name,String salary,String address,String designation,String password,String phno) throws SQLException {
		Query = "UPDATE employee set name = '"+name+"',salary = "+salary+", address = '"+address+"',designation ='"+designation+"',password='"+password+"',phone_number='"+phno+"' where empid = "+empid ;
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
