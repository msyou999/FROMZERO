package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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


@WebServlet("/doBuying")
public class DoBuying extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoBuying() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int count = Integer.parseInt(request.getParameter("product_count"));
		int all_price = Integer.parseInt(request.getParameter("product_price"));

		int order_id = 0;

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pout = response.getWriter();
			pout.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
			pout.flush();
	}
	else {
		int product_id = Integer.parseInt((String) session.getAttribute("product_id"));

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		ResultSet rs = DBUtil.getOnlineOrder(conn);
		
		if (rs != null) {
			try {
				while (rs.next()) {
					order_id = rs.getInt("orderid");
				}
				order_id++;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			order_id = 1;
		}
		try {
			DBUtil.insertItems(conn, order_id, product_id, user_id, count);
			DBUtil.insertBuying(conn, order_id, user_id, all_price);
			request.setAttribute("all_price", all_price);
			request.setAttribute("count", count);
			RequestDispatcher view = request.getRequestDispatcher("payment.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
