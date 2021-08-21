<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String boardid = request.getParameter("boardid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = "test id";
		BoardDTO bag = new BoardDTO();
		bag.setBoardid(boardid);
		bag.setTitle(title);
		bag.setContent(content);
		BoardDAO db = new BoardDAO();
		db.update(bag);
		response.sendRedirect("board_detail.jsp?boardid=" + boardid);
	%>
