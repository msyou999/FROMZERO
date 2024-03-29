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
<meta charset="UTF-8">
<title>From zero</title>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slider-wrap {
	width: 400px;
	height: 400px; 
	position: relative;
	width: 100%;
	height: 100%;
	margin-top: -330px;
}

#slider-wrap ul#slider {
	height: 100%;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
	height: 400px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
}
.slider-btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: 300px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.slider-btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: 410px;
	border-radius: 7px 7px 7px 7px;
	color: #eee;
}

#previous {
	left: 410px;
	border-radius: 7px 7px 7px 7px;
	color: #eee;
}
#slider-pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#slider-pagination-wrap ul {
	width: 100%;
	height: 100%;
}

#slider-pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#slider-pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

#slider-wrap img {
	display: block;
	margin: 0px auto;
	z-index: 2;
}
/*ANIMATION*/
#slider-wrap ul, #slider-pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}
</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<%
	String name = (String) request.getAttribute("name");
	int count = (int) request.getAttribute("count");
	String title = (String) request.getAttribute("title");
	String img_path = "card_news/" + name;
	int i = 1;
	%>

	<div class="title">
			<h2 style="text-align: center">에코 뉴스</h2>
	</div>
	<h3 style="text-align: center">"<%=title %>"</h3>
	

	<div id="slider-wrap">
		<ul id="slider">
			<%
				while (i <= count) {
				img_path = "card_news/" + name + " (" + i + ").jpg";
			%>
			<li>
				<div></div> <img src="<%=img_path%>" style="width:600px; height:600px">
			</li>
			<%
				i++;
			}
			%>

		</ul>

		<div class="slider-btns" id="next">
			<span>▶</span>
		</div>
		<div class="slider-btns" id="previous">
			<span>◀</span>
		</div>

		<div id="slider-pagination-wrap">
			<ul>
			</ul>
		</div>


	</div>
	<script>

		var slideWrapper = document.getElementById('slider-wrap');

		var slideIndex = 0;

		var slides = document.querySelectorAll('#slider-wrap ul li');

		var totalSlides = slides.length;

		var sliderWidth = slideWrapper.clientWidth;

		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})

		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';


		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});


		slideWrapper.addEventListener('mouseover', function() {
			this.classList.add('active');
			clearInterval(autoSlider);
		});
		slideWrapper.addEventListener('mouseleave', function() {
			this.classList.remove('active');
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}


		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#slider-pagination-wrap ul')
					.appendChild(li);
		})

		function pagination() {
			var dots = document
					.querySelectorAll('#slider-pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();

	</script>


</body>
</html>
