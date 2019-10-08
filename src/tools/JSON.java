package tools;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import org.json.*;
public class JSON {
	String JSONstr;
	Hashtable<Integer, Hashtable<String, String>> JSONHash;
	public JSON (String jsonStr) {
		JSONstr = jsonStr;
	}
	public List<String> StrToUpdateQueries() throws JSONException{
		JSONObject eg = new JSONObject(JSONstr);
		Iterator<String> itemCodeItr = eg.keys();
		List<String> QuerieSet = new ArrayList<String>();
		while(itemCodeItr.hasNext()) {
			String query = "UPDATE FOODS SET ";
			String itemCode = itemCodeItr.next();
			JSONObject eg1 = new JSONObject(eg.getString(itemCode));
			Iterator<String> domainsItr = eg1.keys();
			int i = 0;
			while(domainsItr.hasNext()) {
				if (i != 0)
					query += ", ";
				else
					i = 1;
				String attr = domainsItr.next();
				String domain = eg1.getString(attr);
				query += attr+ " = ";
				query += "\""+domain+"\" ";
			}
			query += "WHERE ITEMCODE = "+itemCode + ";";
			QuerieSet.add(query);
		}
		return QuerieSet;
	}
	
	/*public List<String> StrTooUpdateQueries(){
		String jsonTemp = JSONstr.substring(1, JSONstr.length());
		jsonTemp = jsonTemp.substring(1, jsonTemp.length());
		StringTokenizer st = new StringTokenizer(jsonTemp,"}");
		List<String> QuerieSet = new ArrayList<String>();
		while(st.hasMoreTokens()) {
			String querie;
			querie = "UPDATE FOODS SET ";
			String row = st.nextToken();
			StringTokenizer st1 = new StringTokenizer(row, "{");
			String itemCode = st1.nextToken().replaceAll("\"|,|:","");
			String update = st1.nextToken().replaceAll("\"","");
			StringTokenizer st2 = new StringTokenizer(update, ",");
			int i = 0;
			while(st2.hasMoreTokens()) {
				if (i != 0)
					querie += ", ";
				else
					i = 1;
				StringTokenizer temp = new StringTokenizer(st2.nextToken(),":");
				String attr = temp.nextToken();
				String domain = temp.nextToken();
				System.out.println(domain);
				querie += attr+ " = ";
				querie += "\""+domain+"\" ";
			}
			querie += "WHERE ITEMCODE = "+itemCode + ";";
			QuerieSet.add(querie);
		}
		return QuerieSet;
	}*/
}
