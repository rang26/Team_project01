<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.ReplyDAO"%>
<%@page import="board.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String boardid = request.getParameter("boardid");
		String replyid = request.getParameter("replyid");
		ReplyDTO bag = new ReplyDTO();
		bag.setReplyid(replyid);
		ReplyDAO db = new ReplyDAO();
		db.delete(bag);
		response.sendRedirect("board_detail.jsp?boardid=" + boardid);
	%>