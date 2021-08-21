<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.function.Function"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	
function idCheck2(){
	var f = document.member;

	if(f.memid.value =="" || f.memid.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		f.memid.focus();
	}else if (f.memid.value.length<4 || f.memid.value.length>12) {
        alert("아이디를 4~12자까지 입력해주세요.")
        f.memid.focus();
        return false;
	} else {
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.location.href= "memjoin3.jsp?memid="+f.memid.value;
	}
}
</script>	
<style type="text/css">
	.jointitle {
		font-size: 15pt;
		font-weight: 500;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #DDDDDD;
	}
	
	.joinwelcome {
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

	#b1 {
		background-color: white;
		cursor: pointer;
		border-radius: 10px;
	}

	#b1:focus {
		outline: none;
		border-color: #DDDDDD;
		box-shadow: none;
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
	function Check() {

		var f = document.member;
		
		if (f.memid.value == "") {
			alert("아이디를 입력해 주세요.")
			f.memid.focus(); 
			return false;
		}
		
		if (f.memid.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            f.memid.focus();
            return false;
		}    
         
		if (f.memid.value.length<4 || f.memid.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.")
            f.memid.focus();
            return false;
		}    
		

		if (f.pw.value == "") {
			alert("비밀번호를 입력해주십시오");
			f.pw.focus();
			return false;
		}

		if (f.pw.value != f.pw2.value) {
			alert("비빌번호를 다르게 입력했습니다.");
			f.pw.focus();
			return false;
		}

		if (f.name.value == "") {
			alert("이름을 입력해주십시오");
			f.name.focus();
			return false;
		}

		if (f.tel.value == "") {
			alert("전화번호를 입력해주십시오");
			f.tel.focus();
			return false;
		}

		
		if (f.ssn.value == "") {
			alert("주민번호를 입력해주십시오");
			f.ssn.focus();
			return false;
		
		}
		
		if (f.ssn.value.length != 13) {
            alert("주민번호 길이가 맞지 않습니다.");
            f.ssn.focus();
            return false;
		}
		
		member.submit();	
		
		
	}//Check

	/* function memlogin() {
    	location.href="memlogin.jsp";
} */
	
</script>
</head>
<body>
	<div class="jointitle">
		베어비앤비 회원가입
	</div>
	<div class="joinwelcome">
		베어비앤비의 모든 서비스는 무료로 제공되며 회원 가입시 보다 풍성한 서비스를 제공 받으실 수 있습니다.
	</div>
	<form name="member" autocomplete="off" action="memjoin2.jsp">
		<table>
			<tr>
				<td class="td1">아이디</td>
			</tr>
			<tr>
				<td class="td2"><input type="text" name="memid" id="memid" 
					placeholder="4~12자까지/중복확인">
				</td>
				<td class="td2">
					<input type="button" value="중복확인" id="b1" onclick="idCheck2()" >
				</td>
			</tr>
			<tr>
				<td class="td1">비밀번호</td>
			</tr>
			<tr>
				<td class="td2" colspan=2><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td class="td1">비밀번호확인</td>
			</tr>
			<tr>
				<td class="td2" colspan=2><input type="password" name="pw2" id="pw2"
					placeholder="비밀번호 재입력"></td>
			</tr>
			<tr>
				<td class="td1">이름</td>
			</tr>
			<tr>
				<td class="td2" colspan=2><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td class="td1">전화번호</td>
			</tr>
			<tr>
				<td class="td2" colspan=2><input type="text" name="tel" id="tel"
					placeholder="-를 빼고 입력해주세요"></td>
			</tr>
			<tr>
				<td class="td1">주민등록번호</td>
			</tr>
			<tr>
				<td class="td2" colspan=2><input type="text" name="ssn" id="ssn"
					placeholder="-를 빼고 입력해주세요"></td>
			</tr>
            <tr>
            	<td class="td3" colspan=2>
            		<input type="button" value="회원가입" onclick="return Check();" >
            	</td>
            </tr>
			<tr>
				<td class="td4" colspan=2>
            		<input type="button" value="취소" onclick="closejoin(); popuplogin();">
            	</td>
            </tr>
		</table>
	</form>
</body>
</html>