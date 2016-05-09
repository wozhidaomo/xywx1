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
	function disableQuestion(id,thisButton){
		var state=$(thisButton).parents("tr").find("td").eq(2).text().trim();
		$.ajax({
			type:"post",
			async: false,
			url:"disableCoach",
			data:{'id':id},
			success:function(data){
				if(data=="success"){
					if(data=="success"){
						if(state=="启用"){
							$(thisButton).parents("tr").find("td").eq(2).text("禁用");
							$(thisButton).text("启用");
						}else if(state=="禁用"){
							$(thisButton).parents("tr").find("td").eq(2).text("启用");
							$(thisButton).text("禁用");
						}
							parent.showAlert("操作成功！");
					}else if(data=="fail"){
							parent.showAlert("操作失败！");
					}
				}else{
					
				}
			}
		})
		
	}
	
	
	function delCoach(id){
		$("input[name='id']").val(id);
		var action="<%=basePath%>/coach/deleteCoach";
		parent.showConfirm("你确定删除吗？","coachForm",action);
		
	}
	
	function callBack(formAction){
		$("#coachForm").attr("action",formAction);
	    $("#coachForm").submit();
		
	}
	
</script>
</head>
<body>
	<form action="list" class="uk-form" name="pageForm" id="coachForm">
		<input type="hidden" value="${currentPage }" name="pageNo"> <input
			type="hidden" value="" name="id">
		<fieldset data-uk-margin>
			<div class="uk-form-select uk-button uk-active uk-width-1-10"
				data-uk-form-select>
				<span>请选择状态</span> <i class="uk-icon-caret-down"></i> <select
					name="state">
					<option value="" <c:if test="${coach.state == ''}">selected</c:if>>请选择状态</option>
					<option value="0"
						<c:if test="${coach.state == '0'}">selected</c:if>>启用</option>
					<option value="1"
						<c:if test="${coach.state == '1'}">selected</c:if>>禁用</option>
				</select>
			</div>
			<input class="uk-margin-small-top" type="text" placeholder="姓名"
				name="name" value="${coach.name }">
			<button class="uk-button">搜索</button>
			<a href="createCoach"
				class="uk-icon-justify uk-icon-plus uk-icon-medium "></a>
		</fieldset>

		<table class="uk-table .uk-table-hover .uk-table-striped">
			<thead>
				<tr>
					<th>序号</th>
					<th>教练姓名</th>
					<th>状态</th>
					<th>最后操作时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="coach" items="${coachs }" varStatus="c">
					<tr>
						<td>${c.index+1 }</td>
						<td>${coach.name }</td>
						<td id="abc"><c:if test="${coach.state==1 }">禁用</c:if> <c:if
								test="${coach.state==0 }">启用</c:if></td>
						<td><fmt:formatDate value="${coach.optime }"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>
							<div class="uk-button-group">
								<a class="uk-button uk-button-primary"
									href="editCoach?id=${coach.id }">编辑</a> <a
									class="uk-button uk-button-primary" href="#"
									onclick="disableQuestion(${coach.id },this)"> <c:if
										test="${coach.state==0 }">禁用</c:if> <c:if
										test="${coach.state==1 || (coach.state!=0 && coach.state!=1)}">启用</c:if>
								</a> <a class="uk-button uk-button-danger" href="#"
									onclick="delCoach(${coach.id })">删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
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