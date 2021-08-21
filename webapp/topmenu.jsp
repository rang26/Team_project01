<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		// memid 세션에서 가져오기
		String memid = (String)session.getAttribute("memid");

	%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/member.js"></script>
<script type="text/javascript">
function popupinfo() {
	var width = $('#meminfo').width();
	$('#meminfo').css({
		'left' : ($(window).width() - width) / 2
	});	
	document.getElementById('dimmed').style.display = "block";
	document.getElementById('meminfo').style.display = "block";
}

function closeinfo() {
	document.getElementById('dimmed').style.display = "none";
	document.getElementById('meminfo').style.display = "none";
}
function popuppro() {
	var width = $('#proinsert').width();
	$('#proinsert').css({
		'left' : ($(window).width() - width) / 2
	});	
	document.getElementById('dimmed').style.display = "block";
	document.getElementById('proinsert').style.display = "block";
}

function closepro() {
	document.getElementById('dimmed').style.display = "none";
	document.getElementById('proinsert').style.display = "none";
}

function popupbye() {
	var width = $('#membye').width();
	$('#membye').css({
		'left' : ($(window).width() - width) / 2
	});	
	document.getElementById('dimmed').style.display = "block";
	document.getElementById('membye').style.display = "block";
	document.getElementById('meminfo').style.display = "none";
}

function closebye() {
	document.getElementById('dimmed').style.display = "none";
	document.getElementById('membye').style.display = "none";
}
</script>
<style>
	.searchbar {
		position: absolute;
		top: 50%;
		right: 40%;
		transform: translateY(-50%);
		border-radius: 30px;
		background-color: white;
		color: #DDDDDD;
	}

	.date_btn {
		font-size: 10pt;
		color: black;
		padding : 15px 30px;
		border: none;
		border-radius: 30px;
		background-color: rgba(255, 255, 255, 0.4);
	}
	
	.date_btn:hover {
		background-color: #F7F7F7;
	}

	.date-content {
		display: none;
		position: absolute;
		background-color: #f1f1f1;
		min-width: 160px;
		z-index: 1;
	}
	
	.search_dropdown{
		position: relative;
		display: inline-block;
	}

	.search {
		display: inline-block;
	}
	
	.search input {
		border: 1px solid transparent;
		font-size: 10pt;
		padding: 10px 10px;
		border-radius: 30px;
	}
	
	.search input:focus{
		outline: none;
		border-color: #fc3c60;
		box-shadow: 0 0 10px #fc516e;
	}
	
	.search_btn {
		display: inline-block;
		font-size: 10pt;
		color: white;
		padding : 15px 30px;
		border: none;
		border-radius: 0px 30px 30px 0px;
		background-color: #FC3C60;		
	}
	
	.dimmed {
		display: none;
		width: 100%;
		height: 100%;
		position: fixed;
		top: 0;
		background-color: black;
		opacity: 0.7;
		z-index: 1;
	}
	
	.memlogin {
		display: none;
		position: fixed;
		margin: 10% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}

	.memjoin {
		display: none;
		position: fixed;
		margin: 5% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}

	.meminfo {
		display: none;
		position: fixed;
		margin: 5% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}
	
	.membye {
		display: none;
		position: fixed;
		margin: 5% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}
	
	.proinsert {
		display: none;
		position: fixed;
		margin: 2% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}
	
	.closelogin {
		float: left;
		padding-top: 15px;
		padding-left: 5%;
		font-size: 15pt;
		cursor: pointer;
	}

	.dropdown {
	  float: right;
	  position: relative;
	  display: inline-block;
	}
	
	.dropbtn {
	  cursor: pointer;
	}
	
	.somenu-content {
	  display: none;
	  position: absolute;
	  background-color: white;
	  min-width: 200px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  border-radius: 20px;
	  font-size: 11pt;
	  font-weight: 500;
	  padding-bottom: 15px;
	  padding-top: 15px;
	  top: 45px;
	  right: 0;
	  z-index: 1;
	}
	
	.somenu-content a {
	  color: black;
	  padding: 10px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.somenu-content a:hover {
		background-color: #F7F7F7;
	}
	
	.show {display: block;}
	
	hr {
		background-color: #DDDDDD;
		height: 1px;	
		border: none;
	}
	
	button span {
	  pointer-events: none;
	}
</style>
</head>
<body>
							<div class="dimmed" id="dimmed"></div>
							<div class="memlogin" id="memlogin">
								<span class="closelogin" id="closelogin" onclick='closelogin()'>&times;</span>
								<jsp:include page="memlogin.jsp"></jsp:include>
							</div>
							<div class="memjoin" id="memjoin">
								<span class="closelogin" id="closelogin" onclick='closejoin()'>&times;</span>
								<jsp:include page="memjoin.jsp"></jsp:include>
							</div>
							<%
								if (memid != null) { %>
									<div class="meminfo" id="meminfo">
										<span class="closelogin" id="closelogin" onclick='closeinfo()'>&times;</span>
										<jsp:include page="memsec.jsp"></jsp:include>
									</div>
									<div class="proinsert" id="proinsert">
										<span class="closelogin" id="closelogin" onclick='closepro()'>&times;</span>
										<jsp:include page="ProInsertStart.jsp"></jsp:include>
									</div>
							<% }
								if (memid != null) { %>
									<div class="membye" id="membye">
										<span class="closelogin" id="closelogin" onclick='closebye()'>&times;</span>
										<jsp:include page="memsec3.jsp"></jsp:include>
									</div>
							<% }
							%>
 	<div id="logoW">
		<a href="index.jsp"><img src="img/logo_white.png" id="change"></a>
	</div>
	<div id="logoP">
		<a href="index.jsp"><img src="img/logo_pink.png" id="change"></a>
	</div>
	<div class="searchbar">
					<div class="search_dropdown">
						<button onclick="checkin()" class="date_btn">체크인</button>
						<div id="checkin_down" class="date-content">
							<input id="date_in" type="date">
						</div>
					</div>
					|
					<div class="search_dropdown">
						<button onclick="checkout()" class="date_btn">체크아웃</button>
						<div id="checkout_down" class="date-content">
							<input id="date_out" type="date">
						</div>
					</div>
					|
					<div class="search">
						<form action="searchRead.jsp">
							<input type="text" name="word" placeholder="어디로 여행가세요?">
							<button id="btn" class="search_btn">검색</button>
						</form>
					</div>
	</div>
	<div class="topmenulist">
		<a href="ProListStart.jsp">
			<button>숙소 둘러보기</button>
		</a>
		<a href="board.jsp">
			<button>커뮤니티</button>&nbsp;&nbsp;
		</a>
		<div class="dropdown">
			<button class="dropbtn" id="membericon" onclick='somenu()'>
				<span style="font-size: 20px"><i class="fas fa-bars"></i>
					&nbsp;<i class="fas fa-user-circle"></i></span>
			</button>
			<%if (memid == null) {%>
				<div id="somenu" class="somenu-content">
					<a href="javascript: popuplogin()">로그인</a>
					<a href="javascript: popupjoin()">회원가입</a>
				</div>
			<%} else { %>
				<div id="somenu" class="somenu-content">
					<a href="rec.jsp">추천 컬렉션</a>
					<a href="cartMain.jsp">위시리스트</a>
					<a href="payMain.jsp">스케줄러</a>
					<hr>
					<a href="javascript: popuppro()">호스팅하기</a>
					<a href="sellerMain.jsp">호스팅 내역</a>
					<hr>
					<a href="javascript: popupinfo()">계정 정보</a>
					<a href="board.jsp">문의하기</a>
					<hr>
					<a href="memout.jsp">로그아웃</a>
				</div>
			<%}%>
		</div>
	<script>
	function somenu() {
	  document.getElementById("somenu").classList.toggle("show");
	}
	
	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {
	    var dropdowns = document.getElementsByClassName("somenu-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
	</script>
	<script type="text/javascript">
	// 체크인 메뉴바 초기 설정
	function checkin() {
		document.getElementById("checkin_down").classList.toggle("show");
	}
	
	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if (!event.target.matches('.date_btn')) {
			var dropdowns = document.getElementsByClassName("date-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
	
	function checkout() {
		document.getElementById("checkout_down").classList.toggle("show");
	}
</script>
	</div>
</body>
</html>