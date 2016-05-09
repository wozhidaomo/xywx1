<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../include/taglib.jsp" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>menu</title>
<link id="data-uikit-theme" rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/uikit.docs.min.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/docs.css" />
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/highlight.css" />
<script src=" <%=basePath%>REs/jquery-2.2.3.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/uikit.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/highlight.js"></script>
<script src=" <%=basePath%>REs/uk/js/docs.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".uk-navbar-nav>li>a").on("click", function() {
			$(".uk-navbar-nav>li").attr("class", "");
			$(this).parent().attr("class", "uk-active");

		});
	});

	function iFrameHeight() {
		var ifm = document.getElementById("iframepage");
		var subWeb = document.frames ? document.frames["iframepage"].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
			ifm.width = subWeb.body.scrollWidth;
		}
	}

	function showAlert(text) {

		UIkit.modal.alert(text);
	}

	function showConfirm(message, childFormId, formAction) {
		UIkit.modal.confirm(message, function() {
			content.window.callBack(formAction);
		});
	}
</script>

</head>
<body class="tm-background">
	<nav class="tm-navbar uk-navbar uk-navbar-attached">
		<div class="uk-container uk-container-center">
			<a class="uk-navbar-brand uk-hidden-small" href="#"></a>
			<ul class="uk-navbar-nav uk-hidden-small">
				<li class="uk-active"><a href="<%=basePath%>customer/list"
					target="content">用户管理</a></li>
				<li><a href="<%=basePath%>question/manaQuestion"
					target="content">题目管理</a></li>
				<li><a href="<%=basePath%>coach/list" target="content">教练管理</a></li>
				<li><a href="<%=basePath%>statistics/list" target="content">统计查询</a></li>
			</ul>
			<div class="uk-navbar-flip">
				你好：admin(管理员) <a href="updatepassword" target="content">修改密码</a>
			</div>
		</div>


	</nav>

	<div class="tm-middle">
		<div class="uk-container uk-container-center">
			<iframe src="<%=basePath%>customer/list" onload="iFrameHeight();"
				id="iframepage" name="content" style="width: 100%;" height="100%"
				scrolling="no"></iframe>
		</div>
	</div>


</body>
</html>