<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//javascript 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

//memid 세션에서 가져오기
String memid = (String)session.getAttribute("memid");
//memid = "root";
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	td {
		vertical-align: top;
	}
</style>
<script src="js/member.js"></script>
<script type="text/javascript">
function popupinfo() {
	var width = $('#meminfo').width();
	$('#meminfo').css({
		'left' : ($(window).width() - width) / 2
	});	
	document.getElementById('dimmed').style.display = "block";
	document.getElementById('meminfo').style.display = "block";
}

function closeinfo() {
	document.getElementById('dimmed').style.display = "none";
	document.getElementById('meminfo').style.display = "none";
}
</script>
<script type="text/javascript" charset="UTF-8">
	function mem_check() {
		alert('로그인 후 이용 가능합니다.');
		return;
	}
</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>베어비앤비</td>
				<td>호스팅</td>
				<td>예약</td>
				<td>계정</td>
			</tr>
			<tr>
				<td><a href="index.jsp">메인</a></td>
				<%if (memid == null) { %>
					<td><a href="javascript:mem_check();">호스팅하기</a></td>
				<%} else { %>
					<td><a href="javascript: popuppro()">호스팅하기</a></td>
				<%} %>
				<%if (memid == null) { %>
					<td><a href="javascript:mem_check();">위시리스트</a></td>
				<%} else { %>
					<td><a href="cartMain.jsp">위시리스트</a></td>
				<%} %>
				<%if (memid == null) { %>
					<td><a href="javascript: popupjoin()">회원가입</a></td>
				<%} else { %>
					<td><a href="javascript: popupinfo()">계정 정보</a></td>
				<%} %>
			</tr>
			<tr>
				<td rowspan=3><a href="board.jsp">커뮤니티 센터</a></td>
				<td><a href="ProListStart.jsp">숙소 둘러보기</a></td>
				<%if (memid == null) { %>
					<td><a href="javascript:mem_check();">스케줄러</a></td>
				<%} else { %>
					<td><a href="payMain.jsp">스케줄러</a></td>
				<%} %>
				<%if (memid == null) { %>
					<td><a href="javascript: popuplogin()">로그인</a></td>
				<%} else { %>
					<td><a href="memout.jsp">로그아웃</a></td>
				<%} %>
			</tr>
			<tr>
				<td><a href="searchRead.jsp?word=">검색하기</a></td>
			</tr>
			<tr>
				<td><a href="rec.jsp">추천 컬렉션</a></td>
			</tr>
		</table>
	</div>
</body>
</html>