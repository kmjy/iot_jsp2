<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

function signIn(){
	var uiName = $("#uiName").val().trim();
	var uiAge = $("#uiAge").val().trim();
	var uiId = $("#uiId").val().trim();
	var uiPwd = $("#uiPwd").val().trim();
	var ciNo = $("#ciNo").val().trim();
	var address = $("#address").val().trim();
	var param={uiName:uiName, uiAge:uiAge, uiId:uiId, uiPwd:uiPwd, ciNo:ciNo, address:address};
	
	param = "param="+ JSON.stringify(param);
	
	
	$.ajax({		
		url :"/user/signin",
		type : "post",
		data : param,
		success : function(res) {			
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result == "ok"){
				location.href = "<%=rootPath%>/";
			}
		}
	})
	
	
}


		

	$(document).ready(function() {
		$.ajax({
			url : '/class/list',
			type : "get",
			success : function(res) {
				var objs = JSON.parse(res);
				var s = document.getElementById("ciNo").innerHTML ;
				for( var obj of objs ){
					s += "<option value='"+obj.ciNo+"'>"+obj.ciName+"</option>"; 
				}
				$("#ciNo").html(s);
			},
			error : function(xhr, status, error) {

			}
		})
	});
</script>
<body>

	<jsp:include page="/WEB-INF/view/common/header.jsp" flush="false" />

	<div class="container">
		<table class="table">

			<tr>
				<th>이름</th>
				<td><input type="text" id="uiName" name="uiName"
					class="form-control" placeholder="이름" autofocus>
			</tr>

			<tr>
				<th>나이</th>
				<td><input type="text" id="uiAge" name="uiAge"
					class="form-control" placeholder="나이">
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" id="uiId" name="uiId"
					class="form-control" placeholder="아이디">
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="uiPwd" name="uiPwd"
					class="form-control" placeholder="비밀번호">
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address"
					class="form-control" placeholder="주소">
			</tr>

			<tr>
				<th>시간</th>
				<td><input type="text" id="address" name="address"
					class="form-control" placeholder="주소">
			</tr>

			<tr>
				<th>반</th>
				<td><select name="ciNo" id="ciNo">



				</select></td>

			</tr>


			<tr>
				<td colspan="2"><input class="btn btn-lg btn-primary btn-block"
					type="button" id="signIn" value="signIn" onclick="signIn()">
				</td>
			</tr>



		</table>
		<a href="/view/user/signin">회원가입</a>
	</div>
</body>
</html>