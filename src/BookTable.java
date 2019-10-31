

import java.io.IOException;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Foods;
import db.OrderHistory;

@WebServlet("/BookTable")
public class BookTable extends HttpServlet{
	public int TableNo, orderid;
	public String Name,Orders;
	public float TotalAmount;
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
		String url = "orderSummery.jsp?Orders=" + Orders + "&TotalAmount=" + TotalAmount + "&OrderId=" + orderid;
		response.sendRedirect(url);
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
			OrderHistory TodaysFood = new OrderHistory();
			String orders = TodaysFood.Insert(TableNo, Name, itemDetails);
			StringTokenizer st = new StringTokenizer(orders,"$");
			orderid = Integer.parseInt(st.nextToken());
			Orders = st.nextToken();
			TotalAmount = TodaysFood.TotalAmount(Orders);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}
}
