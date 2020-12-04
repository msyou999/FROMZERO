<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./search-checkbox.js"></script>
<meta charset="UTF-8">
<title>FAQ</title>

<style>

#menu, #content {
	margin: 50px;
}

<!-- 게시판 리스트 -->
ul {
	list-style: none;
}

/*
.sub_news, .sub_news th, .sub_news td {
   border: 0
}
*/

.sub_news a {
   color: #383838;
   text-decoration: none
}

.sub_news {
   width: 100%;
   border-bottom: 1px solid #999;
   color: #666;
   font-size: 12px;
   table-layout: fixed
}

.sub_news caption {
   display: none
}

.sub_news th {
   padding: 5px 0 6px;
   border-top: solid 1px #999;
   border-bottom: solid 1px #b2b2b2;
   background-color: #f1f1f4;
   color: #333;
   font-weight: bold;
   line-height: 20px;
   vertical-align: top
}

.sub_news td {
   padding: 8px 0 9px;
   border-bottom: solid 1px #d2d2d2;
   text-align: center;
   line-height: 18px;
}

.sub_news .date, .sub_news .hit {
   padding: 0;
   font-family: Tahoma;
   font-size: 11px;
   line-height: normal
}

.sub_news .title {
   text-align: left;
   padding-left: 15px;
   font-size: 13px;
}

.sub_news .title .pic, .sub_news .title .new {
   margin: 0 0 2px;
   vertical-align: middle
}

.sub_news .title a.comment {
   padding: 0;
   background: none;
   color: #f00;
   font-size: 12px;
   font-weight: bold
}

.sub_news tr.reply .title a {
   padding-left: 16px;
   background: url(첨부파일/ic_reply.png) 0 1px no-repeat
}

<!-- 왼쪽 네비게이션 -->
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
   
   <div>
		<h1 id="bigCategory"
			style="text-align: center; margin-top: 20px; text-transform: uppercase;">FAQ</h1>
	</div>
	
   <div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
			<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
			<li><a href="QnA.jsp" class="submenuLink">QnA</a></li>
		</ul>
	</div>

	<div id="content" style="float: left; width:1000px">
		<!-- 리스트 게시판 시작-->
		<table class="sub_news" border="1" cellspacing="0"
			summary="게시판의 글제목 리스트">
			<caption>게시판 리스트</caption>
			<colgroup>
				<col width="80">
				<col>
				<col width="110">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">날짜</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="number">1</td>
					<td class="title"><a href="#">게시판 제목이 들어갑니다</a></td>
					<td class="name">글쓴이이름</td>
					<td class="date">2020/12/14</td>
				</tr>

				<tr class="reply">
					<td class="number"> </td>
					<td class="title"><a href="#">ㄴ 답글 제목이 들어갑니다</a></td>
					<td class="name">글쓴이이름</td>
					<td class="date">2020/12/14</td>
				</tr>
				<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li 반복합니다.-->
			</tbody>
		</table>
		<!-- 리스트 게시판 끝-->
	</div>

</body>
</html>