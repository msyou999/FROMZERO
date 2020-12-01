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
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<title>From zero</title>
<style>
.map_image, .map_info {
	float: left;
}
</style>
</head>
<body style="overflow-x: hidden">

	<header>
		<h1>
			<a href='main.html'>From zero</a>
		</h1>
	</header>
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="ourStory.html">OUR
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
			<li class="topMenuLi"><a class="menuLink" href="offline.html">OFFLINE</a>
			</li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="ecoDiary.html">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="aboutZW.html" class="submenuLink">ABOUT ZW</a></li>
					<li><a href="ecoTip.html" class="submenuLink">ECO TIP</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="greenBoard.html">GREEN
					BOARD</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="notice.html" class="submenuLink">NOTICE</a></li>
					<li><a href="faq.html" class="submenuLink">FAQ</a></li>
					<li><a href="qna.html" class="submenuLink">QNA</a></li>
				</ul></li>
		</ul>
	</nav>


	<form method="post" action="doSearch">
		<ul class="loginarea">
			<li><a href="login.html"> <img src="images/mypage.png"
					width=25 height=20>
			</a></li>
			<li><a href="login.html">cart</a></li>
			<li><a href="login.html">login</a></li>
			<li><a href="join.html">join</a></li>
			<li><input type="text" name="search_text"></li>
			<li style='top: 100px; padding: 0 0px;'>
				<button type="submit">
					<img src="images/magnifying-glass.png" width=20 height=20>
				</button>
			</li>
		</ul>
	</form>

	<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				width=40 height=50></a></li>
		<li><a href="test.jsp"><img src="images/test.png" width=40
				height=50></a></li>
	</ul>



	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<div class="map_image" style="position: absoulte;">
				<div style="position: relative; top: 120px, left:76px">
					<img src="images/seoul_map_store.jpg" width="400">
				</div>
			</div>
			<div style="positoin: absoulte;">
				<div style="position: relative; top:120px; z-index:2; left:-300px">
					<img src="images/offline_store-1.jpg" width="20">
				</div>
				<div class="map_info">
					<table class="table_div">
						<tr>
							<td rowspan="4"><img src="images/offline_store-1.jpg"
								width="150"></td>
							<td>~~~~가게이름~~~~~</td>
						</tr>
						<tr>
							<td>02-000-0000</td>
						</tr>
						<tr>
							<td>서울 마포구 합정동 월드컵로 49 한우마을 2층</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
</body>
</html>