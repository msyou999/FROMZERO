<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
<meta charset="UTF-8">
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	String storename = (String) request.getAttribute("storename");
	int offline_storeid = (int) request.getAttribute("offline_storeid");
String store_img = null;
	store_img = "images/offline_store-" + offline_storeid + ".jpg";
%>
<title>From zero</title>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp"%>
	<div class="big-shop-grid">
		<h2 class="big-category-text"></h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
			<img style="padding-top:0px" id="img_td" src=<%=store_img%> height="185px" />
				<form style="margin-left: 150px; width: 90%" method="post"
					action="reserve_Offline">
					<button style="float:right; margin-right:100px" type="submit">예약하기</button>
					<br/>
					<br/>
					<%
					String img;
					String img_li = null;
					while (rs.next()) {
					int productid = 0;
					String productname = null;
					String price = null;
					productid = rs.getInt(1);
					productname = rs.getString("offlineproduct_name");
					price = rs.getString("offlineproduct_price");
					img = rs.getString("offlineproduct_id");
					img_li = "offline_store_img/Store" + offline_storeid + "/" + img + ".jpg";
					System.out.println(img_li);
					System.out.println(productname);
					%>
					<li id="li-living-item-box">
						<div class="div-display-living-box">
							<img class="img-display-box" src="
								<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
								<p>
									<input id="productNum" type="number" name="<%=productid%>"
										min="0" step="1" value="0" />
								</p>
							</div>
						</div>
					</li>
					<%
						}
					%><p>
						
					</p>
					<input type="hidden", name="offline_storeid" value=<%=offline_storeid%>>
				</form>
			</ul>
		</div>
	</div>
</body>
</html>