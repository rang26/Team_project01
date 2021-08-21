<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.ArrayList"%>
<%@page import="board.ReplyDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// javascript 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

// memid 세션에서 가져오기
String memid = (String)session.getAttribute("memid");
/* memid = "root"; */

// 전 페이지에서 boardid 입력값 받아오기
int boardid = Integer.parseInt(request.getParameter("boardid"));

// 전체적으로 쓰일 BoardDAO boardDb 객체 생성
BoardDAO boardDb = new BoardDAO();

//총 회원수가 담긴 가방 memCount 객체 생성
BoardDTO memCount = boardDb.readMemCount();

//총 숙소 개수가 담긴 가방 proCount 객체 생성
BoardDTO proCount = boardDb.readProCount();

//총 게시물 개수가 담긴 가방 boardCount 객체 생성
BoardDTO boardCount = boardDb.readBoardCount();

// 최근 게시글 제목들 3개가 담긴 boardTitleList 객체 생성
ArrayList<BoardDTO> boardTitleList = boardDb.readRecentTitles();

// 조회수 올리는 메서드 호출 (페이지가 load되면 자동으로 views += 1)
boardDb.updateViews(boardid);

// boardid에 해당하는 게시글 전체 데이터가 담긴 boardBag 객체 생성
BoardDTO boardBag = boardDb.readList(boardid);

// content를 꺼내와 줄바꿈 처리를 해준다.
String content = boardBag.getContent();
// content = content.replaceAll("\r\n", "<br>");

// 전체적으로 쓰일 ReplyDAO replyDb 객체 생성
ReplyDAO replyDb = new ReplyDAO();

// boardid에 해당하는 댓글 개수 담긴 가방 replyCount 객체 생성
ReplyDTO replyCount = replyDb.readReplyCount(boardBag.getBoardid());

// boardid에 해당하는 전체 댓글 담긴 컨테이너 replyList 객체 생성
ArrayList<ReplyDTO> replyList = replyDb.readList(boardid);
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<script type="text/javascript" charset="UTF-8">
	function mem_check() {
			alert('로그인 후 답변 등록이 가능합니다.');
			return;
	}
	
	function board_delete() {
		if (!confirm('게시글을 삭제하시겠습니까?')) {
			return;
		}
		document.board_del.submit();
	}
	
	function reply_delete() {
		if (!confirm('댓글을 삭제하시겠습니까?')) {
			return;
		}
		document.reply_del.submit();
	}
	
	function reply_check() {
		if (document.getElementById('comment').value == ''){
			document.getElementById("commentCheck").innerHTML = "댓글 내용을 입력해주세요.";
			document.getElementById('comment').focus();
			return;
		}
		document.reply_create.submit();
	}
</script>
</head>
<body>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div class="title">
				<h2>베어비앤비 커뮤니티에 오신 것을 환영합니다</h2>
				모두가 소속감을 느끼는 세상을 만들고 있는 베어비앤비의 커뮤니티 공간입니다. 베어비앤비 계정으로 로그인 후 글쓰기가
				가능합니다.<br>
			</div>
			<div class="title_numbers">
				<table>
					<tr>
						<td><span> <i class="fas fa-users"></i>
						</span></td>
						<td><%=memCount.getMemCount()%> 회원</td>
						<td><span> <i class="fas fa-house-user"></i>
						</span></td>
						<td><%=proCount.getProCount()%> 호스팅</td>
						<td><span> <i class="fas fa-edit"></i>
						</span></td>
						<td><%=boardCount.getBoardCount()%> 총 게시물</td>
					</tr>
				</table>
			</div>
			<div class="rightbar">
				<div class="rightbar_write">
					모든 호스트와 게스트들이 활발하게 이야기와 아이디어를 나누고 있습니다. 사례를 공유하고 조언을 들어 보세요.
					<p></p>
					<a href="board_write.jsp"><button>대화 시작하기</button></a>
				</div>
				<div class="rightbar_ctgr">
					관련 주제<br> 
					<form action="board.jsp">
					<a href="board.jsp"><button value="all" name="ctgry">전체</button></a>
					<a href="board.jsp"><button value="숙소" name="ctgry">숙소</button></a>
					<a href="board.jsp"><button value="예약" name="ctgry">예약</button></a>
					<a href="board.jsp"><button value="환불" name="ctgry">환불</button></a>
					<a href="board.jsp"><button value="결제" name="ctgry">결제</button></a>
					<a href="board.jsp"><button value="사이트" name="ctgry">사이트</button></a>
					<a href="board.jsp"><button value="계정" name="ctgry">계정</button></a>
					<a href="board.jsp"><button value="호스팅" name="ctgry">호스팅</button></a>
					<a href="board.jsp"><button value="기타" name="ctgry">기타</button></a>
					</form>
				</div>
				<div class="rightbar_recent">
					최근 대화
					<%
				for (int i = 0; i < boardTitleList.size(); i++) {
					BoardDTO bag2 = new BoardDTO();
					bag2 = boardTitleList.get(i);
				%>
					<div class="recent_title">
						<form action="board_detail.jsp">
							<button type="submit" id="recent_title_btn"
								value="<%=bag2.getBoardid()%>" name="boardid">
								<%=bag2.getTitle()%>
							</button>
						</form>
					</div>
					<%
					}
					;
					%>
				</div>
			</div>
			<!-- rightbar div -->
			<div class="detail">
				<div class="detail_board">
					<div id="detail_title"><%=boardBag.getTitle()%></div>
					<div class="detail_numbers"><%=replyCount.getReplyCount()%></div>
					<div class="detail_icons">
						<i class="material-icons-outlined">textsms</i>
					</div>
					<div class="detail_numbers"><%=boardBag.getViews()%></div>
					<div class="detail_icons">
						<i class="material-icons-outlined">visibility</i>
					</div>
					<%if (boardBag.getWriter().equals(null)) {%>
						<div id="detail_writer">
							<span class="writer_icons"><i class="fas fa-user-alt"></i></span>
							알수없음
						</div>
					<%} else { %>
					<div id="detail_writer">
						<span class="writer_icons"><i class="fas fa-user-alt"></i></span>
						<%=boardBag.getWriter()%>
					</div>
					<%} %>
					<div id="detail_ctgry"><%=boardBag.getCtgry()%></div>
					<div id="detail_date"><%=boardBag.getDate()%></div>
					<div id="detail_content"><%=content%></div>
				</div>
				<div class="detail_buttons">
					<div id="detail_back">
						<a href="javascript:history.back();"><button type="button">목록으로</button></a>
					</div>
					<%
					if (boardBag.getWriter().equals(memid)) {
					%>
						<div class="detail_go">
							<form action="board_delete.jsp" method="post" name="board_del">
								<input value="<%=boardid%>" name="boardid" type="hidden">
								<button type="button" onclick='board_delete()'>삭제</button>
							</form>
							<form action="board_edit.jsp">
								<button type="submit" value="<%=boardid%>" name="boardid">수정</button>
							</form>
						</div>
					<%
					}
					%>
				</div>
				<div class="reply">
					<div class="reply_count">
						<%=replyCount.getReplyCount()%>
						댓글
					</div>
					<%
					if (replyList.size() > 0) {
					%>
					<%
					for (int i = 0; i < replyList.size(); i++) {
						ReplyDTO bag = replyList.get(i);
						String comment = bag.getComment();
						comment = comment.replaceAll("\r\n", "<br>");
					%>
					<div class="reply_list">
					<%if (bag.getWriter().equals(null)) {%>
						<div id="reply_writer">
							<span class="writer_icons"><i class="fas fa-user-alt"></i></span>알수없음
						</div>
					<%} else { %>
						<div id="reply_writer">
							<span class="writer_icons"><i class="fas fa-user-alt"></i></span><%=bag.getWriter()%>
						</div>
					<%} %>
						<div id="reply_date"><%=bag.getDate()%>
						</div>
						<div id="reply_comment"><%=comment%>
						</div>
						<%if (bag.getWriter().equals(memid)) {%>
							<div id="reply_delete">
								<form action="reply_delete.jsp" method=post name="reply_del">
									<input type=hidden value="<%=boardid%>" name="boardid">
									<input type=hidden value="<%=bag.getReplyid()%>" name="replyid">
									<button type="button" onclick="reply_delete()">X</button>
								</form>
							</div>
						<%} %>
					</div>
					<%
					}
					} else {
					%>
					<div id="reply_not">아직 댓글이 없습니다. 가장 먼저 답변해 보세요!</div>
					<%
					}
					%>
					<div class="reply_write">
						<div id="reply_header">댓글 작성하기</div>
						<form action="reply_insert.jsp" name="reply_create" accept-charset="UTF-8" autocomplete=off>
							<div id="reply_textarea">
								<textarea name="comment" id="comment"></textarea>
							</div>
							<div id="commentCheck" style="color: red; font-size: 10pt; padding-left: 20px;"></div>
							<div id="reply_btn">
								<input type=hidden value="<%=boardid%>" name="boardid">
								<input type=hidden value="<%=memid %>" name="writer">
								<%if (memid == null) {%>
									<button type="button" onclick='mem_check()'>답변</button>
								<%} else { %>
									<button type="button" onclick='reply_check()'>답변</button>
								<%} %>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- detail div -->
		</div>
		<!-- content div -->
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>