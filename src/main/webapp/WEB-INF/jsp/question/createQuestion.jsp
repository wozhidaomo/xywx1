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
<script src=" <%=basePath%>REs/validatedist/jquery.validate.js"></script>

</head>
<body>
<form class="uk-form uk-form-horizontal" action="saveCreate" id="questionForm">
        <legend>新增题目</legend>
        
        
    <div class="uk-form-row">
    
        <label class="uk-form-label" for="title">题目标题</label>
        <div class="uk-form-controls">
        <input type="hidden" name="question.id" />
        <input class="uk-form-width-medium" type="text" placeholder="题目标题" id="title" 
				name="question.name" ">
        </div>
    </div>
    
    <div class="uk-form-row">
    <div class="uk-form-row">
        <label class="uk-form-label" for="min">最低分</label>
        <div class="uk-form-controls">
        <input type="hidden" name="topicoptions[0].id" >
        <input class="uk-margin-small-top" type="text" placeholder="最低分"   id="min"
				name="topicoptions[0].optionvalue" ">&nbsp;-
				<input class="uk-margin-small-top" type="text" placeholder="表征意义" 
				name="topicoptions[0].showmean" ">
        </div>
    </div>
    </div>
    
    
    <div class="uk-form-row">
        <label class="uk-form-label" for="max">最高分</label>
        <div class="uk-form-controls">
        <input type="hidden" name="topicoptions[1].id"  />
        <input class="uk-margin-small-top" type="text" placeholder="最高分"  id="max"
				name="topicoptions[1].optionvalue" >&nbsp;-
				<input class="uk-margin-small-top" type="text" placeholder="表征意义"  
				name="topicoptions[1].showmean" >
        </div>
    </div>
    
    <div class="uk-form-row">
        <div class="uk-button-group">
        						<button class="uk-button uk-button-primary" type="submit">保存</button>
								<a class="uk-button uk-button-primary" href="javascript:history.go(-1)">返回</a>
							</div>
    </div>
    
</form>
<script type="text/javascript">

$().ready(function() {
	
	$.validator.setDefaults({
	    submitHandler: function() {
	      $("#questionForm").submit();
	    }
	});
	
	$("#questionForm").validate({
		rules: {
			"question.name": "required",
			"topicoptions[0].optionvalue":{
				required: true,
				min: 1,
				max: 10,
				number: true
			},
			"topicoptions[0].showmean":{
				required:true
			},
			"topicoptions[1].optionvalue":{
				required: true,
				min: 1,
				max: 10,
				number: true,
				checkMaxValue:true
			},
			"topicoptions[1].showmean":{
				required:true
			}
		},
		errorClass:"uk-form-danger",
		success:"uk-form-success",
		messages: {
			"question.name": {
				required: "请输入题目标题",
			},
			"topicoptions[0].optionvalue":{
				required: "请输入最小值",
				min:"值的范围为1-10",
				max:"值的范围为1-10",
				number: "必须为数字"
			},
			"topicoptions[0].showmean":{
				required:"请输入表征意义"
			},
			"topicoptions[1].optionvalue":{
				required: "请输入最大值",
				min:"值的范围为1-10",
				max:"值的范围为1-10",
				number: "必须为数字"
			},
			"topicoptions[1].showmean":{
				required:"请输入表征意义"
			}
		}
		
	});
	
	$.validator.addMethod("checkMaxValue", function(value,element) {
        var min=$("#min").val();
      return this.optional(element) || value>= min;   
    }, $.validator.format("最高分需要高于最低分 "));
	
});
</script>
</body>
</html>