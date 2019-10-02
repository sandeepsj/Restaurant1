package tools;

import java.util.Hashtable;
import java.util.StringTokenizer;

public class JSON {
	String JSONstr;
	Hashtable<Integer, Hashtable<String, String>> JSONHash;
	public JSON (String jsonStr) {
		JSONstr = jsonStr;
	}
	public Hashtable<Integer, Hashtable<String, String>> StrToHashTable(){
		String jsonTemp = JSONstr.substring(1, JSONstr.length());
		StringTokenizer st = new StringTokenizer(jsonTemp,",");
		while(st.hasMoreTokens()) {
			StringTokenizer st1 = new StringTokenizer(st.nextToken(),":");
			int itemCode = Integer.parseInt(st1.nextToken());
			StringTokenizer st2 = new StringTokenizer(st1.nextToken());
		}
		return JSONHash;
	}
}
