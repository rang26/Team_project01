<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.ArrayList"%>
<%@page import="board.ReplyDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.ReplyDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// javascript 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

// memid 세션에서 가져오기
String memid = (String)session.getAttribute("memid");
// memid = "root";

// ctgry 파라메터 가져오기
String ctgry = request.getParameter("ctgry");

// 현재 page 파라메터 가져오기
String pageStr = request.getParameter("page");
int cPage = 1;
try {
	cPage = Integer.parseInt(pageStr);
} catch (NumberFormatException e){
	cPage = 1;
}

// 현재 page에서 시작될 레코드 시작점, 가져올 레코드 개수 (limit)
int startR = (cPage - 1) * 5;
final int LIMIT = 5;

// 전체적으로 사용할 BoardDAO boardDb 객체 생성
BoardDAO boardDb = new BoardDAO();

// 전체적으로 사용할 ReplyDAO replyDb 객체 생성
ReplyDAO replyDb = new ReplyDAO();

// 총 회원수가 담긴 가방 memCount 객체 생성
BoardDTO memCount = boardDb.readMemCount();

// 총 숙소 개수가 담긴 가방 proCount 객체 생성
BoardDTO proCount = boardDb.readProCount();

// 총 게시물 개수가 담긴 가방 boardCount 객체 생성
BoardDTO count = boardDb.readBoardCount();

int boardCount = 0;
try {
	boardCount = Integer.parseInt(count.getBoardCount());
} catch (NullPointerException e){
	boardCount = 0;
}

// 페이징: 총 page수 totalP
int totalP = boardCount % LIMIT == 0 ? boardCount / LIMIT : (boardCount / LIMIT) + 1;
if (totalP == 0) {
	totalP = 1;
}

// 페이징: 블록 최대 개수
final int BLOCKSIZE = 5;

// 페이징: 현재 블록
int cBlock = cPage % BLOCKSIZE == 0 ? cPage / BLOCKSIZE : (cPage / BLOCKSIZE) + 1;

// 페이징: 현재 페이지의 블록 내 첫번째 숫자(페이지 넘버)
int startP = (cBlock - 1) * BLOCKSIZE + 1;

// 페이징: 현재 페이지의 블록 내 마지막 숫자(페이지 넘버)
int endP = startP + BLOCKSIZE - 1;
if (endP > totalP) {
	endP = totalP;
}

//최근 게시글 제목들 3개가 담긴 boardTitleList 객체 생성
ArrayList<BoardDTO> boardTitleList = boardDb.readRecentTitles();

// 전체 게시글 데이터 담긴 ArrayList boardList객체 생성
ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();

// ctgry가 all이거나 비어있다면
if (ctgry == null || ctgry.equals("all")) {
	// 전체 게시글 가져오기
	boardList = boardDb.readList(startR, LIMIT);
} else { 
	boardList = boardDb.readList(ctgry);
}

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
			alert('로그인 후 글쓰기가 가능합니다.');
			return;
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
						<td><%=memCount.getMemCount() %> 회원</td>
						<td><span> <i class="fas fa-house-user"></i>
						</span></td>
						<td><%=proCount.getProCount() %> 호스팅</td>
						<td><span> <i class="fas fa-edit"></i>
						</span></td>
						<td><%=boardCount%> 총 게시물</td>
					</tr>
				</table>
			</div>
			<div class="rightbar">
				<div class="rightbar_write">
					모든 호스트와 게스트들이 활발하게 이야기와 아이디어를 나누고 있습니다. 사례를 공유하고 조언을 들어 보세요.
					<p></p>
					<%
					if (memid == null) {
					%>
					<button type="button" onclick='mem_check()'>대화 시작하기</button>
					<%
					} else {
					%>
					<a href="board_write.jsp"><button>대화 시작하기</button></a>
					<%
					}
					%>
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
				if (boardTitleList.size() > 0) {
					for (int i = 0; i < boardTitleList.size(); i++) {
						BoardDTO bag2 = new BoardDTO();
						bag2 = boardTitleList.get(i);
				%>
						<div class="recent_title">
							<form action="board_detail.jsp">
								<button type="submit" id="recent_title_btn"
									value="<%=Integer.parseInt(bag2.getBoardid())%>" name="boardid">
									<%=bag2.getTitle()%>
								</button>
							</form>
						</div>
					<%}
				} else {%>
					<div class="recent_title" style="background-color:white">
						<font style="font-size: 12pt">게시글이 없습니다.</font>
					</div>
				<%} %>
				</div>
			</div>
			<div class="board">
				<img src="img/board.png">
				<%
				if (boardList.size() > 0) {
						for (int i = 0; i < boardList.size(); i++) {
							BoardDTO bag = boardList.get(i);
							ReplyDTO bag2 = replyDb.readReplyCount(bag.getBoardid());
					%>
					<div id="board_title">
						<form action="board_detail.jsp">
							<button type="submit" id="board_title_btn"
								value="<%=bag.getBoardid()%>" name="boardid">
								<%=bag.getTitle()%>
							</button>
						</form>
					</div>
					<div id="board_content"><%=bag.getContent()%></div>
					<div id="board_ctgry"><%=bag.getCtgry()%></div>
					<div id="board_date"><%=bag.getDate()%></div>
					<div class="board_numbers"><%=bag2.getReplyCount()%></div>
					<div class="board_icons">
						<i class="material-icons-outlined">textsms</i>
					</div>
					<div class="board_numbers"><%=bag.getViews()%></div>
					<div class="board_icons">
						<i class="material-icons-outlined">visibility</i>
					</div>
					<%if (bag.getWriter().equals(null)) {%>
						<div id="board_writer">
							<span class="writer_icons"><i class="fas fa-user-alt"></i></span>
							알수없음
						</div>
					<%} else { %>
						<div id="board_writer">
							<span class="writer_icons"><i class="fas fa-user-alt"></i></span>
							<%=bag.getWriter()%>
						</div>
					<%}
					};
				} else {
				%>
				<div id="reply_not">아직 게시글이 없습니다. 가장 먼저 작성해 보세요!</div>
				<%
				}%>
				<%if (ctgry == null || ctgry.equals("all")) {%>
				<div class="block">
						<table class="paging">
							<tr>
								<%
								if (startP == 1) {
								%>
									<td class="paging_disabled">
										&lt;&lt;
									</td>
								<%
								} else {
								%>
									<td class="paging_block">
										<a href="board.jsp?page=<%=startP - 1%>">&lt;&lt;</a>
									</td>
								<%
								}
								for (int i = startP; i <= endP; i++) {
								%>
									<%if (cPage == i) {%>
										<td class="paging-disabled" style="color:#FC3C60">
											<%=i %>
										</td>
									<%} else { %>
										<td class="paging-block">
											<a href="board.jsp?page=<%=i%>"><%=i %></a>
										</td>
									<%} %>
								<%
								}
								if (totalP == endP) {
								%>
									<td class="paging_disabled">
										&gt;&gt;
									</td>
								<%	
								} else {
								%>
									<td class="paging_block">
										<a href="board.jsp?page=<%=endP + 1 %>">&gt;&gt;</a>
									</td>
								<%
								}
								%>
							</tr>
						</table>
				</div>
			</div>
			<%
			} %>
		</div>
		<div class="botmenu">
			<jsp:include page="botmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>