<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
     
 	 String memid=request.getParameter("memid");
 	 String pronam=request.getParameter("pronam");
 	 String proadd= request.getParameter("proadd");
 	 String protel= request.getParameter("protel");
 	 String propk= request.getParameter("propk");
 	 String prowifi= request.getParameter("prowifi");
 	 String propet= request.getParameter("propet");
 	 String probk= request.getParameter("probk");
 	 int proprice = Integer.parseInt(request.getParameter("proprice"));
    
    	
    	ProDTO bag = new ProDTO();
    	
    	bag.setMemid(memid);
    	bag.setPronam(pronam);
    	bag.setProadd(proadd);
    	bag.setProtel(protel);
    	bag.setPropk(propk);
    	bag.setProwifi(prowifi);
    	bag.setPropet(propet);
    	bag.setProbk(probk);
    	bag.setProprice(proprice);
    	
    	ProDAO dao = new ProDAO();
    	dao.create(bag);
    	
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function msg() {
		alert('요청하신 상품등록 정보를 데이터베이스로 전송합니다.');
		window.location.href="ProListStart.jsp";
	}
</script>
</head>
<body onload="msg()">
</body>
</html>