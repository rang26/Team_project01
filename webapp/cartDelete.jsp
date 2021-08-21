<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="cart.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%

String[] cartidxList = request.getParameterValues("cartidx");
String[] cartidxList2 = request.getParameterValues("cartidx2");

CartDAO dao = new CartDAO();

// int totalDelete = 0;
if(cartidxList != null){
   for (int i = 0; i < cartidxList.length; i++) {
      int resultInt = dao.cartDelete(Integer.parseInt(cartidxList[i]));
   }
}
if(cartidxList2 != null){
   for (int i = 0; i < cartidxList2.length; i++) {
      int resultInt = dao.cartDelete(Integer.parseInt(cartidxList2[i]));
   }
}
response.sendRedirect("cartMain.jsp");
%>