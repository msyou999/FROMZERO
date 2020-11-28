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
<title>From zero</title>
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
	<header>
		<h1>
			<a href='main.html'>From zero</a>
		</h1>
	</header>
	<nav id="topMenu">
		<ul>
			<li id="topMenuLi"><a class="menuLink" href="ourStory.html">OUR
					STORY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="introduce.html" class="submenuLink">사이트 소개</a></li>
					<li><a href="guide.html" class="submenuLink">이용 안내</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="shop.jsp">SHOP</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="living.jsp" class="submenuLink">LIVING</a></li>
					<li><a href="bathroom.jsp" class="submenuLink">BATHROOM</a></li>
					<li><a href="kitchen.jsp" class="submenuLink">KITCHEN</a></li>
					<li><a href="kit.jsp" class="submenuLink">KIT</a></li>
					<li><a href="etc.jsp" class="submenuLink">ETC</a></li>
				</ul></li>
			<li>|</li>
			<li id="topMenuLi"><a class="menuLink" href="offline.html">OFFLINE</a>
			</li>
			<li>|</li>
			<li id="topMenuLi"><a class="menuLink" href="ecoDiary.html">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="aboutZW.html" class="submenuLink">ABOUT ZW</a></li>
					<li><a href="ecoTip.html" class="submenuLink">ECO TIP</a></li>
				</ul></li>
			<li>|</li>
			<li id="topMenuLi"><a class="menuLink" href="greenBoard.html">GREEN
					BOARD</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="notice.html" class="submenuLink">NOTICE</a></li>
					<li><a href="faq.html" class="submenuLink">FAQ</a></li>
					<li><a href="qna.html" class="submenuLink">QNA</a></li>
				</ul></li>
		</ul>
	</nav>


		<ul class="loginarea">
		<li><a href="login.html"> <img src="images/mypage.png"
				width=25 height=20>
		</a></li>
		<li><a href="login.html">cart</a></li>
		<li><a href="login.html">login</a></li>
		<li><a href="join.html">join</a></li>
		<li><input type="text"></li>
		<li style='top:100px; padding:0 0px;'>
		<img src="images/magnifying-glass.png" width=20 height=20></li>
	</ul>
	
	<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				style="width:50px; height:50px;"></a></li>
		<li><a href="test.jsp"><img src="images/test.png" style="width:50px;
				height:50px;"></a></li>
	</ul>
	
	</div>
	<div class="all-shop-grid">
		<div class="div-shop-grid">
			<a href="living.jsp"><h2 class="big-category-text">LIVING ></h2></a>
			<ul class="ul-shop-grid">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='living' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String productname = null;
				String price = null;
				int img_count = 0;
				String img_li = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "living/" + img_count + ".jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
			<a href="bathroom.jsp"><h2 class="big-category-text">BATHROOM
					></h2></a>
			<ul class="ul-shop-grid">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='bathroom' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "bathroom/" + img_count + ".jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
			<a href="kitchen.jsp"><h2 class="big-category-text">KITCHEN
					></h2></a>
			<ul class="ul-shop-grid">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='kitchen' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "kitchen/" + img_count + ".jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
			<a href="kit.jsp"><h2 class="big-category-text">KIT ></h2></a>
			<ul class="ul-shop-grid">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='kit' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "kit/" + img_count + ".jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
			<a href="etc.jsp"><h2 class="big-category-text">ETC ></h2></a>
			<ul class="ul-shop-grid">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='etc' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					img_li = "etc/" + img_count + ".jpg";
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>

</body>
</html>