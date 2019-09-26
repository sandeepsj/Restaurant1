package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;

public class TodaysMenu extends RestaurantDB{
	public int no_of_columns;
	public ResultSet Todays_Menu;
	public Hashtable<Integer, Integer> Menu = new Hashtable<Integer,Integer>() ;
	public TodaysMenu() throws SQLException, ClassNotFoundException {
		super();
		Query = "SELECT * FROM Todays_Menu;";
		Todays_Menu = DataRequest.executeQuery(Query);
		no_of_columns = Todays_Menu.getMetaData().getColumnCount();
	}
	public Hashtable<Integer, Integer> getTodaysMenu() throws SQLException{
		while(Todays_Menu.next()) {
			Menu.put(Todays_Menu.getInt("ItemCode"), Todays_Menu.getInt("Available_in_stock"));
		}
		Todays_Menu.first();
		Todays_Menu.previous();
		return Menu;
	}
	public void updateTodaysMenu(Hashtable<Integer, Integer> newMenu) throws SQLException {
		Enumeration<Integer> keys = newMenu.keys();
		Integer curKey;
		Query = "UPDATE TODAYS_MENU SET AVAILABLE_IN_STOCK = ? WHERE ITEMCODE = ?";
		PreparedStatement st = conn.prepareStatement(Query);
		for (int i=0 ;i < newMenu.size(); i++) {
			curKey = keys.nextElement();
			if(Menu.get(curKey) != newMenu.get(curKey)) {
				st.setInt(1, newMenu.get(curKey));
				st.setInt(2, curKey);
				st.executeUpdate();
			}
		}
		st.close();
	}
	protected void finalize() throws Throwable{
		Todays_Menu.close();
	}
}
