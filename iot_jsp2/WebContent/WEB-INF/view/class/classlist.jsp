<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소속 정보</title>
</head>

<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />


<body>


<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />

<div class="result_div"></div>



	<div class="container">
	
		<div class="row">

			<div class="col-md-10 col-md-offset-1">

				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-6">
								<h3 class="panel-title">반 리스트</h3>
							</div>
							<div class="col col-xs-6 text-right">
								<button type="button" class="btn btn-sm btn-primary btn-create"  onclick='window.location.href="<%= rootPath %>/view/class/insert"'>새로운 반 등록 </button>
								
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table id="grid2" data-key="ciNo" class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th class="text-center" data-field="ciNo,ro">반번호</th>
									<th class="text-center" data-field="ciName,txt">반이름</th>
									<th class="text-center" data-field="ciDesc,txt">참조</th>
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
		<br>
		<br>
		<br>
		<br>
		

<script>


function updateClass(ciNo){
	var ciName = $("#ciName" + ciNo).val().trim();
	var ciDesc = $("#ciDesc" + ciNo).val().trim();
	var param = {ciNo:ciNo, ciName:ciName, ciDesc:ciDesc};
	
	param = "param=" + JSON.stringify(param);

	$.ajax({
		url : '/class/update',
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
function deleteClass(ciNo){
	var isDelete = confirm("진짜지우게?");
	var param ="ciNo=" + ciNo;
	alert(isDelete);
	if(isDelete){
		$.ajax({
			url : '/class/delete',
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

var colsInfo= [];     
$(document).ready(function(){
	var colList = $("#grid2 th[data-field]"); 
	for(var i=0; i<colList.length;i++){
		colsInfo.push(colList[i].getAttribute("data-field"));   
		console.log(colsInfo[i]);
	}
	console.log($("#grid2").attr("data-key"));
	var keyCol = $("#grid2").attr("data-key");   
	
	$.ajax({
		url : '/class/classlist',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var cc of list){				
				var key =cc[keyCol];
				str +="<tr>";
				for(var field of colsInfo){
					str += "<td class='text-center'>";
					if(field =="BTN"){
						str += '<a class="btn btn-default" onclick="updateClass(' +key+ ')"><em class="glyphicon glyphicon-refresh"></em></a>';    
						str += '<a class="btn btn-danger" onclick="deleteClass(' +key+ ')"><em class="glyphicon glyphicon-trash"></em></a>';
						
				}else{
					var colName = field.split(",")[0];
					var colType = field.split(",")[1];
				if(colType=="ro"){
					str += cc[colName];
				}else{
					str += "<input type ='text' id='" + colName + key + "' value='" + cc[colName]+ "' style='text-align:center ' >"; 
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