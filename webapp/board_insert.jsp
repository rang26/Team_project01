<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ctgry = request.getParameter("ctgry");
		String writer = request.getParameter("writer");
		BoardDTO bag = new BoardDTO();
		bag.setTitle(title);
		bag.setContent(content);
		bag.setWriter(writer);
		bag.setCtgry(ctgry);
		BoardDAO db = new BoardDAO();
		db.create(bag);
		response.sendRedirect("board.jsp?ctgry=all");
	%>
