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
$().ready(function(){
	
	if (window != top) {
		
		top.location.href = location.href; 
		
	}
	
});
</script>


</head>
<body class="uk-height-1-1">

        <div class="uk-vertical-align uk-text-center uk-height-1-1" style="background-color:#252525">
            <div class="uk-vertical-align-middle" style="width: 250px;">

                <img class="uk-margin-bottom" width="140" height="120" src="<%=basePath%>REs/img/u17.png" alt="">

                <form class="uk-panel uk-panel-box uk-form" action="<%=basePath%>/MController/login" method="post">
                    <div class="uk-form-row">
                        <input class="uk-width-1-1 uk-form-large" type="text" placeholder="Username" name="loginname" required>
                    </div>
                    <div class="uk-form-row">
                        <input class="uk-width-1-1 uk-form-large" type="password" placeholder="Password" name="password" required>
                    </div>
                    <div class="uk-form-row">
                        <button class="uk-width-1-1 uk-button uk-button-primary uk-button-large" type="submit">Login</button>
                    </div>
                </form>

            </div>
        </div>

    </body>
</html>