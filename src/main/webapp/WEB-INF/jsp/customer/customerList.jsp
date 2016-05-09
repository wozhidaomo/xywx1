<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../include/taglib.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>customers</title>

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
<script src=" <%=basePath%>REs/uk/js/components/datepicker.js"></script>
<script src=" <%=basePath%>REs/uk/js/components/form-select.js"></script>
<script src=" <%=basePath%>REs/uk/css/components/datepicker.css"></script>
<script src=" <%=basePath%>REs/uk/css/components/form-select.css"></script>
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
	<form action="list" class="uk-form" name="pageForm">
		<input type="hidden" value="${currentPage }" name="pageNo">

		<fieldset data-uk-margin>
			<div class="uk-form-select uk-button uk-active uk-width-1-10" data-uk-form-select>
					<span>请选择性别</span> 
					<i class="uk-icon-caret-down"></i>
					<select name="gender" >
					<option value="">请选择性别</option>
					<option value="2" <c:if test="${customer.gender == 2}">selected</c:if> >男</option>
					<option value="1" <c:if test="${customer.gender == 1}">selected</c:if> >女</option>
				</select>
				</div>
			<input class="uk-margin-small-top" type="text" placeholder="年龄" name="age" value="${customer.age }"> 
			<input class="uk-margin-small-top" type="text" placeholder="职业" name="career" value="${customer.career }"> 
			<input class="uk-margin-small-top" type="text" placeholder="地区" name="place" value="${customer.place }"> 
			<input class="uk-margin-small-top" type="text" placeholder="用户名" name="name" value="${customer.name }"> 
			<button class="uk-button">搜索</button>
		</fieldset>

		<table class="uk-table .uk-table-hover .uk-table-striped">
			<thead>
				<tr>
					<th>序号</th>
					<th>用户来源</th>
					<th>用户昵称</th>
					<th>openid</th>
					<th>创建时间</th>
					<th>性别</th>
					<th>年龄</th>
					<th>职业</th>
					<th>地点</th>
					<th>测试次数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customers }" varStatus="c">
					<tr>
						<td>${c.index+1 }</td>
						<td>${customer.origin }</td>
						<td>${customer.name }</td>
						<td>${customer.openid }</td>
						<td>${customer.createtime }</td>
						<td>
						<c:if test="${customer.gender == 2}">男</c:if>
						<c:if test="${customer.gender == 1}">女</c:if>
						</td>
						<td>${customer.age }</td>
						<td>${customer.career }</td>
						<td>${customer.place }</td>
						<td>${customer.testcount }</td>
						<td><a href="detail?id=${customer.id }" class="uk-button">详情</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="11">
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
</body>
</html>