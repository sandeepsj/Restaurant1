package db;

import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

public class Foods extends RestaurantDB{
	public int no_of_columns;
	public ResultSet foods;
	public Domain[] DomainTypes = Domain.values();
	public int curDomain = -1;
	public ResultSetMetaData foodMeta;
	public int nextItemCode;
	Hashtable<Integer,Float> PriceTable = new Hashtable<Integer,Float>();
	public Foods(int a) throws ClassNotFoundException, SQLException {
		Query = "SELECT * FROM FOODS;";
		foods = DataRequest.executeQuery(Query);
		while(foods.next()) {
			PriceTable.put(foods.getInt("ItemCode"), foods.getFloat("Price"));
		}
		foods.close();
	}
	public Foods() throws ClassNotFoundException, SQLException {
		super();
		ResultSet r = DataRequest.executeQuery("SELECT MAX(itemCode) from Foods");
		r.next();
		nextItemCode = r.getInt(1)+1;
		r.close();
		Query = "SELECT * FROM FOODS;";
		foods = DataRequest.executeQuery(Query);
		foodMeta = foods.getMetaData();
		no_of_columns = foodMeta.getColumnCount();
		int i = 0;
		while(foods.next()) {
			PriceTable.put(foods.getInt("ItemCode"), foods.getFloat("Price"));
		}
		foods.first();
		foods.previous();
		
		//Setting Domain count
	}
	public ResultSet ExecuteQuerie(String query) throws SQLException {
		return DataRequest.executeQuery(query);
	}
	public void UpdateQuerie(String query) throws SQLException {
		DataRequest.executeUpdate(query);
	}
	public ResultSet selectAll() throws SQLException {
		Refresh();
		return foods;
	}

	public boolean nextDomain() throws SQLException {
		curDomain++;
		if(curDomain < DomainTypes.length)
			return true;
		curDomain = -1;
		return false;
	}

	public ResultSet curDomain() throws SQLException {
		if(curDomain >= 0 && curDomain < DomainTypes.length);
		return GroupByDomain(DomainTypes[curDomain].toString());
	}

	public ResultSet GroupByDomain(String domain) throws SQLException {
		Query = "SELECT * FROM FOODS where foodDomain = '"+ domain+"';";
		return conn.createStatement().executeQuery(Query);
	}
	
	public void deleteRow(int ItemCode) throws SQLException {
		Query = "DELETE from foods where itemCode = " + ItemCode;
		conn.createStatement().executeUpdate(Query);
		Query = "DELETE from todays_menu where itemCode = " + ItemCode;
		conn.createStatement().executeUpdate(Query);
	}

	public void insertRow(String FoodItemName, String FoodDomain, float Price, int Rating, String image,String description) throws SQLException {
		PreparedStatement insertStatement;
		//Preparing insert statement
		String qns = "";
		for (int i = 0;i < no_of_columns-2;i++)
			qns += "?,";
		qns += "?";
		Query = "INSERT INTO FOODS (FoodItemName, FoodDomain, Price, Rating, imagePath, Description) VALUES("+qns+")";
		insertStatement = conn.prepareStatement(Query);
		insertStatement.setString(1, FoodItemName);
		insertStatement.setString(2, FoodDomain);
		insertStatement.setFloat(3, Price);
		insertStatement.setInt(4, Rating);
		insertStatement.setString(5, image);
		insertStatement.setString(6, description);
		insertStatement.executeUpdate();
		//DataRequest.executeUpdate("Insert into Todays_menu values("+itemCode+",0)");//Use trigger
		Refresh();
	}
	public int[] AvailableToday() throws SQLException {
		Query = "SELECT T.ITEMCODE FROM foods F ,TODAYS_MENU T WHERE F.itemCode=T.itemCode and Available_in_stock = 1";
		ResultSet tmp = DataRequest.executeQuery(Query);
		int n = 0;
		int [] arr = new int[getRowCount(tmp)];
		int i = 0;
		while(tmp.next())
			arr[i++] = tmp.getInt(1);
		tmp.close();
		return arr;
	}
	public boolean isAvailableToday(int itemCode) throws SQLException {
		Query = "SELECT Available_in_stock FROM TODAYS_MENU where ItemCode = " + itemCode;
		ResultSet tmp = DataRequest.executeQuery(Query);
		tmp.next();
		return (tmp.getInt(1)==1);
	}

	public void Refresh() throws SQLException {
		Query = "SELECT * FROM FOODs;";
		foods = DataRequest.executeQuery(Query);
		no_of_columns = foods.getMetaData().getColumnCount();
	}
	protected void finalize() throws Throwable{
		foods.close();
	}

}
