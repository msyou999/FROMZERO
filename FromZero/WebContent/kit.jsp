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
<style>
table {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}
</style>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script>
function check(){
	statement="";
        var check_count = document.getElementsByName("smallCategory").length;
		var check_count2 = document.getElementsByName("brandName").length; 
        
		for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("smallCategory")[i].checked == true) 
            	statement+=" #"+document.getElementsByName("smallCategory")[i].value+"  ";
           }

		for (var i=0; i<check_count2; i++) {
            if (document.getElementsByName("brandName")[i].checked == true) 
               	statement+=" #"+document.getElementsByName("brandName")[i].value+"  "; 
           }

   		 var price=document.getElementsByName("price").length;
		for(var i=0; i<price; i++){
			if(document.getElementsByName("price")[i].checked)
				statement+=" #"+document.getElementsByName("price")[i].value+"  ";
		}
		
		
		 var sort=document.getElementsByName("sorted").length;
		for(var i=0; i<sort; i++){
			if(document.getElementsByName("sorted")[i].checked==true) 
				statement+=" #"+document.getElementsByName("sorted")[i].value+"  ";
		}

		document.getElementById("search-statement").value=statement;
}
</script>
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>
	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<br />
			
			<div class="big-shop-grid">
				<h2 class="big-category-text">KIT</h2>
				<div class="div-shop-grid">
					<ul class="ul-shop-grid">
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
						try {
							conn = DriverManager.getConnection(DBUrl, connectionProps);

							String sqlSt = "select * from online_product where big_category='kit' order by binary(big_category), binary(brand), price, productid";
							pstmt = conn.prepareStatement(sqlSt);
							rset = pstmt.executeQuery();
						} catch (SQLException e) {
							e.printStackTrace();
						}
						String productname = null;
			            String price = null;
			            int img_count = 0;
			            String img_li = null;
			            String productid = null;
			            String brand = null;

			            while (rset.next()) {
			               productname = rset.getString("productname");
			               price = rset.getString("price");
			               productid = rset.getString("productid");
			               brand = rset.getString("brand");
			               img_count++;
			               img_li = "kit/" + img_count + ".jpg";
			            %>
							<form style="margin-left:100px" method="post" action="doDetailProduct">
			            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
			            <li id="li-living-item-box">
			                  <div class="div-display-living-box">
			                     <img class="img-display-box" src="<%=img_li%>" alt="">
			                     <div class="display-text">
			                        <p>
										<strong><<%=brand%>></strong>
									</p>
									<p>
										<strong><%=productname%></strong>
									</p>
									<p><%=price%>원
									</p>
			                     </div>
			                  </div>
			                  
			            </a></li>
			            
			            <%
			               }
			            %>
			            </button>
			         </ul>
			         </form>
				</div>
			</div>
</body>
</html>