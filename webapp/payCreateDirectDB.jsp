<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="pay.PayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String memid = (String)session.getAttribute("memid");
int proid = Integer.parseInt(request.getParameter("proid"));
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");
int payprice = Integer.parseInt(request.getParameter("payprice"));

PayDAO dao = new PayDAO();
dao.payCreate(memid, proid, checkin, checkout, payprice);

response.sendRedirect("payMain.jsp");
%>


