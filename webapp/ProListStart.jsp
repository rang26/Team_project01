<!-- Updated 2021.08.09 오전 10:20 -->

<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProDAO"%>
<%@page import="product.ProDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   ProDAO dao = new ProDAO();
   ArrayList<ProDTO> list = dao.read();
%> 
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>상품리스트</title>
<style type="text/css">
   td a{
      display: block;
      text-decoration: none;
      color: black;
   }
   
   .list {
      padding-left: 5%;
   }
   
   .product {
      display: inline-block;
   }
   
   td {
      vertical-alignment: center;
      max-width: 300px;
      color: black;
      border-right: 10px solid transparent;
      background-clip: padding-box;
   }

   .proimg {
      width: 290px;
      max-height: 190px;
      object-fit: cover;
      border-radius: 15px;
   }
</style>
<link rel="stylesheet" href="css/pro.css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap"
   rel="stylesheet">
<script src="https://kit.fontawesome.com/57a2eb66e4.js"></script>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
</head>
<body>
   <div id="main">
      <div id="topmenu">
         <jsp:include page="topmenu.jsp"></jsp:include>
      </div>
      <div id="content">
         <div class="title">
            <h2>숙소 리스트</h2>
         </div>
         <div class="list">
         <%
         if (list.size() > 0) {
            for (ProDTO dto : list) {
            %>
               <div class="product">
                  <table>
                     <tr>
                        <td style="font-size: 10pt; color: grey;">
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>">숙소 번호: <%=dto.getProid() %></a>
                        </td>
                     </tr>
                     <tr>
                        <td>
                        <% if(dto.getProimg()==null){ %>
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><img src="img/roomimg0.png" class="proimg"></a>
                        <%} else {%>
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><img src="<%=dto.getProimg() %>" class="proimg"></a>
                        <% } %>
                        </td>
                     </tr>
                     <tr>
                        <td style="font-weight: 500; font-size: 15pt">
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getPronam() %></a>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProadd() %></a>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProtel() %></a>
                        </td>
                     </tr>
                     <tr>
                        <td style="border-bottom: 20px solid transparent; text-align: right;">
                           <a href="Proread.jsp?proid=<%=dto.getProid() %>"><%=dto.getProprice() %>&nbsp;원/박</a>
                        </td>
                     </tr>
                  </table>
               </div>
                  <%-- <a href=Proread.jsp?proid=<%=dto.getProid()%>>
                     <figure>
                        <strong><%=dto.getProid()%>.</strong><br>
                     </figure>
                     <figure>
                     <img src ="<%=dto.getProimg()%>" class ="roomimg">
                              </figure>
                     <figure>
                        <strong>숙소명: <%=dto.getPronam()%></strong><br></figure>
                     <figure>
                        <strong>숙소주소: <%=dto.getProadd()%></strong><br></figure>
                     <figure>
                        <strong>전화번호: <%=dto.getProtel()%></strong><br></figure>
                     <figure>
                        <strong>가격(1박): <%=dto.getProprice()%>원</strong></figure>
                  </a> --%>
            <%}} else { %>
            <div class="product">
               <table>
                  <tr>
                     <td>
                        아직 등록된 숙소가 없습니다!
                     </td>
                  </tr>
               </table>
            </div>
         <%}%>
         </div>
         <div class="buttons">
            <form action="Proread.jsp">
               숙소번호: <input name="proid" style="width: 50px;"> &nbsp;
               <button class="b1">숙소 번호로 검색</button>
            </form>
         </div>
         <div class="botmenu">
            <jsp:include page="botmenu.jsp"></jsp:include>
         </div>
      </div>
   </div>
</body>
</html>