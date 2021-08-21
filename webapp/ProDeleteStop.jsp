<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int proid=Integer.parseInt(request.getParameter("proid"));
    
    	ProDTO bag = new ProDTO();
    	bag.setProid(proid);
    
    	ProDAO dao = new ProDAO();
    
    	int result = dao.delete(bag);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="lightgray">
요청하신 상품삭제 정보를 데이터베이스로 전송합니다.
</body>
</html>