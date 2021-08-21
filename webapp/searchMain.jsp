<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/searchCSS.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.searchbar2 {
		border-radius: 30px;
		background-color: white;
		color: #DDDDDD;
	}
	
	.date_btn2 {
		font-size: 10pt;
		color: black;
		padding : 15px 30px;
		border: none;
		border-radius: 30px;
		background-color: rgba(255, 255, 255, 0.4);
	}
	
	.date_btn2:hover {
		background-color: #F7F7F7;
	}

	.date-content2 {
		display: none;
		position: absolute;
		background-color: #f1f1f1;
		min-width: 160px;
		z-index: 1;
	}
	
	.search_dropdown2{
		position: relative;
		display: inline-block;
	}

	.search2 {
		display: inline-block;
	}
	
	.search2 input {
		border: 1px solid transparent;
		font-size: 10pt;
		padding: 10px 10px;
		border-radius: 30px;
	}
	
	.search2 input:focus{
		outline: none;
		border-color: #fc3c60;
		box-shadow: 0 0 10px #fc516e;
	}
	
	.search_btn2 {
		display: inline-block;
		font-size: 10pt;
		color: white;
		padding : 15px 30px;
		border: none;
		border-radius: 0px 30px 30px 0px;
		background-color: #FC3C60;		
	}
	
	.show2 {display: block;}
</style>
<!-- 검색창에 넣어할것 -->
<!-- 
<script type="text/javascript">
	// 체크인 메뉴바 초기 설정
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
	
	function myFunction2() {
		document.getElementById("myDropdown2").classList.toggle("show");
	}

	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
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
검색창에 넣어야할것  -->

</head>

<body>
<div class="searchbar2">
	<div class="search_dropdown2">
		<button onclick="checkin2()" class="date_btn2">체크인</button>
		<div id="checkin_down2" class="date-content2">
			<input id="date_in2" type="date">
		</div>
	</div>
	|
	<div class="search_dropdown2">
		<button onclick="checkout2()" class="date_btn2">체크아웃</button>
		<div id="checkout_down2" class="date-content2">
			<input id="date_out2" type="date">
		</div>
	</div>
	|
	<div class="search2">
		<form action="searchRead.jsp">
			<input type="text" name="word" placeholder="어디로 여행가세요?">
			<button id="btn2" class="search_btn2">검색</button>
		</form>
	</div>
</div>
<script type="text/javascript">
	// 체크인 메뉴바 초기 설정
	function checkin2() {
		document.getElementById("checkin_down2").classList.toggle("show2");
	}
	
	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if (!event.target.matches('.date_btn2')) {
			var dropdowns = document.getElementsByClassName("date-content2");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show2')) {
					openDropdown.classList.remove('show2');
				}
			}
		}
	}
	
	function checkout2() {
		document.getElementById("checkout_down2").classList.toggle("show2");
	}
</script>
	<!-- 검색창에 넣어야할것  -->
	<!-- <div id="total">
		<div id="top">
			<ul>
				<li>
					<div class="dropdown">
						
						<button onclick="myFunction()" class="dropbtn">체크인</button>
						<div id="myDropdown" class="dropdown-content">
							<input id="date_in" type="date">
							
						</div>
						
					</div>
					
					<div class="dropdown">
						
						<button onclick="myFunction2()" class="dropbtn">체크아웃</button>
						<div id="myDropdown2" class="dropdown-content">
							<input id="date_out" type="date">
							
						</div>
						
					</div>

				</li>


				<li>
					검색 버튼쪽
					<form action="searchRead.jsp">
						<input type="text" name="word" placeholder="어디로 여행가세요?" size=17>
						<button id="btn">검색</button>

					</form>
				</li>

			</ul>

		</div>

	</div>
	검색창에 넣어야할것  -->

</body>


</html>






