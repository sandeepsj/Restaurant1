

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.TodaysMenu;

@WebServlet("/UpdateTodaysFoods")
public class UpdateTodaysFoods extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTodaysFoods() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.sendRedirect("todaysMenuEditor.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Hashtable<Integer,Integer> UpdatedTable = new Hashtable<Integer,Integer>();
		// TODO Auto-generated method stub
		try {
			TodaysMenu todaysMenu = new TodaysMenu();
			Integer curKey;
			String[] CheckValue = request.getParameterValues("menu");
			if(CheckValue != null) {
				for(String itemCode : CheckValue) {
					UpdatedTable.put(Integer.parseInt(itemCode), 1);
				}
			}
			Hashtable<Integer, Integer> tdh = todaysMenu.getTodaysMenu();
			Enumeration<Integer> tdk = tdh.keys();
			for(int i = 0 ; i< tdh.size(); i++) {
				curKey = tdk.nextElement();
				if(!UpdatedTable.containsKey(curKey)) {
					UpdatedTable.put(curKey, 0);
				}
			}
			/*while(todaysMenu.Todays_Menu.next()) {
				CheckBoxId = todaysMenu.Todays_Menu.getInt("itemCode");
				CheckValue = Integer.parseInt(request.getParameter(String.valueOf(todaysMenu.Todays_Menu.getInt("itemCode"))));
				UpdatedTable.put(CheckBoxId, CheckValue);
			}*/
			todaysMenu.updateTodaysMenu(UpdatedTable);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
