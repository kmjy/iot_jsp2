<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<script>
function signin(){
	
	var uiName = $("#uiName").val().trim();
	var uiAge = $("#uiAge").val().trim();
	var uiId = $("#uiId").val().trim();
	var uiPwd = $("#uiPwd").val().trim();
	var ciNo = $("#ciNo").val();
	var address = $("#address").val().trim();
	var param= {uiName:uiName, uiAge:uiAge, uiId:uiId, uiPwd:uiPwd,ciNo:ciNo,address:address};
	param = "param=" + JSON.stringify(param);
	$.ajax({
		url : '/user/signin',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="/view/user/login";
			}
		},
		error:function(xhr,status,error){
			
		}		
	})
}
$(document).ready(function(){
	$.ajax({
		url : '/class/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str = "";
			for(var ci of list){
				str += "<option value='" + ci.ciNo + "'>" + ci.ciName +"</option>";
			}
			$("#ciNo").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
<body>
	<jsp:include page="/WEB-INF/view/common/header.jsp" flush="false" />
<br>
	<div class="container">
	    <div class="row">
	    
	        <div class="col-md-10 col-md-offset-1">
	
	            <div class="panel panel-default panel-table">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col col-xs-6">
	                    <h3 class="panel-title">User List</h3>
	                  </div>
	                  <div class="col col-xs-6 text-right">
	                  	<input type="text" class="input">
	                    <button type="button" class="btn btn-sm btn-primary btn-create">검색</button>
	                  </div>
	                </div>
	              </div>
	              <div class="panel-body">
	                <table class="table table-striped table-bordered table-list">
	                  	<thead>
		                    <tr>
		                        <th class="text-center">번호</th>
		                        <th class="text-center">이름</th>
		                        <th class="text-center">나이</th>
		                        <th class="text-center">ID</th>
		                        <th class="text-center">가입일자</th>
		                        <th class="text-center">주소</th>
		                        <th class="text-center"><em class="glyphicon glyphicon-asterisk"></em></th>
		                    </tr> 
	                  	</thead>
	                  	<tbody>
                        	<tr>
		                        <td class="text-center">번호</td>
		                        <td class="text-center">이름</td>
		                        <td class="text-center">나이</td>
		                        <td class="text-center">ID</td>
		                        <td class="text-center">가입일자</td>
		                        <td class="text-center">주소</td>
	                            <td align="center">
	                              <a class="btn btn-default"><em class="glyphicon glyphicon-refresh"></em></a>
	                              <a class="btn btn-danger"><em class="glyphicon glyphicon-trash"></em></a>
	                            </td>
                          	</tr>
						</tbody>
	                </table>
	              </div>
	            </div>
			</div>
		</div>
	</div>
</body>
</html>