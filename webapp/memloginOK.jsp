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
<script type="text/javascript">
	<%
	String memid = request.getParameter("memid");
	String pw = request.getParameter("pw");
	session.setAttribute("memid", memid);

	MemberDTO dto = new MemberDTO();
	dto.setMemid(memid);
	dto.setPw(pw);

	MemberDAO dao = new MemberDAO();
	int result = dao.read2(dto);

	if (result == 1) { // 로그인 성공
		// 세션에 현재 아이디 세팅
		session.setAttribute("sessionID", memid);
	%>
	alert("로그인 성공.");
	window.location.href="index.jsp"
	<%
	} else if (result == 0) { // 비밀번호가 틀릴경우
	%>
	alert("비밀번호가 틀렸습니다.");
	window.history.back();
	<%
	} else { // 아이디가 틀릴경우
	%>
	alert("아이디가 틀렸습니다.");
	window.history.back();
	<%
	}
	%>
</script>
</body>
</html>