<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../include/taglib.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<table class="uk-table .uk-table-hover .uk-table-striped">
			<input type="hidden" value="${currentPage }" name="pageNo">
			<fieldset data-uk-margin>
				<div class="uk-form-select uk-button uk-active uk-width-1-10" data-uk-form-select>
					<span>请选择性别</span> 
					<i class="uk-icon-caret-down"></i>
					<select name="gender" >
					<option value="">请选择性别</option>
					<option value="2" <c:if test="${statistic.gender == 2}">selected</c:if> >男</option>
					<option value="1" <c:if test="${statistic.gender == 1}">selected</c:if> >女</option>
				</select>
				</div>
				 <input class="uk-margin-small-top" type="text" placeholder="年龄"
					name="age" value="${statistic.age }"> <input
					class="uk-margin-small-top" type="text" placeholder="职业"
					name="career" value="${statistic.career }"> <input
					class="uk-margin-small-top" type="text" placeholder="地区"
					name="place" value="${statistic.place }"> <input
					class="uk-margin-small-top" type="text" placeholder="用户名"
					name="statisticName" value="${statistic.name }"> <input
					class="uk-margin-small-top" type="text" placeholder="开始时间"
					name="begintime" value="${statistic.begintime }"
					data-uk-datepicker="{format:'YYYY-MM-DD'}"> <input
					class="uk-margin-small-top" type="text" placeholder="结束时间"
					name="endtime" value="${statistic.endtime }"
					data-uk-datepicker="{format:'YYYY-MM-DD'}">
				<button class="uk-button" type="submit">搜索</button>
			</fieldset>
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
				<c:forEach var="s" items="${statistics }" varStatus="vs">
					<tr>
						<td>${vs.index+1 }</td>
						<td>${s.name }</td>
						<td>${s.openid }</td>
						<td><fmt:formatDate value="${s.testtime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${s.energy }</td>
						<td><c:if test="${s.gender == 2}">男</c:if> <c:if
								test="${s.gender == 1}">女</c:if></td>
						<td>${s.age }</td>
						<td>${s.career }</td>
						<td>${s.place }</td>
						<td><a
							href="<%=basePath%>/test/customerTestDetail?cusname=${s.name }&testtime=<fmt:formatDate value="${s.testtime }" pattern="yyyy-MM-dd HH:mm:ss"/>&score=${s.energy }&testid=${s.testid}"
							class="uk-button">测试详情</a></td>
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
</body>
</html>