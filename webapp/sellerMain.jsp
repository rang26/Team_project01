<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="pay.PayDTO"%>
<%@page import="pay.PayDAO"%>
<%@page import="product.ProDTO"%>
<%@page import="product.ProDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String memid = (String)session.getAttribute("memid");

ProDAO dao = new ProDAO();
//memid가 판매하는 상품 ProDTO에 담아 배열로 가져오기
ArrayList<ProDTO> proList = dao.read(memid);

ArrayList<Integer> soldList = new ArrayList<Integer>();
%>

<html>
<head>
<meta charset="UTF-8">
<title>베어비앤비: 호스팅 내역</title>
<!-- 아래는 css 링크 -->
<link rel="stylesheet" href="css/cart.css">
<!-- 아래는 폰트 링크 -->
<!-- css에서
	font-family: 'Noto Sans KR', sans-serif;
	font-size : 사이즈pt; (eg. 15pt;)
	font-weight : 300 / 400 / 500 골라서 넣으면 돼요 (500이 가장 굵은 거)
 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<style type="text/css">
	td a {
		color:black;
	}
</style>
</head>
<body>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">

		<div class="title">
			<h2>호스팅 중인 숙소 리스트</h2>
		</div>
			<table>
				<tr class="header_tr">
					<td class="header">#</td>
					<td class="header">숙소ID</td>
					<td class="header" width="50%">숙소명</td>
					<td class="header">가격</td>
				</tr>
				<%if (proList.size() > 0) {
					for (int i = 0; i < proList.size(); i++) {
						soldList.add(proList.get(i).getProid()); %>

				<tr>
					<td class="info"><%=i + 1%></td>
					<td class="info"><%=proList.get(i).getProid()%></td>
					<td class="info"><%=proList.get(i).getPronam()%></td>
					<td class="info"><%=proList.get(i).getProprice()%></td>
				</tr>
				
					<% }
				} else { %>
				<tr>
					<td colspan=4 class="empty">아직 등록한 숙소가 없어요! 숙소를 등록하러 가볼까요?</td>
				</tr>
			<% } %>
			</table>
			
		<div class="title2">
			<h2>숙소 판매 내역</h2>
		</div>
			<table>
				<tr class="header_tr">
					<td class="header">#</td>
					<td class="header">숙소ID</td>
					<td class="header" width="50%">숙소명</td>
					<td class="header">판매일</td>
					<td class="header">구매자ID</td>
					<td class="header">체크인</td>
					<td class="header">체크아웃</td>
					<td class="header">가격</td>
				</tr>
				<% //숙소 판매 내역 검색 
				ArrayList<PayDTO> payBag  = new ArrayList<PayDTO>();
				if (soldList.size() > 0) {
					String proids = "";
					for(int i = 0; i<soldList.size(); i++){
						proids += "proid = " + soldList.get(i).toString();
						if(i == soldList.size()-1){
							break;
						}else{
							proids += " or ";
						}
					}
					
					PayDAO payDAO = new PayDAO();
					payBag = payDAO.sellRead(proids);
				}
				//숙소 판매 내역이 있으면 출력
				if(payBag.size()>0){
					for (int i = 0; i < payBag.size(); i++) {	%>
				<tr>
					<td class="info"><%=i+1%></td>
					<td class="info"><%=payBag.get(i).getProid()%></td>
					<%
					ProDTO proBag = dao.read(payBag.get(i).getProid());
					String pronam = proBag.getPronam(); 
					%>
					<td class="info"><%=pronam%></td>
					<td class="info"><%=payBag.get(i).getPaydate()%></td>
					<td class="info"><%=payBag.get(i).getMemid()%></td>
					<td class="info"><%=payBag.get(i).getCheckin()%></td>
					<td class="info"><%=payBag.get(i).getCheckout()%></td>
					<td class="info"><%=payBag.get(i).getPayprice()%></td>
				</tr>
					<% }
				//숙소를 등록했지만 판매내역은 아직인 경우
				} else if (soldList.size() > 0) { %>
				<tr>
					<td colspan=8 class="empty">멋진 일이 곧 일어날거에요! 함께 기다려볼까요?</td>
				</tr>
				<% } else { %>
				<tr>
					<td colspan=8 class="empty">숙소를 등록하면 여기에 멋진 일이 생길거에요!</td>
				</tr>
				<% } %>
			</table>
		</div>
		
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>