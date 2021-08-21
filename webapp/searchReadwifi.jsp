<%@page import="search.db.searchDAOsundry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="search.dto.searchBag"%>
<%@page import="search.db.searchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <!--  리드 불러오는곳  -->
   <%
   String Wi = request.getParameter("Wi");

   searchDAOsundry dao = new searchDAOsundry();
   ArrayList<searchBag> bag2 = dao.read4(Wi);
	%>
		
   <!--  리드 불러오는곳  -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/search.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<style type="text/css">
	.bar {
		padding-top: 120px;
		text-align: center;
		padding-bottom: 60px;
	}
	
	td a{
		display: block;
		text-decoration: none;
		color: black;
	}
	
	.list {
		padding-left: 5%;
	}
	
	.product {
		display: inline-block;
	}
	
	td {
		vertical-alignment: center;
		max-width: 300px;
		color: black;
		border-right: 10px solid transparent;
		background-clip: padding-box;
	}

	.proimg {
		width: 290px;
		max-height: 190px;
		object-fit: cover;
		border-radius: 15px;
	}
</style>
</head>
<body>
<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
		<!-- 검색하고 결과값  -->
			<div class="bar">
				<jsp:include page="searchMain.jsp"></jsp:include>
	
			</div>
			<div class="list">
				<%
				if (bag2.size() > 0) {
					for (searchBag dto : bag2) {
					%>
						<div class="product">
							<table>
								<tr>
									<td style="font-size: 10pt; color: grey;">
										<a href="Proread.jsp?proid=<%=dto.getProid() %>">숙소 번호: <%=dto.getProid() %></a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="Proread.jsp?proid=<%=dto.getProid() %>"><img src="<%=dto.getProimg() %>" class="proimg"></a>
									</td>
								</tr>
								<tr>
									<td style="font-weight: 500; font-size: 15pt">
										<a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getPronam() %></a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProadd() %></a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProtel() %></a>
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 20px solid transparent; text-align: right;">
										<a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProprice() %>&nbsp;원/박</a>
									</td>
								</tr>
							</table>
						</div>
	
					<%}} else { %>
					<div style="text-align: center">
									검색 결과가 없습니다.
					</div>
				<%}%>
			</div>
         <%-- <div class="list_wrap">
                <%
                for (searchBag dto : bag2) {
                	
          		%>
                <div class="list">
                    <div class="list_img">
                        <img src="<%= dto.getProimg() %> " width="300" height="500"><br> <!-- 이미지 출력 -->
                    </div>
                    <div class="list_text">
                        <span><%= dto.getProid() + " " %></span> <!-- 상품아이디 -->
                        <span><%= dto.getPronam() + " " %></span><br> <!-- 방 이름 -->
                        <span><%= dto.getProadd() + " " %></span><br> <!-- 주소 -->
                        <span><%= dto.getProtel() + " " %></span><br> <!-- 전화번호 -->
                        <span><%= dto.getProprice() %>원</span><br> <!-- 가격 -->
                        <span><%= dto.getPropk() + " " %></span> <!-- 주차여부 -->
                        <span><%= dto.getProwifi() + " " %></span><br> <!-- 와이파이여부 -->
                        <span><%= dto.getPropet() + " " %></span> <!-- 펫여유 -->
                        <span><%= dto.getProbk() + " " %></span> <!-- 조식여부 -->

                    </div>
                </div>
            <%} %>   
         </div> --%>
         </div>
         <div class="botmenu">
				<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
 </div>
        <!-- 검색하고 결과값  -->

</body>
</html>