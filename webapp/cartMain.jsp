<!-- Updated 2021.08.10 12:00 -->
<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>
<%@page import="pay.PayDAO"%>
<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@page import="calendar.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("memid");

CartDAO dao = new CartDAO();
ArrayList<CartDTO> cartList = dao.cartRead(memid);

int totalCartPrice = 0;
for (int i = 0; i < cartList.size(); i++) {
   totalCartPrice += cartList.get(i).getCartprice();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베어비앤비: 위시리스트</title>
<!-- 아래는 css 링크 -->
<link rel="stylesheet" href="css/board.css">
<!-- 아래는 폰트 링크 -->
<!-- css에서
   font-family: 'Noto Sans KR', sans-serif;
   font-size : 사이즈pt; (eg. 15pt;)
   font-weight : 300 / 400 / 500 골라서 넣으면 돼요 (500이 가장 굵은 거)
 -->
<link rel="stylesheet" href="css/cart.css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
   rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<script type="text/javascript">
   function check(){
      //체크박스 체크 되었는 지 확인, soldout 숙소가 체크됐는지 확인,
      //결제가능한 체크된 숙소 cartidx 배열 저장
      var checked2 = document.getElementsByName('cartidx2');
      for (var i = 0; i<checked2.length; i++){
         if(checked2[i].checked){
            alert("예약할 수 없는 숙소가 있습니다.\n구매하실 숙소를 다시 확인해주세요.");
            return false;
         }
      }
      var checked = document.getElementsByName('cartidx');
      var check = false;
      for (var i = 0; i<checked.length; i++){
         if(checked[i].checked){
            check = true;
            break;
         }
      }
      if(!check){
         alert("여행을 떠날 숙소를 선택해주세요");
         return false;
      } else {
         result = confirm("선택한 숙소로 여행을 떠나시겠습니까?");
         if(result){
            return true;
         }else{
            return false;
         }
      }
   }
   
   function deleteCheck() {
      var checked = document.getElementsByName('cartidx');
      var checked2 = document.getElementsByName('cartidx2');
      var check = false;
      for (var i = 0; i<checked.length; i++){
         if(checked[i].checked){
            check = true;
            break;
         }
      }
      for (var i = 0; i<checked2.length; i++){
         if(checked2[i].checked){
            check = true;
            break;
         }
      }
      if(check){
         result = confirm("선택한 숙소를 위시리스트에서 지우시겠습니까?");
         if(result){
            return true;
         }else{
            return false;
         }
      } else {
         alert("삭제할 숙소를 선택해주세요");
         return false;
      }
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
         <h2>위시리스트</h2>
         여행을 떠날 준비가 되셨나요?<br>
      </div>
      <form>
         <table>
         <tr class="header_tr">
            <td class="header">선택</td>
            <td class="header">#</td>
            <td class="header" width="50%">숙소명</td> 
            <td class="header">체크인</td>
            <td class="header">체크아웃</td>
            <td class="header">가격</td>
         </tr>
         <%if (cartList.size() > 0) {
         
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String toDay = simpleDateFormat.format(new Date());
            
            for (int i = 0; i < cartList.size(); i++) {
               //결제 가능 여부 저장용
               boolean available = true;
               //날짜 비교용 클래스 객체 생성
               Calendar dateCheck = new Calendar();
               
               //구매할 숙소의 체크인, 체크아웃 기간 추출 [yyyy,mm,dd]
               String inCheck = cartList.get(i).getCcheckin();
               String outCheck = cartList.get(i).getCcheckout(); 
               
               //체크인 날짜가 (오늘을 포함한) 이후인지 확인
               if(dateCheck.small(inCheck, toDay)){
                  available = false;
               }
               
               //설정한 기간이 이미 판매완료된 기간인 지 확인
               if(available == true){
                  //PayDAO 객체 생성 및 결제할 proid의 기존 구매 내역 호출 
                  PayDAO payD = new PayDAO();
                  ArrayList<String[]> occupied = payD.payRead(cartList.get(i).getProid()); //[{체크인,아웃},{인,아웃},...]
                  
                  for(int j = 0; j < occupied.size(); j++) {
                     String ci = occupied.get(j)[0];   //soldout 체크인 [yyyy-mm-dd]
                     String co = occupied.get(j)[1];   //soldout 체크아웃 [yyyy-mm-dd]
                  
                     //outCheck이 ci이전(ci 포함)이거나, inCheck이 co 이후(co포함)인가요?
                     if(dateCheck.small(outCheck, ci) || dateCheck.same(outCheck, ci)){
                     } else if(dateCheck.big(inCheck, co) || dateCheck.same(inCheck, co)){
                     } else {
                        available = false;
                        break;
                     }
                  }
               }
               
               if(available == true){ %>
            <tr>
               <td class="info"><input type="checkbox" name="cartidx"
                  value=<%=cartList.get(i).getCartidx()%>></td>
               <td class="info"><%=i + 1%></td>
               <%
               ProDAO pro = new ProDAO();
               ProDTO proBag = pro.read(cartList.get(i).getProid());
               String pronam = proBag.getPronam(); 
               %>
               <td class="info"><%=pronam%></td>
               <td class="info"><%=cartList.get(i).getCcheckin()%></td>
               <td class="info"><%=cartList.get(i).getCcheckout()%></td>
               <td class="info"><%=cartList.get(i).getCartprice()%> 원</td>
            </tr>
               
               <% } else{ %>
            <tr>
               <td class="info2"><input type="checkbox" name="cartidx2"
                  value=<%=cartList.get(i).getCartidx()%>></td>
               <td class="info2"><%=i + 1%></td>
               <%
               ProDAO pro = new ProDAO();
               ProDTO proBag = pro.read(cartList.get(i).getProid());
               String pronam = proBag.getPronam(); 
               %>
               <td class="info2"><%=pronam%></td>
               <td class="info2"><%=cartList.get(i).getCcheckin()%></td>
               <td class="info2"><%=cartList.get(i).getCcheckout()%></td>
               <td class="info2"><%=cartList.get(i).getCartprice()%> 원</td>
            </tr>                  
               <%}
            }//end of for(위시리스트 출력용)
            %>
                        
         <%} else { %>
            <tr>
               <td colspan=6 class="empty">위시리스트가 아직 beer있어요! 채우러 가볼까요? </td>
            </tr>
         <%} %>
         <tr class="total_tr">
            <td colspan='5' class="header" style="text-align: right">총 가격</td>
            <td class="total"><%=totalCartPrice%> 원</td>
         </tr>
         </table>
         <div class="buttons">
            <button type="submit" onclick="return deleteCheck();" formaction="cartDelete.jsp" class="b1">선택 숙소 삭제</button>
            <button type="submit" onclick="return check();" formaction="payCreate.jsp" class="b2">선택 숙소 결제</button>
         </div>
      </form>
      </div>
      <div class="botmenu">
         <jsp:include page="botmenu.jsp"></jsp:include>
      </div>
   </div>
</body>
</html>