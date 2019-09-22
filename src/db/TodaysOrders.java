package db;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TodaysOrders extends RestaurantDB{
	public int no_of_columns;
	public ResultSet todaysOrders;
	public int totalAmount;
	public TodaysOrders() throws ClassNotFoundException, SQLException {
		super();
		Query = "SELECT * FROM todays_orders;";
		todaysOrders = DataRequest.executeQuery(Query);
		no_of_columns = todaysOrders.getMetaData().getColumnCount();
	}
	
	public void Insert(int TableNo, String Name, int[][] itemDetails) throws SQLException, ClassNotFoundException {
		String StrItemDetails="";
		for (int i[] : itemDetails) {
			if(i[1] != 0)
				StrItemDetails += i[0]+":"+i[1]+";";
		}
		/*String qns = "";
		for (int i = 0;i < no_of_columns;i++)
			qns += "?,";*/
		ResultSet orderedid = conn.createStatement().executeQuery("SELECT MAX(ORDERID) FROM TODAYS_ORDERS");
		orderedid.next();
		int orderid = orderedid.getInt(1) + 1;
		orderedid.close();
		Query = "INSERT INTO todays_orders VALUES("+TableNo+",'"+StrItemDetails+"','"+Name+"',"+"'OPEN'"+","+TotalAmount(StrItemDetails)+","+orderid+")";
		/*PreparedStatement insertStatement = conn.prepareStatement(Query);
		insertStatement.setInt(1, TableNo);
		insertStatement.setString(2, StrItemDetails);
		insertStatement.setString(3, Name);
		insertStatement.setString(4, "OPEN");
		insertStatement.setFloat(5, TotalAmount(StrItemDetails));
		insertStatement.setInt(6, 1);
		insertStatement.executeUpdate();
		*/
		conn.createStatement().executeUpdate(Query);
		Refresh();
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
	public ResultSet selectAll() throws SQLException {
		Refresh();
		return todaysOrders;
	}
	public void Refresh() throws SQLException {
		Query = "SELECT * FROM FOODs;";
		todaysOrders = DataRequest.executeQuery(Query);
		no_of_columns = todaysOrders.getMetaData().getColumnCount();
	}
	protected void finalize() throws Throwable{
		todaysOrders.close();
	}
}
