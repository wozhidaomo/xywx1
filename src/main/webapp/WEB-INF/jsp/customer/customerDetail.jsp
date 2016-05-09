<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../include/taglib.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>customerDetail</title>
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/uikit.min.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/uikit.docs.min.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/docs.css" />
<script src=" <%=basePath%>REs/jquery-2.2.3.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/uikit.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/highlight.js"></script>
<script src=" <%=basePath%>REs/uk/js/docs.js"></script>
<script src=" <%=basePath%>REs/uk/js/components/pagination.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			$('[data-uk-pagination]').on('select.uk.pagination',
					function(e, pageIndex) {

						$("input[name='pageNo']").val(pageIndex + 1);
						$(".uk-form").submit();
					});

		});
		
</script>
</head>
<body>
<nav class="uk-navbar">
    <ul class="uk-navbar-nav ">
        <li><a href="list" class="uk-vertical-align"><i class="uk-icon-chevron-left uk-icon-medium uk-vertical-align-middle"></i></a></li>
    </ul>
</nav>
<dl class="uk-description-list-line">
<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">用户名：</div>
    <div class="uk-width-1-10">${customer.name } </div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">用户来源：</div>
    <div class="uk-width-1-10">${customer.origin }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">openid：</div>
    <div class="uk-width-1-10">${customer.openid }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">创建时间：</div>
    <div class="uk-width-1-10">${customer.createtime }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">性别：</div>
    <div class="uk-width-1-10">${customer.gender }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">年龄：</div>
    <div class="uk-width-1-10">${customer.age }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">职业：</div>
    <div class="uk-width-1-10">${customer.career }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">地区：</div>
    <div class="uk-width-1-10">${customer.place }</div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">头像：</div>
    <div class="uk-width-1-10"><img class="uk-thumbnail" src="<%=basePath%>attachment/${attachment.location}" alt="头像"></div>
</div>
</dt>

<form action="detail" class="uk-form" name="pageForm">
<!-- 测试列表 -->
<table class="uk-table .uk-table-hover .uk-table-striped">
<input type="hidden" value="${currentPage }" name="pageNo">
<input type="hidden" value="${id }" name="id">
    <caption>用户相关测试</caption>
    <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>openid</th>
            <th>测试时间</th>
            <th>能量指数</th>
            <th>性别</th>
            <th>年龄</th>
            <th>职业</th>
            <th>地点</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="test" items="${tests }" varStatus="t">
        <tr>
            <td>${t.index+1 }</td>
            <td>${customer.name }</td>
            <td>${customer.openid }</td>
            <td><fmt:formatDate value="${test.testtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${test.energy }</td>
            <td>${customer.gender }</td>
            <td>${customer.age }</td>
            <td>${customer.career }</td>
            <td>${customer.place }</td>
            <td><a href="<%=basePath%>/test/customerTestDetail?cusname=${customer.name }&testtime=<fmt:formatDate value="${test.testtime }" pattern="yyyy-MM-dd HH:mm:ss"/>&score=${test.energy }&testid=${test.id}" class="uk-button">测试详情</a></td>
        </tr>
        </c:forEach>
    </tbody>
    <tfoot>
			<tr>
			<td colspan="10">
					<div class="uk-flex uk-flex-right uk-flex-middle uk-flex-space-between">
					<div>
					
					<div class="uk-form-select" data-uk-form-select="{target:'a'}" style="overflow:left;">
							<a></a> <select name="pagenum">
							<option value="">显示条数&nbsp;</option>
							<option value="10" <c:if test="${pagenum==10}">selected</c:if> >10</option>
							<option value="20" <c:if test="${pagenum==20}">selected</c:if>>20</option>
							<option value="50" <c:if test="${pagenum==50}">selected</c:if>>50</option>
							</select>
						</div>
					</div>
					
						<div>
						
						<ul class="uk-pagination uk-pagination-right"
							data-uk-pagination="{items:${totalPage }, itemsOnPage:${pagenum },currentPage:${currentPage-1 }}"></ul>
						</div>
					</div>
			</td>
			</tr>
			</tfoot>
</table>
</form>
</dl>
</body>
</html>