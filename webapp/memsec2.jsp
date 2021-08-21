<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		
<%
	String memid = session.getAttribute("memid").toString();
	String pw = request.getParameter("pw");

	MemberDAO dao = new MemberDAO();
	boolean result = dao.delete(memid, pw);

	if (result) {
		session.invalidate(); 
%>
		alert("탈퇴 성공")
		window.location.href = "index.jsp" // 삭제시 메인으로 이동.
<%// 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
		} else {
%>
		alert("비밀번호가 맞지 않습니다.");
		window.history.back(); // 이전 페이지로 이동
	<%}%>
		
	</script>
</body>
</html>