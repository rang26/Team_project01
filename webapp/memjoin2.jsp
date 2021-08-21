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
<script type="text/javascript">
	<%
		String memid = request.getParameter("memid");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String ssn = request.getParameter("ssn");
		
		MemberDTO dto = new MemberDTO();	
		dto.setMemid(memid);
		dto.setPw(pw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setSsn(ssn);
	
		MemberDAO dao = new MemberDAO();
		int result = dao.create(dto);
		
		if(result == 0){
	%>		
			alert("회원가입 실패");
			window.history.back();
	<%		
		}else{
	%>		
			alert("회원가입 성공");
			window.location.href="index.jsp"
	<%
		}
	%>	

</script>
</head>
<body>
</body>
</html>