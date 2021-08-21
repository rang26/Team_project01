<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리</title>
<script type="text/javascript">
    <%
   	session.invalidate(); // 모든세션정보 삭제
    %>
   	alert("로그아웃")
   	window.location.href="index.jsp" 

</script>
</head>
<body>
</body>
</html>