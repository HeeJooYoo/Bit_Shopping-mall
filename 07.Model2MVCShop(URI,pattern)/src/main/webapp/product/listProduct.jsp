<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<c:choose>
	<c:when test="${param.menu == 'manage'}">
		<title>惑前 包府</title>
	</c:when>
	<c:otherwise>
		<title>惑前 格废炼雀</title>
	</c:otherwise>
</c:choose>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

   function searchEnterkey() {
	  if (window.event.keyCode == 13) {
		  fncGetProductList(1);
      }
   }

   function fncGetProductList(currentPage) {
	  document.getElementById("currentPage").value = currentPage;
      document.detailForm.submit();
   }
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

   <div style="width: 98%; margin-left: 10px;">

      <form name="detailForm" action="/product/listProduct?menu=${param.menu}"
         method="post">

         <table width="100%" height="37" border="0" cellpadding="0"
            cellspacing="0">
            <tr>
               <td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
                  width="15" height="37" /></td>
               <td background="/images/ct_ttl_img02.gif" width="100%"
                  style="padding-left: 10px;">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     	<c:choose>
                     		<c:when test="${param.menu == 'manage'}">
	                     		<td width="93%" class="ct_ttl01">惑前 包府</td>                     		
                     		</c:when>
                     		<c:otherwise>
                     			<td width="93%" class="ct_ttl01">惑前 格废炼雀</td>
                     		</c:otherwise>
                     	</c:choose>
                     </tr>
                  </table>
               </td>
               <td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
                  width="12" height="37" /></td>
            </tr>
         </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
            <tr>
               <td align="right">
	               <select name="searchCondition" class="ct_input_g" style="width: 80px">
	                  <c:if test="${!empty user && user.userId == 'admin'}">
	                    <option value="0" ${search.searchCondition == '0' ? 'selected' : ''}>惑前锅龋</option>             
	                  </c:if>
	                    <option value="1" ${search.searchCondition == '1' ? 'selected' : ''}>惑前疙</option>
	               		<option value="2" ${search.searchCondition == '2' ? 'selected' : ''}>惑前啊拜</option>
	               </select> 
               		<input type="text" onkeyup="searchEnterkey();" name="searchKeyword" value="${search.searchKeyword}" class="ct_input_g" style="width: 200px; height: 19px" />
               </td>

               <td align="right" width="70">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="17" height="23">
                        	<img src="/images/ct_btnbg01.gif" width="17" height="23">
                        </td>
                        <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
                           	<a href="javascript:fncGetProductList('1');">八祸</a>
                        </td>
                        <td width="14" height="23">
                        	<img src="/images/ct_btnbg03.gif" width="14" height="23">
                        </td>
                    </tr>
                  </table>
               </td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
            <tr>
               <td colspan="8">
               		傈眉 ${resultPage.totalCount} 扒荐, 泅犁 ${resultPage.currentPage} 其捞瘤 
               </td>
               <c:if test="${param.menu != 'manage'}">
	               <td align="right">
	               		 <input type="hidden" id="searchOrder" name="searchOrder" value="${searchOrder}"/>
			 			<a href="/product/listProduct?menu=${param.menu}&searchOrder=1">惑前疙</a> | <a href="/product/listProduct?menu=${param.menu}&searchOrder=2">撤篮啊拜</a> | <a href="/product/listProduct?menu=${param.menu}&searchOrder=3">臭篮啊拜</a>
	               </td>               
               </c:if>
            </tr>
            <tr>
               <td class="ct_list_b" width="100">No</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">惑前疙</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">啊拜</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">殿废老</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">泅犁惑怕</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="808285" height="1"></td>
            </tr>

            <c:set var="i" value="0" />
            <c:forEach var="product" items= "${list}">
            	<c:set var="i" value="${i+1}"/>
				<tr class="ct_list_pop">
	               <td align="center">${i}</td>
	               <td></td>
	               <td align="left">
	               	  	<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}&tranCode=${product.proTranCode}">${product.prodName}</a>
	               </td>
	               <td></td>
	               <td align="left">${product.price}</td>
	               <td></td>
	               <td align="left">${product.regDate}</td>
	               <td></td>
	               <c:choose>
	               		<c:when test="${empty product.proTranCode}">
	               			<td align="left">魄概吝</td>
	               		</c:when>
	               		<c:otherwise>
	               			<c:choose>
	               				<c:when test="${user.role == 'admin'}">
	               					<c:if test="${product.proTranCode == '1'}">
	               						<c:choose>
	               							<c:when test="${param.menu == 'manage'}">
	               								<td align="left">备概肯丰 <a href='/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2'>硅价窍扁</a></td>
	               							</c:when>
	               							<c:otherwise>
	               								<td align="left">备概肯丰</td>
	               							</c:otherwise>
	               						</c:choose>
				               		</c:if>
				               		<c:if test="${product.proTranCode == '2'}">
				               			<td align="left">硅价吝</td>
				               		</c:if>
				               		<c:if test="${product.proTranCode == '3'}">
				               			<td align="left">硅价肯丰</td>
				               		</c:if>
	               				</c:when>
	               				<c:otherwise>
	               					<td align="left">犁绊绝澜</td>
	               				</c:otherwise>
	               			</c:choose>
	               		</c:otherwise>
	               </c:choose>
	               			
	               			
	            </tr>
	            <tr>
	               <td colspan="11" bgcolor="D6D7D6" height="1"></td>
	            </tr>
			</c:forEach>
         </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td align="center">
                  
                  <input type="hidden" id="currentPage" name="currentPage" value=""/>
              
				 <jsp:include page="../common/pageNavigator.jsp">
				 	<jsp:param value="fncGetProductList" name="page"/>
				 </jsp:include>
               </td>
            </tr>
         </table>
         <!--  其捞瘤 Navigator 场 -->
      </form>

   </div>
</body>
</html>