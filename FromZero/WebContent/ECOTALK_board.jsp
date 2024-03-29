<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html>
<head>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>

<style>
table {
	width: 1500px;
	table-layout: fixed;
	font-size: 14px;
	color: #666;
	border: 0;
	background-color: white;
	margin: 0;
	padding: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	background-color: white;
	border-bottom: 1px solid #444444;
	padding: 10px;
}

#menu, #content {
	margin: 50px;
}

.leftMenu {
	margin-top: 50px;
	margin-left: 50px;
	float: left;
	display: block;
}

.leftMenu li a {
	padding: 10px;
	text-align: center;
}

</style>
</head>

<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>
   	<%
   	String board_id = (String)request.getAttribute("board_id");
   	user_name = (String) session.getAttribute("user_name");
   	String cust_id=(String)session.getAttribute("cust_id");
   	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	Connection conn = null;
	Properties connectionProps = new Properties();

	String DBUrl = "jdbc:mysql://localhost:3306/fz_webapp";
	String DBuser = "fz_webapp";
	String DBpasswd = "fz_webapp";
	String DBTimeZone = "UTC";

	connectionProps.put("user", DBuser);
	connectionProps.put("password", DBpasswd);
	connectionProps.put("serverTimezone", DBTimeZone);
	String name = null;
	
	%>
	
   <div>
		<h1 id="bigCategory"
			style="text-align: center; margin-top: 20px; text-transform: uppercase;">ECO TALK</h1>
	</div>
	
	<div class="deleteBoard" align="right">
	<form method="post" action="doDeleteWriting">
	</form>
	</div>
	
	
   <div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
			<li><a href="ECOTALK.jsp" class="submenuLink">ECO TALK</a></li>
			<li><a href="QnA.jsp" class="submenuLink">QnA</a></li>
		</ul>
	</div>

	<div id="content" style="float: left; width:1000px">
	<form method="post" action="doDeleteWriting">
		<table class="board"
				style="text-align: left; background-color: white">
		<%
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from ecotalk where board_id='" + board_id 
						+ "' order by custid, board_title, board_content, board_date";
				pstmt = conn.prepareStatement(sqlSt);				
				rset = pstmt.executeQuery();
				} 
			catch (SQLException e) {				
				e.printStackTrace();
				}
			
			String custid = null;
			String board_title = null;
			String board_content = null;
			String board_date = null;

			while (rset.next()) {
				custid = rset.getString("custid");
				board_title = rset.getString("board_title");
				board_content = rset.getString("board_content");
				board_date = rset.getString("board_date");
			}
			String b="display:none";
			String access_user="";
			if(user_name!=null){
				access_user=user_name;
				if(access_user.equals("관리자") || cust_id.equals(custid)){
					b="";
				}
			}
			%>
			<div style="text-align: right; margin-right: 100px">
				<button class="test-result-button" style="width:10%; color: red; <%=b%>"
					type="submit">삭제하기</button>
			</div>
        <tr>
				<tr>
					<th>작성자</th>
					<td><%=custid%></td>
					<td></td>
					<td></td>
					<td><%=board_date%></td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="4"><%=board_title%></td>
				</tr>

				<tr style="height:100px">
					<td colspan="5" style="width: 100%; padding:10px;"><%=board_content%></td>
				</tr>
			</table>
			<br />

			
		</form>
		<br/>
		<br/>
		<h3>댓글</h3>
		<%
			try {

			String sqlSt = "select * from ecotalk_comment where board_id='" + board_id + "' order by comment_id, custid, comment";
			pstmt = conn.prepareStatement(sqlSt);
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String comment_id = null;
		String comment_custid = null;
		String comment = null;
		Date _date=null;
		DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");

		while (rset.next()) {
			comment_id = rset.getString("comment_id");
			comment_custid = rset.getString("custid");
			comment = rset.getString("comment");
			_date=rset.getDate("comment_date");
			String comment_date=dateFormat.format(_date);
		%>
		<div>
			<table class="board" style="border:0px; margin:0px; padding:0px">
				<tr style="border:0px;">
					<th style="text-align:left; border:0px; margin-bottom:0px; padding-bottom:0px"><%=comment_custid%></th>
				</tr>
				<tr style="border:0px; margin:0px">
					<td colspan="3" style="text-align:left;margin-top:0px; padding-top:0px"><%=comment%></td>
					<td style="margin-top:0px; padding-top:0px"><%=comment_date%></td>
				</tr>
			</table>
		</div>
		<%
			}
		int comment_id_2 = 1;
		if (comment_id == null)
		comment_id_2 = 1;
		else if (Integer.parseInt(comment_id) > 0)
		comment_id_2 = Integer.parseInt(comment_id) + 1;
		%>
		<br /> <br /> <br />
		<form method="post" action="doEcoTalkComment">
			<div>
				<table class="board" style="text-align: left">
					<tr>
						<th>댓글번호</th>
						<td colspan="3"><%=comment_id_2%></td>
					</tr>
					<tr>
						<th style="height: 100px">댓글 작성</th>
						<td colspan="2"><textarea name="comment"
								style="width: 100%; height: 100px"></textarea></td>
						<td><button class="test-result-button" type="submit">댓글
								작성</button></td>
					</tr>
				</table>
			</div>
			<br />

			<div class="save" align="right"></div>
		</form>
		<%
		session.setAttribute("comment_id", comment_id_2);
		session.setAttribute("board_id", board_id);
		session.setAttribute("cust_id", custid);
		session.setAttribute("page","faq");
		%>
		</div>

</body>
</html>