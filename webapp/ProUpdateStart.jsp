<!-- Updated 2021.08.09 오전 10:20 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String proid = request.getParameter("proid");
    	String memid = (String)session.getAttribute("memid");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보수정페이지</title>
<style type="text/css">
	.protitle {
		font-size: 15pt;
		font-weight: 500;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #DDDDDD;
	}
	
	.prowelcome {
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
		padding-bottom: 20px;
	}

	.td3 button {
		background-color: #fc516e;
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
</head>
<body>
	<div class="protitle">
		숙소 수정하기
	</div>
	<div class="prowelcome">
		수정하고 싶은 숙소의 정보를 입력해주세요.
	</div>
		<form action="ProUpdateStop.jsp" autocomplete=off>
			<input type="hidden" value="<%=proid%>" name="proid">
			<input type="hidden" value="<%=memid%>" name="memid">
			<table>
				<tr>
					<td class="td1">숙소명</td>
				</tr>
				<tr>
					<td class="td2"><input name="pronam"></td>
				</tr>
				<tr>
					<td class="td1">숙소 주소</td>
				</tr>
				<tr>
					<td class="td2"><input name="proadd"></td>
				</tr>
				<tr>
					<td class="td1">숙소 전화번호</td>
				</tr>
				<tr>
					<td class="td2"><input name="protel"></td>
				</tr>
				<tr>
					<td class="td1">주차가능 여부 (O/X)</td>
				</tr>
				<tr>
					<td class="td2"><input name="propk"></td>
				</tr>
				<tr>
					<td class="td1">와이파이 여부 (O/X)</td>
				</tr>
				<tr>
					<td class="td2"><input name="prowifi"></td>
				</tr>
				<tr>
					<td class="td1">반려동물 동반숙박 여부 (O/X)</td>
				</tr>
				<tr>
					<td class="td2"><input name="propet"></td>
				</tr>
				<tr>
					<td class="td1">조식제공 여부 (O/X)</td>
				</tr>
				<tr>
					<td class="td2"><input name="probk"></td>
				</tr>
				<tr>
					<td class="td1">가격(1박 기준)</td>
				</tr>
				<tr>
					<td class="td2"><input name="proprice" style="width:90%;">&nbsp;원</td>
				</tr>
	            <tr>
	            	<td class="td3">
	            		<button>상품 수정</button>
	            	</td>
	            </tr>
			</table>
		</form>

<!-- <strong>BairBnB</strong>
<h3>상품정보수정</h3>
<div><ul>
			<strong><form action="ProUpdateStop.jsp">
				<fieldset>
				<legend> <<상품정보입력>> </legend>
				<h3></h3>
				<div>
					<span>상품번호</span>
					<div>
					<input name="proid">
					</div>
				</div>
				<h3></h3>
				<div>
					<span>판매자아이디</span>
					<div>
					<input name="memid">
					</div>
				</div>
				<h3></h3>
				<div>
					<span>숙소명</span>
					<div>
					<input name="pronam">
					</div>
				</div>
				<h3></h3>
				<div>
					<span>숙소주소</span>
					<div>
					<input name="proadd">
					</div>
				</div>
				<h3></h3>
				<div>
					<span>전화번호</span>
					<div>
					<input  name="protel">
					</div>
				</div>
				<h3></h3>
				<div>
					<span>주차가능여부(O/X)</span>
					<div>
						<input  name="propk" >
					</div>
				</div>
				<h3></h3>	
					<div>
					<span>와이파이여부(O/X)</span>
					<div>
						<input  name="prowifi" >
					</div>
					</div>
				<h3></h3>
				<div>
					<span>애완동물가능여부(O/X)</span>
					<div>
						<input  name="propet" >
					</div>
				</div>
				<h3></h3>	
				<div>
					<span>조식제공여부(O/X)</span>
					<div>
						<input  name="probk">
					</div>
					
				</div>
				<h3></h3>
				<div>
					<span>가격(1박)</span>
					<div> 
						<input name="proprice"> <span>원</span>
					</div>
				</div>
			<div>
					<span>숙소사진</span>
					<div> 
						<input name="proimg"> 
					</div>
				 </div>
				
				<h3></h3>
				<hr>
				<button style="background: white;">상품정보수정</button></strong>
				<hr>
				</form>
</ul></div>
<hr> -->
</body>
</html>