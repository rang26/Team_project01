<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String boardid = request.getParameter("boardid");
		BoardDTO bag = new BoardDTO();
		bag.setBoardid(boardid);
		BoardDAO db = new BoardDAO();
		db.delete(bag);
		response.sendRedirect("board.jsp?ctgry=all");
	%>