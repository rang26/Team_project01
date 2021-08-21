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
	String memid = session.getAttribute("memid").toString();
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");


	String[] all = {pw,name,tel};
	
	MemberDAO dao = new MemberDAO();
	
	int result = dao.update(memid,all);
	if (result == 0) {
	%>
	alert("수정실패")
	window.history.back();
	<%
	} else {
	%>
	alert("수정성공")
	window.location.href="index.jsp"
	<%
	}
	%>
</script>
</body>
</html>