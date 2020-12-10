<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>장바구니</title>

<style>
.product-detail {
	padding: 3%;
}

.img-display-box {
	padding: 7%;
}

.buy-button {
	padding: 7%;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%
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
	<%@ include file="./fz_header.jsp"%>

	<div>
		<h2 id="bigCategory" style="text-align: center; margin-top: 20px;">장바구니</h2>
	</div>

	<div>
		<%
			try {
			conn = DriverManager.getConnection(DBUrl, connectionProps);

			String sqlSt = "select * from cart_items";
			pstmt = conn.prepareStatement(sqlSt);
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		int productid = 0;
		int count = 0;

		String productname = null;
		String price = null;
		String big_category = null;
		String img = null;

		String img_li = null;

		PreparedStatement pPstmt = null;
		ResultSet pRset = null;

		if (rset != null) {
			while (rset.next()) {
				productid = rset.getInt("productid");
				count = rset.getInt("count");

				String sql = "select * from online_product where productid = '" + productid + "'";
				pPstmt = conn.prepareStatement(sql);
				pRset = pPstmt.executeQuery();
				if (pRset.next()) {
			productname = pRset.getString("productname");
			price = pRset.getString("price");
			big_category = pRset.getString("big_category");
			img = pRset.getString("img");
			img_li = big_category + "/" + img + ".jpg";
				}
		%>
		<form method="post" action="doCartBuying">
			<div class="product-detail">
				<div style="margin-left: 50px;">
					<input type="checkbox" onClick="" name="cart" value="<%=productid %>"
						id="cart">
				</div>
				<input type="hidden" name="productID" value="<%= productid%>" />
				<img src="<%=img_li%>" width=200 height=200 alt="" align="left"
					style="margin-left: 50px; padding: 0px 30px 0px 30px;" /> <br>
				<br>
				<div id="display-text">
					<strong><%=productname%></strong>
					<p><%=price%>원
					</p>
				</div>
				<br>
				<p>
					수량 <input id="product-count" type="number" name="product-count"
						min="0" step="1" value="<%=count%>" />
				</p>
				<br> <br> <br>
			</div>
			<%
				}
			} else {
			%>
			<h5>장바구니에 상품이 없습니다.</h5>
			<%
				}
			%>


			<div class="buy-button" align="right">
				<input id="buy" type="submit" name = "action" value="BUY" /> 
				<input id="delete" type="submit" name = "action" value="DELETE" />
			</div>
		</form>
</body>
</html>