<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<% String user_id=(String)session.getAttribute("user_id"); //세션 값 불러오기%> 
<meta charset="UTF-8">
<title>From zero</title>
<script src="point-calculate.js"></script>
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


	<ul class="loginarea">
		<li><a href="myPage.html"> <img src="images/mypage.png"
				width=25 height=20>
		</a></li>
		<li><a href="cart.html">cart</a></li>
		<li><a href="login.html">login</a></li>
		<li><a href="join.html">join</a></li>
	</ul>

	<ul class="service">
		<li><a href="exchange.jsp"> <img src="images/exchange.png"
				style="width:50px; height:50px;"></a></li>
		<li><a href="test.jsp"><img src="images/test.png" style="width:50px;
				height:50px;"></a></li>
	</ul>

	<div class="big-grid">
		<br /> <br /> <br />
		<%= user_id %>
		<h2>pick up 에코마일리지</h2>
		<p>
			집에 있는 공병, 폐지, 등 재활용품을 모아 보내면 사이트의 포인트로 교환해드립니다!<br /> <br />
		<div class=div-grid>
			<form method="post" action="doPoint">
				<ul class="row_ul">
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/소주병.jpg"> <br />
							<p>소주병 (1개/100원)</p>
							<input id="soju" type="number" name="soju" min="0"
								, max="10" step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/맥주병.jpg"> <br />
							<p>맥주병 (1개/140원)</p>
							<input id="macju" type="number" name="beer" min="0"
								, max="10" step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/우유팩.jpg"> <br />
							<p>우유팩(1L/400원)</p>
							<input id="milk" type="number" name="milk" min="0"
								, max="10" step="1" value="0" />
						</div>
					</li>
					<li class="row_li">
						<div>
							<img class="img_exchange" src="exchange/생수병.jpg"> <br />
							<p>생수통 (1L/50원)</p>
							<input id="water" type="number" name="water" min="0"
								, max="10" step="1" value="0" />
						</div>
					</li>
				</ul>
				<br />
				<div>
					<button class="point-reset" type="button" onclick="call()">포인트
						미리보기</button>
					<input id="display" type="text" /> 
					<input id="calculate-result" name="point" type="text" />
					<button class="point-reset" type="reset">초기화</button>
					<br/>
					<button class="point-reset" type="submit" onclick="call()">포인트
					 전환하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>