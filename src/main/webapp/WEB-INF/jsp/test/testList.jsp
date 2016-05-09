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
<title>testDetails</title>
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
</head>
<body>
<nav class="uk-navbar">
    <ul class="uk-navbar-nav ">
        <li><a href="javascript:history.go(-1)" class="uk-vertical-align"><i class="uk-icon-chevron-left uk-icon-medium uk-vertical-align-middle"></i></a></li>
    </ul>
</nav>
<div class="uk-grid">
<div class="uk-width-3-10"><h2>测试用户:${cusname }</h2></div>
<div class="uk-width-3-10"><h2>总得分:${score }</h2></div>
<div class="uk-width-1-3"><h2>测试时间:${testtime }</h2></div>
</div>
<hr>
<table class="uk-table .uk-table-hover .uk-table-striped .uk-table-condensed" >	
    <thead>
        <tr>
            <th>题目序号</th>
            <th>题目id</th>
            <th>题目名称</th>
            <th>得分</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="testdetail" items="${testdetails }" varStatus="t">
        <tr>
            <td>${t.index }</td>
            <td>${testdetail.id }</td>
            <td>${testdetail.questionname }</td>
            <td>${testdetail.score }</td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>