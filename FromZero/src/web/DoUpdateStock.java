package web;

import java.io.IOException;
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

@WebServlet("/doUpdateStock")
public class DoUpdateStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoUpdateStock() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		
		ServletContext sc = getServletContext();
		Connection conn= (Connection) sc.getAttribute("DBconnection");
		
		String offlineproduct_num = request.getParameter("offlineproduct_num");
		String offlineproduct_id = request.getParameter("offlineproduct_id");

		try {
				DBUtil.updateStock(conn, offlineproduct_id, offlineproduct_num);
				RequestDispatcher view = request.getRequestDispatcher("update_stock.jsp");
			    view.forward(request, response);
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
