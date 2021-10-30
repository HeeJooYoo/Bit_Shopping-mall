<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function funGuest() {
		if (confirm("��ȸ���Դϴ�. �����Ͻðڽ��ϱ�?")) {
			/* location.href="/purchase/addPurchase?prod_no="+${product.prodNo}; */
			self.location="/purchase/addPurchase?prod_no="+${product.prodNo};
		}
	}
	
	$(function() {
		if (${param.menu != "ok"}) {
			$($(".ct_btn01")[1]).text("����");
		} 
		
		$(".ct_btn01:contains('����')").click(function(){
			window.history.back();
		});
		
		$(".ct_btn01:contains('Ȯ��')").click(function(){
			self.location="/product/listProduct?menu=manage";
		});
		
		$(".ct_btn01:contains('����')").click(function(){
			if (${!empty user}) {
				self.location="/purchase/addPurchase?prod_no=${product.prodNo}";				
			} else {
				funGuest();
			}
		});
		
		$("form").attr("method", "POST");
	});
</script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">
<div style="width: 98%; margin-left: 10px;">
<!-- <form name="detailForm" method="post"> -->
<form>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${sessionScope.product.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getProdName() %></td> --%>
		<td class="ct_write01">${sessionScope.product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<img src = "/images/uploadFiles/${sessionScope.product.fileName}"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getProdDetail() %></td> --%>
		<td class="ct_write01">${sessionScope.product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getManuDate() %></td> --%>
		<td class="ct_write01">${sessionScope.product.manuDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getPrice() %></td> --%>
		<td class="ct_write01">${sessionScope.product.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getRegDate() %></td> --%>
		<td class="ct_write01">${sessionScope.product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<c:if test="${param.menu != 'ok' && empty tranCode}">
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">	
					<%-- <c:choose>
						<c:when test="${!empty user}">
							<a href="/purchase/addPurchase?prod_no=${product.prodNo}">����</a>								
						</c:when>
						<c:otherwise>
							<a href="javascript:funGuest()">����</a>
						</c:otherwise>
					</c:choose> --%>
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
					<td width="30"></td>
				</c:if>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<%-- <c:choose>
						    <c:when test="${param.menu != 'ok'}">
						        <!-- <a href="javascript:history.go(-1)">����</a> -->
						        ����
						    </c:when>
						    <c:otherwise>
						        <!-- <a href="/product/listProduct?menu=manage">Ȯ��</a> -->
						        Ȯ��
						    </c:otherwise>
						</c:choose> --%>
						Ȯ��
					</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>