<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    
    int proid=Integer.parseInt(request.getParameter("proid"));
    String memid = request.getParameter("memid");
    String pronam = request.getParameter("pronam");
    String proadd = request.getParameter("proadd");
    String protel = request.getParameter("protel");
    String propk = request.getParameter("propk");
    String prowifi = request.getParameter("prowifi");
    String propet = request.getParameter("propet");
    String probk = request.getParameter("probk");
    int proprice = Integer.parseInt(request.getParameter("proprice"));
    String proimg = request.getParameter("proimg");
    
    ProDTO bag = new ProDTO();
    bag.setProid(proid);
    bag.setMemid(memid);
    bag.setPronam(pronam);
    bag.setProadd(proadd);
    bag.setProtel(protel);
    bag.setPropk(propk);
    bag.setProwifi(prowifi);
    bag.setPropet(propet);
    bag.setProbk(probk);
    bag.setProprice(proprice);
    bag.setProimg(proimg);
    
    ProDAO dao = new ProDAO();
    
    int result = dao.update(bag);
    
    
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
요청하신 상품수정 정보를 데이터베이스로 전송합니다.
</body>
</html>