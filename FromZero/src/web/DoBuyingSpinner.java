package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class DoBuyingSpinner
 */
@WebServlet("/doBuyingSpinner")
public class DoBuyingSpinner extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoBuyingSpinner() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		String product_count = request.getParameter("product_count");
		String btn = request.getParameter("action");
		// System.out.println(btn);
		request.setAttribute("product_count", product_count);

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		HttpSession session = request.getSession();
		String cust_id = (String) session.getAttribute("user_id");
		String product_id = (String) session.getAttribute("productid");
		int productid = Integer.parseInt(product_id);
		int count = Integer.parseInt(product_count);

		String fname = null;
		if (btn.equals("BUY")) {
			fname = "buying.jsp";
		} else if (btn.equals("CART")) {
			try {
				DBUtil.insertCartItems(conn, cust_id, productid, count);
				fname = "after_cart.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher view = request.getRequestDispatcher(fname);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
