

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Foods;
import db.TodaysOrders;

@WebServlet("/BookTable")
public class BookTable extends HttpServlet {
	public int TableNo;
	public String Name;
	//itemDetails[0] = itemCode ; itemDetails[1] = Number of orders;
	public int[][] itemDetails;
	private static final long serialVersionUID = 1L;
       
    public BookTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableNo = Integer.parseInt(request.getParameter("table_no"));
		Name = request.getParameter("form_name");
		try {
			Foods food = new Foods();
			int FoodsArray[] = food.AvailableToday();
			itemDetails = new int[FoodsArray.length][2];
			for (int i =0 ; i<FoodsArray.length; i++) {
				itemDetails[i][0] = FoodsArray[i];
				itemDetails[i][1] = Integer.parseInt(request.getParameter(String.valueOf(FoodsArray[i])));
			}
			TodaysOrders TodaysFood = new TodaysOrders();
			TodaysFood.Insert(TableNo, Name, itemDetails);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(TableNo+Name);
		doGet(request, response);
	}

}
