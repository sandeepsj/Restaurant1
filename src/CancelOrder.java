

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.OrderHistory;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String Action = request.getParameter("Action");
			int OrderId = Integer.parseInt(request.getParameter("OrderId"));
			OrderHistory to = new OrderHistory();
			to.changeCurStatus(Action,OrderId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("You Cancelled the order ..you can go back to menu and place order again Thank you");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String Action = request.getParameter("Action");
			int OrderId = Integer.parseInt(request.getParameter("OrderId"));
			OrderHistory to = new OrderHistory();
			to.changeCurStatus(Action,OrderId);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("You Cancelled the order ..you can go back to menu and place order again Thank you");
	}

}
