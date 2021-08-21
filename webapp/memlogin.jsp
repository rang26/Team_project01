<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.logintitle {
		font-size: 10pt;
		font-weight: 500;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #DDDDDD;
	}
	
	.loginwelcome {
		font-size: 15pt;
		padding-left: 5%;
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
		padding-bottom: 5px;
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
<script src="js/member.js"></script>
<script type="text/javascript">
	
	function loginCheck(){
		var f = document.login;
		
        if(f.memid.value == ""){
            alert("아이디를 입력하세요");    
            f.memid.focus();
            return false;
        }
        if(f.pw.value == "")
        {
            alert("비밀번호를 입력하세요");    
            f.pw.focus();
            return false;
        }
        login.submit();
    }
	/* 
	// 회원가입 버튼클릭시 회원가입 화면으로 이동.
	function memjoin() { 
        location.href="memjoin.jsp";
    }  */   

</script>
</head>
<body>
	<div class="logintitle">
		로그인 또는 회원가입
	</div>
	<div class="loginwelcome">
		베어비앤비에 오신 것을 환영합니다.
	</div>
	<form action="memloginOK.jsp" name="login" autocomplete="off">
		<table>
			<tr>
				<td class="td1">아이디</td>
		 	</tr>
		 	<tr>
		 		<td class="td2">
		 			<input type="text" name="memid">
		 		</td>
		 	</tr>
		 	<tr>	
		 		<td class="td1">비밀번호</td>
		 	</tr>
		 	<tr>
		 		<td class="td2">
		 			<input type="password" name="pw" >
		 		</td>
		 	</tr>
			<tr>
				<td class="td3">
		           <input type="button" value="로그인" onclick="loginCheck()">
		        </td>
			</tr>
			<tr>
				<td class="td4">
					<input type="button" value="회원가입" onclick="closelogin(); popupjoin();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>