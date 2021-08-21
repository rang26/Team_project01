<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.ArrayList"%>
<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@page import="pay.PayDTO"%>
<%@page import="pay.PayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
       String memid = (String)session.getAttribute("memid");
    	String proid2 = request.getParameter("proid");        
    
       int proid=Integer.parseInt(request.getParameter("proid"));
              
       ProDTO bag = new ProDTO();
       bag.setProid(proid);
       ProDAO dao = new ProDAO();
       ProDTO bag2 = dao.read3(bag);
       
       PayDAO payDAO = new PayDAO();
       ArrayList<String[]> sold = payDAO.payRead(proid);
       
    %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<title>Insert title here</title>
<link rel="stylesheet" href="css/pro.css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
   rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<style type="text/css">
   .detail {
      padding-bottom: 60px;
   }

   .proImg {
      width: 100%;
      border-radius: 20px;
      max-height: 500px;
      object-fit: cover;
   }
   
   #imgTd {
      width: 60%;
      border-right: 20px solid transparent;
   }

   .detailTable td{
      text-align: left;
      vertical-align: top;
   }

   input {
      border: 1px solid #DDDDDD;
      border-radius: 10px;
      font-size: 10pt;
      font-weight: 300;
      padding: 5px 5px;
      box-sizing: border-box;
   }

   .bookingBtn button {
      padding: 10px 15px;
      border-radius: 30px;
      background-color: white;
      border: 1px solid #DDDDDD;
      font-weight: 500;
   }
   
   .bookingBtn button:hover {
      color: white;
      background-color: #FC3C60;
      border: 1px solid #FC3C60;
   }
</style>
<style type="text/css">
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

	.proUpdate {
		display: none;
		position: fixed;
		margin: 2% auto;
		background-color: white;
		width: 30%;
		border-radius: 20px;
		z-index: 2;
	}
	
	.closeUpdate {
		float: left;
		padding-top: 15px;
		padding-left: 5%;
		font-size: 15pt;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
function popupUpdate() {
	var width = $('#proUpdate').width();
	$('#proUpdate').css({
		'left' : ($(window).width() - width) / 2
	});	
	document.getElementById('dimmed').style.display = "block";
	document.getElementById('proUpdate').style.display = "block";
}

function closeUpdate() {
	document.getElementById('dimmed').style.display = "none";
	document.getElementById('proUpdate').style.display = "none";
}
</script>
<script type="text/javascript">

   function inputCheck(){
      if (document.getElementsByName('checkinout')[0].value == '' || document.getElementsByName('checkinout')[0].value ==null){
         alert( '예약할 일정을 입력해주세요' );
         return false;
      } else {
         var checkin = document.getElementById('rangeDate').value.substring(0,10); 
         var checkout = document.getElementById('rangeDate').value.substring(14,24);
         var sdt = new Date(checkin);
          var edt = new Date(checkout);
         var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
         var price = dateDiff*<%=bag2.getProprice()%>
         
         var msg = checkin+"에서 "+checkout+"까지 총 "+dateDiff+"일, "+price+"원입니다.\n계속 진행하시겠어요?"
         result = confirm(msg);
         if (result){
            return true;
         } else {
            return false;
         }
      }
      
   }
      
   function mem_check() {
      alert('로그인 후 예약이 가능합니다.');
   }

</script>
</head>
<body>
<div id="main">
    								  <div class="proUpdate" id="proUpdate">
											<span class="closeUpdate" id="closeUpdate" onclick='closeUpdate()'>&times;</span>
											<jsp:include page="ProUpdateStart.jsp?proid=<%=proid %>"></jsp:include>
									</div>
   <div id="topmenu">
      <jsp:include page="topmenu.jsp"></jsp:include>
   </div>
   <div id="content">
      <div class="title">
         <h2><%=bag2.getPronam() %></h2>
      </div>
      <div class="detail">
         <form>
         <table class="detailTable">
            <tr>
               <td rowspan=11 id="imgTd">
               <%if(bag2.getProimg()==null){  %>
                  <img src="img/roomimg0.png" class="proImg">
                  <% }else{ %>
                  <img src="<%=bag2.getProimg() %>" class="proImg">
                  <%} %>
               </td>
               <td style="width:150px">
                  상품번호 : 
               </td>
               <td>
                  <%=bag2.getProid() %>
                  <input type="hidden" id="hidden" name="proid" value="<%=bag2.getProid()%>">
               </td>
            </tr>
            <tr>
               <td>
                  판매자 : 
               </td>
               <td>
                  <%=bag2.getMemid() %>
               </td>
            </tr>
            <tr>
               <td>
                  주소 : 
               </td>
               <td>
                  <%=bag2.getProadd() %>
               </td>
            </tr>
            <tr>
               <td>
                  전화번호 : 
               </td>
               <td>
                  <%=bag2.getProtel() %>
               </td>
            </tr>
            <tr>
               <td>
                  주차가능 : 
               </td>
               <td>
                  <%=bag2.getPropk() %>
               </td>
            </tr>
            <tr>
               <td>
                  와이파이 : 
               </td>
               <td>
                  <%=bag2.getProwifi() %>
               </td>
            </tr>
            <tr>
               <td>
                  반려동물 동반 숙박 : 
               </td>
               <td>
                  <%=bag2.getPropet() %>
               </td>
            </tr>
            <tr>
               <td>
                  조식제공 : 
               </td>
               <td>
                  <%=bag2.getProbk() %>
               </td>
            </tr>
            <tr>
               <td>
                  가격 : 
               </td>
               <td>
                  <%=bag2.getProprice() %>&nbsp; 원/박
                  <input type="hidden" id="hidden" name="cartprice" value="<%=bag2.getProprice()%>">
               </td>
            </tr>
            <tr>
               <td style="vertical-align: bottom; font-weight: 500;">
                     <h3>숙소 예약하기</h3>
               </td>
               <td style="font-size: 10pt; color: grey; vertical-align: bottom">
                  체크인-체크아웃 기간 선택: <br>
                  <input type="text" name='checkinout' id="rangeDate" style="width:200px;">
               </td>
            </tr>
            <tr>
               <td class="bookingBtn" colspan=2 style="padding-left: 150px;">
                     <%
                     if (memid == null) {
                     %>
                  
                     <button type="submit" onclick = "mem_check();" >장바구니 추가</button>
                     <button type="submit" onclick = "mem_check();" >숙소 바로 결제</button>
                  
                     <%
                     } else {
                     %>
                     <button type="submit" onclick = "return inputCheck();" formaction="cartCreate.jsp">장바구니 추가</button>
                     <button type="submit" onclick = "return inputCheck();" formaction="payCreateDirect.jsp">숙소 바로 결제</button>
                     <%
                     }
                     %>
               </td>
            </tr>
            	<%if (memid.equals(bag2.getMemid())) {%>
            <tr>
            	<td class="bookingBtn">
            		<button type="button" onclick="popupUpdate()">숙소 수정하기</button>
            	</td>
            </tr>
            	<%} %>
         </table>
         </form>
      </div>
   <%-- <ul><fieldset>
   <h3></h3>  
      <strong><td>상품번호: <%=bag2.getProid()%>번</td><br>
      <input type="hidden" id="hidden" name="proid" value="<%=bag2.getProid()%>">
   <h3></h3>
   <figure>
      <td><img src ="<%=bag2.getProimg()%>" class ="roomimg"></figure></td><br>
                        
      <td>판매자아이디: <%=bag2.getMemid()%></td><br>
   <h3></h3>
      <td>숙소명: <%=bag2.getPronam()%></td><br>
   <h3></h3>
      <td>숙소주소: <%=bag2.getProadd()%></td><br>
   <h3></h3>
      <td>전화번호: <%=bag2.getProtel()%></td><br>
   <h3></h3>
      <td>주차가능여부: <%=bag2.getPropk()%></td><br>
   <h3></h3>
      <td>와이파이: <%=bag2.getProwifi()%></td><br>
   <h3></h3>
      <td>애완동물가능여부: <%=bag2.getPropet()%></td><br>
   <h3></h3>
      <td>조식제공여부: <%=bag2.getProbk()%></td><br>
   <h3></h3>
      <td>가격(1박): <%=bag2.getProprice()%>원</td><br></strong>
      <input type="hidden" id="hidden" name="cartprice" value="<%=bag2.getProprice()%>">
   </ul></fieldset> --%>

<%--       <div class="booking">
         <h3>숙소 예약하기</h3>
         <div>
         체크인-체크아웃 기간 선택: <input type="text" name='checkinout' id="rangeDate" ><br>
         </div>
         <%
         if (memid == null) {
         %>
      
         <button type="submit" onclick = "mem_check();" >장바구니 추가</button>
         <button type="submit" onclick = "mem_check();" >숙소 바로 결제</button>
      
         <%
         } else {
         %>
         <button type="submit" onclick = "return inputCheck();" formaction="cartCreate.jsp">장바구니 추가</button>
         <button type="submit" onclick = "return inputCheck();" formaction="payCreateDirect.jsp">숙소 바로 결제</button>
         <%
         }
         %>
      </div> --%>
      <div class="botmenu">
               <jsp:include page="botmenu.jsp"></jsp:include>
      </div>
   </div>
</div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>

<script>
$("#rangeDate").flatpickr({
    mode: 'range',
    minDate: "today",
    dateFormat: "Y-m-d",
    disable: [
       <% for (int i = 0; i<sold.size(); i++){ %>
        {
            from: "<%=sold.get(i)[0]%>",
            to: "<%=sold.get(i)[1]%>"
        },
        <%}%>
    ]
});
</script>

</html>