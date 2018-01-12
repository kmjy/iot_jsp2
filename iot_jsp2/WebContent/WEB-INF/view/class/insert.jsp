<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />

	<div class="container">
		<div class="starter-template">

			<form class="form-signin">
				<table class="table">
					<tr>
						
					<tr>
						<th>반이름</th>
						<td><input  type="text" id="ciName" name="ciName"
							class="form-control" placeholder="반이름"></td>
					</tr>
					<tr>
						<th>참조</th>
						<td><input  type="text" id="ciDesc" name="ciDesc"
							class="form-control" placeholder="참조"></td>
					</tr>
					
						<td colspan="2"> 
							<input class="btn btn-lg btn-primary btn-block" type="button"
								id="singnBtn" value="정보 등록" onclick="insert()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function insert(){
	
	
	var ciName = $("#ciName").val().trim();
	var ciDesc = $("#ciDesc").val().trim();
	
	var param= {ciName:ciName, ciDesc:ciDesc};
	param = "param=" + JSON.stringify(param);
	
	$.ajax({
		url : '/class/insert',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
			}
			location.href="/view/class/classlist";
		},
		error:function(xhr,status,error){
			
		}		
	})
}


</script>
</html>