<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	          <!-- Tool Bar 를 다양하게 사용하면.... -->
	          <ul class="nav navbar-nav">
	        		    
	              <!--  회원관리 DrowDown -->
	              <c:if test="${!empty user}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >회원관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">개인정보조회</a></li>
		                         <c:if test="${sessionScope.user.role == 'admin'}">
		                         	<li class="divider"></li>
		                         	<li><a href="#">회원정보조회</a></li>
		                         </c:if>
		                     </ul>
		                 </li>
	              </c:if>  
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">판매상품관리</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	             <li class="dropdown">
	             	<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                	<span >상품관리</span>
	                    <span class="caret"></span>
	                </a>
	                <ul class="dropdown-menu">
	                	<li><a href="#">상 품 검 색</a></li>
	                    <li class="divider"></li>
	                    <c:if test="${sessionScope.user.role == 'user'}">
	                    	<li><a href="#">구매이력조회</a></li>
	                        <li class="divider"></li>
	                    </c:if>
	                    <c:if test="${empty user}">
	                    	<li><a href="#">비회원구매조회</a></li>
	                        <li class="divider"></li>
	                    </c:if>
	                        <li><a href="#">최근본상품</a></li>
	                </ul>
	             </li>
	          </ul>
	          
	          <ul class="nav navbar-nav navbar-right">
		          <c:choose>
		          	<c:when test="${!empty user}">
		          		<c:if test="${user.role == 'user'}">
		          			<li><a href="#">장바구니</a></li>
		          		</c:if>
			        	<li><a href="#">로그아웃</a></li>
		          	</c:when>
		          	<c:otherwise>
			        	<li><a href="#">로그인</a></li>
		          	</c:otherwise>
		          </c:choose>
	          </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
			
		 	$("a:contains('로그인')").on("click" , function() {
				$(self.location).attr("href","/user/login");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		//============= 상품 Event 처리 ===============
		$(function() {
			$("a:contains('판매상품등록')").click(function() {
				$(self.location).attr("href","../product/addProductView.jsp");
			});
			
			$("a:contains('판매상품관리')").click(function() {
				$(self.location).attr("href","/product/listProduct?menu=manage");
			});
			
			$("a:contains('상 품 검 색')").click(function() {
				$(self.location).attr("href","/product/listProduct?menu=search");
			});
			
			$("a[href='#']:contains('비회원구매조회')").on("click" , function() {
				self.location = "../guest.jsp"
			});
			
			$("a[href='#']:contains('구매이력조회')").on("click", function(){
				self.location = "/purchase/listPurchase";
			});
			
			$("a:contains('장바구니')").click(function() {
				location.href="/cart/getCartList?userId=${user.userId}";
			});
		});
		
	</script>  