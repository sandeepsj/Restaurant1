package tools;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

public class JSON {
	String JSONstr;
	Hashtable<Integer, Hashtable<String, String>> JSONHash;
	public JSON (String jsonStr) {
		JSONstr = jsonStr;
	}
	
	public List<String> StrToUpdateQueries(){
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
				querie += attr+ " = ";
				querie += "\""+domain+"\" ";
			}
			querie += "WHERE ITEMCODE = "+itemCode + ";";
			QuerieSet.add(querie);
		}
		return QuerieSet;
	}
}
