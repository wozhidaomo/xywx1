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
<script src=" <%=basePath%>REs/ajaxfileupload.js"></script>
<script src=" <%=basePath%>REs/validatedist/jquery.validate.js"></script>

<script type="text/javascript">

function fileupload(){  
    if($("#faceImg").val()==""){  
        alert("上传文件不能为空!");  
        return false;  
    }  
    $.ajaxFileUpload({  
            url:"saveFaceImg",  
            secureuri:false,  
            dataType: 'text/html;charset=UTF-8',//返回数据的类型
            fileElementId:'faceImg',  
            success: function (data) {  
            	$("img[class='uk-thumbnail']").attr("src","<%=basePath%>attachment/temp/"+data);
            },error: function (data, status, e){  
                parent.showAlert("上传失败！");
            }  
        }  
    );  
}  


$().ready(function(){
	$.validator.setDefaults({
	    submitHandler: function() {
	      $("#coachForm").submit();
	    }
	});
	
	$("#coachForm").validate({
		rules: {
			name:"required",
			describe:"required",
			detaillink:{
				required:true,
				url:true
			}
			
		},
		errorClass:"uk-form-danger",
		success:"uk-form-success",
		messages: {
			name:"请填写教练姓名",
			describe:"请填写教练简介",
			detaillink:{
				required:"请填写详情链接",
				url:"请填写一个合法的链接"
				
			}
			
		}
		
	})
	
});

</script>
</head>
<body>
<form action="saveEdit" class="uk-form" name="pageForm" method="post" id="coachForm" enctype="multipart/form-data">
<input type="hidden" name="id" value="${coach.id }" />
 <legend>修改教练</legend>
<dl class="">
<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">教练姓名：</div>
    <div class="uk-width-1-2">
    <input class="uk-form-width-medium" type="text" placeholder="姓名" name="name" value="${coach.name }" required>
    </div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">教练头像：</div>
    <div class="uk-width-1-10 uk-form-file">
    <a class="uk-thumbnail" href="javascript:void(0)">
    <img class="uk-thumbnail" src="<%=basePath%>attachment/${attachment.location}" alt="头像">
    <div class="uk-thumbnail-caption">点击进行更换</div>
	</a>
    <input type="file" id="faceImg" onchange="fileupload()" name="faceImg" >
    </div>
    
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">教练简介：</div>
    <div class="uk-width-1-2">
    <textarea cols="30" rows="10" placeholder="教练简介" name="describe" required>${coach.describe }</textarea>
    </div>
</div>
</dt>

<dt>
<div class="uk-grid">
    <div class="uk-width-1-10">教练详情链接：</div>
    <div class="uk-width-1-2">
    <input class=" uk-form-width-medium" type="text" placeholder="教练详情" name="detaillink" value="${coach.detaillink }" required>
    </div>
</div>

<div class="uk-grid">
    <div class="uk-button-group">
        						<button class="uk-button uk-button-primary" type="submit">保存</button>
								<a class="uk-button uk-button-primary" href="javascript:history.go(-1)">返回</a>
							</div>
</div>
</dt>

</dl>
</form>
</body>
</html>