package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

@WebServlet("/doNoticeWrite")
public class DoNoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoNoticeWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	      
		HttpSession session = request.getSession();
		int board_id = (int)session.getAttribute("board_id_2");
		String custid = (String) session.getAttribute("user_id");
		String board_title = request.getParameter("title");
		String board_content = request.getParameter("memo");

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		ResultSet rs = DBUtil.getOnlineOrder(conn);
		
		try {
			DBUtil.insertNotice(conn, board_id, custid, board_title, board_content);
			RequestDispatcher view = request.getRequestDispatcher("notice.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
