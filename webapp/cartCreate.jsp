<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>
<%@page import="calendar.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
      
      String memid = (String)session.getAttribute("memid");

   int proid = Integer.parseInt(request.getParameter("proid"));
   
   //체크인,체크아웃 - 일수 계산
   String checkinout = request.getParameter("checkinout");
   String ccheckin = checkinout.substring(0, 10);
   String ccheckout = checkinout.substring(14, checkinout.length());
   Calendar dateCount = new Calendar();
   int totalDays = dateCount.totalDay(ccheckin, ccheckout);
   
   int cartprice = Integer.parseInt(request.getParameter("cartprice")) * totalDays;
   
   CartDTO cart = new CartDTO(memid, proid, ccheckin, ccheckout, cartprice);
   CartDAO dao = new CartDAO();
   dao.cartCreate(cart);
   
   //상세페이지로 이동하도록 링크 변경
   response.sendRedirect("cartMain.jsp");
      %>
    
    