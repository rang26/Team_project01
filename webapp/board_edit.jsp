<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	// 전 페이지에서 boardid 입력값 가져오기
	int boardid = Integer.parseInt(request.getParameter("boardid"));
		
	// 전체적으로 쓰일 BoardDAO boardDb 객체 생성
	BoardDAO boardDb = new BoardDAO();
	
	// boardid에 해당하는 게시글 전체 데이터가 담긴 boardBag 객체 생성
	BoardDTO boardBag = boardDb.readList(boardid);

	// content를 꺼내와 미리 String content에 넣어 준다.
	String content = boardBag.getContent();
	
	// ctgry를 꺼내와서 String에 넣는다.
	String ctgry = boardBag.getCtgry();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베어비앤비: 커뮤니티 센터</title>
<link rel="stylesheet" href="css/board.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
</head>
<body>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div class="write">
				<h1>게시물 수정하기</h1>
				<div>
					<form action="board_update.jsp" autocomplete=off>
						<table id="write_box">
							<tr>
								<td>글 제목을 입력하세요.</td>
							</tr>
							<tr>
								<td><input type="text" name="title" value="<%=boardBag.getTitle()%>"></td>
							</tr>
							<tr>
								<td>내용을 작성하세요...</td>
							</tr>
							<tr>
								<td><textarea name="content"><%=content%></textarea></td>
							</tr>
							<tr>
								<td>관련 주제 : <%=boardBag.getCtgry() %>
								</td>
							</tr>
							<tr>
								<td id="td5" colspan=8>
									<button id="write_btn1" type="submit" name="boardid" value="<%=boardid%>">확인</button> <a
									href="javascript:window.history.back();">
										<button id="write_btn2" type="button">취소</button>
								</a>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>