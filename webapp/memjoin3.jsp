<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memid = request.getParameter("memid"); 
	MemberDAO dao = new MemberDAO();
	int result = dao.read3(memid);
	
	
	//response.sendRedirect("javascript:history.back()");
	
%>
<!DOCTYPE html>
<html>
<head>
<script>
function idCheck(){
	<%
	if(result == 1){
	%>	
		alert("중복된 아이디 사용이 불가능 합니다")
	<%	
	}else{
	%>	
		alert("아이디 사용이 가능 합니다.")
	<%	
	}
	%>
window.history.back();
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="idCheck()">

</body>
</html>