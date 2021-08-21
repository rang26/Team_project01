<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="pay.PayDTO"%>
<%@page import="pay.PayDAO"%>
<%@page import="product.ProDTO"%>
<%@page import="product.ProDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("memid");

PayDAO dao = new PayDAO();
ArrayList<PayDTO> payList = dao.payRead(memid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베어비앤비: 구매내역</title>
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
<script type="text/javascript">
	
	function deleteCheck() {
		var checked = document.getElementsByName('payid');
		var check = false;
		for (var i = 0; i<checked.length; i++){
			if(checked[i].checked){
				check = true;
				break;
			}
		}
		if(check){
			result = confirm("선택한 숙소를 취소하시겠습니까?");
			if(result){
				return true;
			}else{
				return false;
			}
		} else {
			alert("구매를 취소할 내역을 선택해주세요");
			return false;
		}
	}
	
</script>
		
</head>
<body>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
		<div class="title">
			<h2>구매내역 확인</h2>
		</div>
		<form action='payDelete.jsp' >
			<table>
				<tr class="header_tr">
					<td class="header">주문번호</td>
					<td class="header">결제일</td>
					<td class="header" width="50%">숙소명</td>
					<td class="header">체크인</td>
					<td class="header">체크아웃</td>
					<td class="header">가격</td>
					<td class="header">주문취소</td>
				</tr>
				
				<%if (payList.size() > 0) {
	
					for (int i = 0; i < payList.size(); i++) {	%>
				<tr>
					<td class="info"><%=payList.get(i).getPayid()%></td>
					<td class="info"><%=payList.get(i).getPaydate()%></td>
					<%
	  				ProDAO pro = new ProDAO(); 
	  				ProDTO proBag = pro.read(payList.get(i).getProid()); 
	  				String pronam = proBag.getPronam();
					%> 
					<td class="info"><%=pronam%></td>
					<td class="info"><%=payList.get(i).getCheckin()%></td>
					<td class="info"><%=payList.get(i).getCheckout()%></td>
					<td class="info"><%=payList.get(i).getPayprice()%></td>
					<td class="info"><input type="checkbox"
						name="payid" value=<%=payList.get(i).getPayid()%> ></td>
				</tr>
				<% }
					
				} else { %>
				<tr>
					<td colspan=7 class="empty">여행을 떠날 숙소가 없어요! 여행을 계획해 볼까요? </td>
				</tr>
				<%} %>
				
			</table>
			<div class="buttons">
				<button type = 'submit' onclick = "return deleteCheck();" class="b2">주문 취소</button>
			</div>
		</form>
		</div>
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
