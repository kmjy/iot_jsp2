<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />	
	<div class="container">
		<div class="row">

			<div class="col-md-10 col-md-offset-1">

				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-6">
								<h3 class="panel-title">사용자 리스트</h3>
							</div>
							<div class="col col-xs-6 text-right">
								<input type="text" class="input">
								<button type="button" class="btn btn-sm btn-primary btn-create">검색</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table id="grid1" data-key="uiNo" class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th class="text-center" data-field="uiNo,ro">번호</th>
									<th class="text-center" data-field="uiName,txt">이름</th>
									<th class="text-center" data-field="uiAge,txt">나이</th>
									<th class="text-center" data-field="uiId,ro">ID</th>
									<th class="text-center" data-field="uiRegdate,ro">가입일자</th>
									<th class="text-center" data-field="address,txt">주소</th>									
									<th class="text-center" data-field="BTN"><em class="glyphicon glyphicon-asterisk"></em></th>
								</tr>
							</thead>
							<tbody id="result_tb">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script> 
function updateUser(uiNo){
	var uiName = $("#uiName" + uiNo).val().trim();
	var uiAge = $("#uiAge" + uiNo).val().trim();
	var address = $("#address" + uiNo).val().trim();
	var param = {uiNo:uiNo, uiName:uiName, uiAge:uiAge, address:address};
	param = "param=" + JSON.stringify(param);

	$.ajax({
		url : '/user/update',
		type : 'post',
		data : param,
		dataType:"json",
		success:function(res){
			alert(res.msg);
			if(res.result =="ok"){
				location.reload();
			}
		},
		error:function(xhr,status,error){
		
		}
	})
}
function deleteUser(uiNo){
	var isDelete = confirm("진짜지우게?");
	var param ="uiNo=" + uiNo;
	alert(isDelete);
	if(isDelete){
		$.ajax({
			url : '/user/delete',
			type : 'post',
			data : param,
			dataType:"json",
			success:function(res){
				alert(res.msg);
				if(res.result =="ok"){
					location.reload();
				}
			},
			error:function(xhr,status,error){
			
			}
		})
		
	}
}

var colsInfo= [];      //Array()  요거야
$(document).ready(function(){
	var colList = $("#grid1 th[data-field]"); // #는     id=grid1일때 th[data-field] 값을 가져온다 
	for(var i=0; i<colList.length;i++){
		colsInfo.push(colList[i].getAttribute("data-field"));   //colsInfo[colsInfo.length] 라고 예전에는 권고 사항으로 썻다
		console.log(colsInfo[i]);
	}
	console.log($("#grid1").attr("data-key"));
	var keyCol = $("#grid1").attr("data-key");    //jquery 라서 attr 쓸수있는거다 
	
	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list){				
				var key =uc[keyCol];
				str +="<tr>";
				for(var field of colsInfo){
					str += "<td class='text-center' >";
					if(field =="BTN"){
						str += '<a class="btn btn-default" onclick="updateUser(' +key+ ')"><em class="glyphicon glyphicon-refresh"></em></a>';      //버튼생성
						str += '<a class="btn btn-danger" onclick="deleteUser(' +key+ ')"><em class="glyphicon glyphicon-trash"></em></a>';
						
				}else{
					var colName = field.split(",")[0];
					var colType = field.split(",")[1];
				if(colType=="ro"){
					str += uc[colName];
				}else{
					str += "<input type ='text' id='" + colName + key + "' value='" + uc[colName]+ "'  style='text-align:center '>"; 
				}
					
					
					}
					str += "</td>";
				}
				str += "</tr>";
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
</html>