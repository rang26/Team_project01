<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.ArrayList"%>
<%@page import="pay.PayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String memid = (String)session.getAttribute("memid");

String[] cartidxs = request.getParameterValues("cartidx");
PayDAO dao = new PayDAO();

for (int i = 0; i < cartidxs.length; i++) {
	dao.payCreate(Integer.parseInt(cartidxs[i]));
}


//결제 성공 시 DB 작업


response.sendRedirect("payMain.jsp");
%>


