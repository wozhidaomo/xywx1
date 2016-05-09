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
	href=" <%=basePath%>REs/uk/css/uikit.docs.min.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/docs.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/highlight.css" />
<script src=" <%=basePath%>REs/jquery-2.2.3.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/uikit.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/highlight.js"></script>
<script src=" <%=basePath%>REs/uk/js/docs.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 测试列表 -->
<table class="uk-table .uk-table-hover .uk-table-striped">
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
            <td><a href="<%=basePath%>/test/customerTestDetail?id=${test.id}" class="uk-button" target="_parent">测试详情</a></td>
        </tr>
        </c:forEach>
    </tbody>
    <tfoot>
			<tr>
			<td colspan="10">
					<ul class="uk-pagination uk-pagination-right"
						data-uk-pagination="{items:${totalPage }, itemsOnPage:10,currentPage:${currentPage-1 }}"></ul>
			</td>
			</tr>
			</tfoot>
</table>
</body>
</html>