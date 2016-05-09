<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css"
	href=" <%=basePath%>REs/uk/css/components/form-password.css" />

<script src=" <%=basePath%>REs/jquery-2.2.3.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/uikit.min.js"></script>
<script src=" <%=basePath%>REs/uk/js/highlight.js"></script>
<script src=" <%=basePath%>REs/uk/js/docs.js"></script>
<script src=" <%=basePath%>REs/uk/js/components/form-password.js"></script>
<script src=" <%=basePath%>REs/validatedist/jquery.validate.js"></script>
<script type="text/javascript">
$().ready(function(){
	var message='${message}';
	if(message!=''){
		parent.showAlert(message);
		
	}
	
	$.validator.setDefaults({
	    submitHandler: function() {
	      $("#pageForm").submit();
	    }
	});
	
	$("#pageForm").validate({
		rules: {
			oldPass:"required",
			newPass:{
				required:true,
			},
			newPassConfirm:{
				required:true,
				equalTo:"#password"
			}
			
		},
		errorClass:"uk-form-danger",
		success:"uk-form-success",
		messages: {
			oldPass:"请填写旧密码",
			newPass:{
				required:"请填写新密码"
				
			},
			newPassConfirm:{
				required:"请在输入一次密码",
				equalTo:"请输入相同的密码"
			}
			
		}
		
	})
});
</script>
</head>
<body>
<form action="<%=basePath%>/MController/editpassword" class="uk-form" name="pageForm" method="post" id="pageForm" enctype="multipart/form-data">
<dl class="">
<dt>
 <legend>修改密码</legend>
<div class="uk-grid">
    <div class="uk-width-1-6">请输入旧密码：</div>
    <div class="uk-width-1-2">
    <div class="uk-form-password">
        <input type="password" placeholder="旧密码" name="oldPass"  value="">
    </div>
    </div>
</div>
</dt>
<dt>
<div class="uk-grid">
    <div class="uk-width-1-6">请输入新密码：</div>
    <div class="uk-width-1-2">
    <div class="uk-form-password">
        <input type="password" placeholder="新密码" name="newPass" id="password">
    </div>
    </div>
</div>
</dt>
<dt>
<div class="uk-grid">
    <div class="uk-width-1-6">再输一次新密码：</div>
    <div class="uk-width-1-2">
    <div class="uk-form-password">
        <input type="password" placeholder="新密码" name="newPassConfirm" id="passConfirm">
    </div>
    </div>
</div>
</dt>

<div class="uk-grid">
    <div class="uk-button-group">
        						<button class="uk-button uk-button-primary" type="submit">保存</button>
								<a class="uk-button uk-button-primary" href="javascript:history.go(-1)">返回</a>
							</div>
</div>

</dl>
</form>
</body>
</html>