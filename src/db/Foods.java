package db;

import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

public class Foods extends RestaurantDB{
	public int no_of_columns;
	public ResultSet foods;
	public Domain[] DomainTypes = Domain.values();
	public int curDomain = -1;
	//Pricelist[n][m]; n = itemcode; m = price;
	Hashtable<Integer,Float> PriceTable = new Hashtable<Integer,Float>();
	//public ResultSet curDomainSet;
	/*public class FoodsRow{
		public int itemCode;
		public String FoodItemName;
		public String FoodDomain;
		public float Price;
		public int Rating;
		public Blob image;
	}*/
	
	public Foods() throws ClassNotFoundException, SQLException {
		super();
		Query = "SELECT * FROM FOODS;";
		foods = DataRequest.executeQuery(Query);
		no_of_columns = foods.getMetaData().getColumnCount();
		int i = 0;
		while(foods.next()) {
			PriceTable.put(foods.getInt("ItemCode"), foods.getFloat("Price"));
		}
		foods.first();
		foods.previous();
		//Setting Domain count
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
	/*}
		Domain[] Domains = Domain.values();
		Groups = new ResultSet[Domains.length];
		for (int i = 0; i<Domains.length; i++) {
			GetByDomain.setString(1, Domains[i].toString());
			Groups[i] = GetByDomain.executeQuery();
		}/* this is not possible because after each iteration the groups element connection is closed.one connection can be used only for one resultset

	}

	/*public void insertRows(Object [] row) throws SQLException {
		insertStatement.setInt(1, row[0].getClass());
	}*/

	public void insertRow(int itemCode, String FoodItemName, String FoodDomain, float Price, int Rating, Blob image) throws SQLException {
		PreparedStatement insertStatement;
		//Preparing insert statement
		String qns = "";
		for (int i = 0;i < no_of_columns;i++)
			qns += "?,";
		Query = "INSERT INTO FOODS VALUES("+qns+")";
		insertStatement = conn.prepareStatement(Query);

		insertStatement.setInt(1, itemCode);
		insertStatement.setString(2, FoodItemName);
		insertStatement.setString(3, FoodDomain);
		insertStatement.setFloat(4, Price);
		insertStatement.setInt(5, Rating);
		insertStatement.setBlob(6, image);
		insertStatement.executeUpdate();
		Refresh();
	}
	public int[] AvailableToday() throws SQLException {
		Query = "SELECT T.ITEMCODE FROM foods F ,TODAYS_MENU T WHERE F.itemCode=T.itemCode and Available_in_stock = 1";
		ResultSet tmp = conn.createStatement().executeQuery(Query);
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
		ResultSet tmp = conn.createStatement().executeQuery(Query);
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
