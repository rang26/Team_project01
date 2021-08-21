<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="rec.RecDAO"%>
<%@page import="rec.RecDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// RecDAO 객체
RecDAO db = new RecDAO();

// 추천 숙소 5개가 담긴 list 객체 생성
ArrayList<RecDTO> list = db.readRec();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베어비앤비: 추천 컬렉션</title>
<style type="text/css">
	td a{
		display: block;
		text-decoration: none;
		color: black;
	}
	
	.rec_title {
		line-height: 120%;
		text-align: center;
		padding-top: 120px;
		font-weight: 300;
	}
	
	.rec {
		width: 100%;
		padding-top: 60px;
		padding-bottom: 60px;
	}
	
	.topFive {
		border: none;
	}
	
	.topFive td {
		border-right: 10px solid transparent;
		background-clip: padding-box;
		width: 20%;
	}
	
	.recImg {
		width: 100%;
		max-height: 190px;
		object-fit: cover;
		border-radius: 15px;
	}
	
	.recNam {
		font-size: 15pt;
		font-weight: 500;
		max-width: 290px;
		white-space: nowrap;
		word-wrap: break-all;
		text-overflow: ellipsis;
		overflow: hidden;
		text-align: left;
	}
	
	.recAdd {
		font-size: 10pt;
		color: grey;
		max-width: 290px;
		white-space: nowrap;
		word-wrap: break-all;
		text-overflow: ellipsis;
		overflow: hidden;
		text-align: left;
	}
</style>
<link rel="stylesheet" href="css/board.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
</head>
<body>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div class="rec_title">
				<h2>베어비앤비 추천 컬렉션</h2>
				게스트들의 선택을 가장 많이 받은 숙소 다섯 군데를 베어비앤비가 자신 있게 추천해드립니다.<br>
				숙소를 클릭하시면 상세 정보를 확인할 수 있습니다.
			</div>
			<div class="rec">
				<table class="topFive">
				<%if (list.size() > 0) {%>
					<tr>
						<%for (int i = 0; i < list.size(); i++) {
							RecDTO bag = list.get(i);
							String proid = bag.getProid();
							RecDTO bag2 = db.readPro(proid);
						%>
							<td>
								<a href="Proread.jsp?proid=<%=bag2.getProid()%>">
									<img src="<%=bag2.getProimg() %>" class="recImg">
								</a>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for (int i = 0; i < list.size(); i++) {
							RecDTO bag = list.get(i);
							String proid = bag.getProid();
							RecDTO bag2 = db.readPro(proid);
						%>
							<td class="recNam">
								<a href="Proread.jsp?proid=<%=bag2.getProid()%>">
									<%=bag2.getPronam() %>
								</a>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for (int i = 0; i < list.size(); i++) {
							RecDTO bag = list.get(i);
							String proid = bag.getProid();
							RecDTO bag2 = db.readPro(proid);
						%>
							<td>
								<a href="Proread.jsp?proid=<%=bag2.getProid()%>">
									<%=bag2.getProprice() %>&nbsp;원/박
								</a>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for (int i = 0; i < list.size(); i++) {
							RecDTO bag = list.get(i);
							String proid = bag.getProid();
							RecDTO bag2 = db.readPro(proid);
						%>
							<td class="recAdd">
								<a href="Proread.jsp?proid=<%=bag2.getProid()%>">
									<%=bag2.getProadd()%>
								</a>	
							</td>
						<%} %>
					</tr>
				<%} else { %>
					<tr>
						<td>추천 숙소가 없습니다.</td>
					</tr>
				<%} %>
				</table>
			</div>
		</div>
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>