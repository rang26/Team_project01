<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.ReplyDAO"%>
<%@page import="board.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String boardid = request.getParameter("boardid");
		String comment = request.getParameter("comment");
		String writer = request.getParameter("writer");
		ReplyDTO bag = new ReplyDTO();
		bag.setBoardid(boardid);
		bag.setWriter(writer);
		bag.setComment(comment);
		ReplyDAO db = new ReplyDAO();
		db.create(bag);
		response.sendRedirect("board_detail.jsp?boardid=" + boardid);
	%>
