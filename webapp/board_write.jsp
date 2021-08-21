<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// javascript 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

// memid 세션에서 가져오기
String memid = (String)session.getAttribute("memid");
/* memid = "root"; */
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
<script type="text/javascript" charset="UTF-8">
	function board_check() {
		if (form.title.value == '') {
			document.getElementById("titleCheck").style.color = "red";
			form.title.focus();
			return;
		}
		if (form.content.value == '') {
			document.getElementById("contentCheck").style.color = "red";
			form.content.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body onload=form.title.focus()>
	<div id="main">
		<div id="topmenu">
			<jsp:include page="topmenu.jsp"></jsp:include>
		</div>
		<div id="content">
			<div class="write">
				<h1>게시물 작성하기</h1>
				<div>
					<form action="board_insert.jsp" name="form" method="post" accept-charset="UTF-8" autocomplete=off>
						<input type="hidden" value="<%=memid %>" name="writer">
						<table id="write_box">
							<tr>
								<td id="titleCheck">글 제목을 입력하세요.</td>
							</tr>
							<tr>
								<td><input type="text" name="title"></td>
							</tr>
							<tr>
								<td id="contentCheck">내용을 작성하세요...</td>
							</tr>
							<tr>
								<td><textarea name="content"></textarea></td>
							</tr>
							<tr>
								<td>관련 주제를 선택하세요.&nbsp;&nbsp;&nbsp; <select name="ctgry">
											<option value="기타">선택 안함</option>
											<option value="숙소">숙소</option>
											<option value="예약">예약</option>
											<option value="환불">환불</option>
											<option value="결제">결제</option>
											<option value="사이트">사이트</option>
											<option value="계정">계정</option>
											<option value="호스팅">호스팅</option>
								</select>
								</td>
							</tr>
							<tr>
								<td id="td5" colspan=8>
									<button id="write_btn1" type="button" onclick='board_check()'>확인</button> <a
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