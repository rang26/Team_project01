<!— Updated 2021.08.09 오전 10:20 —>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.byetitle {
		font-size: 15pt;
		font-weight: 500;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #DDDDDD;
	}
	
	.td7 {
		font-size: 10pt;
		color: grey;
		padding-top: 20px;
	}
	
	.td8 {
		padding-top: 20px;
		padding-bottom: 10px;
	}
	
	.td8 input {
		width: 100%;
		border: 1px solid #DDDDDD;
		border-radius: 3px;
		font-size: 12pt;
		font-weight: 300;
		padding: 10px 10px;
		box-sizing: border-box;
	}
	
	.td8 input:focus {
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
</style>
<script type="text/javascript">
<%String memid = session.getAttribute("memid").toString();%>
        // 비밀번호 미입력시 경고창
        function pwCheck(){
            if(document.sec.pw.value == ""){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
            sec.submit();
        }
    </script>
</head>
<body>
	<div class="byetitle">
		회원 탈퇴
	</div>
	<form action="memsec2.jsp" method="post" name="sec">
		<table>
			<tr>
				<td class="td7">
					비밀번호
				</td>
			</tr>
			<tr>
				<td class="td8">
					<input type="password" name="pw" id="pw" placeholder="비밀번호 입력">
				</td>
			</tr>	
			<tr>
				<td class="td3">
					<input type="button" value="탈퇴" onclick="pwCheck()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>