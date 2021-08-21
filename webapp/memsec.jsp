<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.infotitle {
		font-size: 15pt;
		font-weight: 500;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #DDDDDD;
	}
	
	.infowelcome {
		font-size: 10pt;
		padding-left: 5%;
		padding-right: 5%;
		padding-top: 20px;
		padding-bottom: 10px;
	}
		
	.td1 {
		font-size: 10pt;
		color: grey;
	}
	
	.td2 {
		padding-bottom: 10px;
	}
	
	.td2 input {
		width: 100%;
		border: 1px solid #DDDDDD;
		border-radius: 3px;
		font-size: 12pt;
		font-weight: 300;
		padding: 10px 10px;
		box-sizing: border-box;
	}
	
	.td2 input:focus {
		outline: none;
		border-color: #fc3c60;
		box-shadow: 0 0 10px #fc516e;
	}
	
	.td3 {
		padding-top: 10px;
	}

	.td3 input {
		background-color: #fc516e;
		border: none;
		color: white;
		padding: 15px;
		font-size: 12pt;
		font-weight: 400;
		border-radius: 10px;
		border: none;
		width: 100%;
		cursor: pointer;
	}
	
	.td4 {
		padding-bottom: 30px;
	}
	
	.td4 input {
		background-color: white;
		border: 1px solid #DDDDDD;
		color: black;
		padding: 15px;
		font-size: 12pt;
		font-weight: 400;
		border-radius: 10px;
		width: 100%;
		cursor: pointer;
	}
	
</style>
<script type="text/javascript">

<%String memid = session.getAttribute("memid").toString();%>

/* function memsec3() { 
    location.href="memsec3.jsp";
} */

function memcor() { 
	
	cor.submit();
	
	}
function no() { 
	
	location.href="index.jsp";
	
	}  

</script>
</head>
<body>
	<div class="infotitle">
		회원정보 수정 및 탈퇴
	</div>
	<div class="infowelcome">
		등록된 정보를 수정하거나 베어비앤비를 탈퇴할 수 있습니다.
	</div>
		<form name="cor" autocomplete=off action="memcor.jsp">
			<table>
				<tr>
					<td class="td1">비밀번호</td>
				</tr>
				<tr>
					<td class="td2"><input type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td class="td1">이름</td>
				</tr>
				<tr>
					<td class="td2"><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td class="td1">전화번호</td>
				</tr>
				<tr>
					<td class="td2"><input type="text" name="tel" id="tel"></td>
				</tr>
	            <tr>
	            	<td class="td3">
	            		<input type="button" value="수정" onclick="memcor()">
	            	</td>
	            </tr>
				<tr>
					<td class="td4">
	            		<input type="button" value="탈퇴" onclick="popupbye()" >
	            	</td>
	            </tr>
	            <tr>
	            	<td class="td4">
	            		<input type="button" value="취소" onclick="no()">
	            	</td>
	            </tr>
			</table>
		</form>
</body>
</html>