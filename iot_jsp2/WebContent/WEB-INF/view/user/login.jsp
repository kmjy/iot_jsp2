<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>

<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<div class="container">
		<div class="row">

			<form class="form-signin">
				<h2 id="hText2" class="form-signin-heading">로그인</h2>

				<label for="userId" class="sr-only">ID</label> 
				<input type="text" id="userId" name="userId" class="form-control" placeholder="ID" style="text-align:center" autofocus> 
				<label for="userPwd" class="sr-only">Password</label>
				<input type="password" id="userPwd" name="userPwd"
					class="form-control" placeholder="Password" style="text-align:center">

				<div style="text-align: right">
					<input class="btn btn-lg btn-primary btn-block" type="button"
						id="loginBtn" value="Login" onclick="checkValue()"> <input
						type="checkbox" id='saveId'> 아이디저장
				</div>
				<div style="text-align: right">
					<a href="/view/user/signin">회원가입</a>
				</div>
			</form>
		</div>
	</div>
</body>
<script>

function checkValue(){
	var objs = $(".container");
	var userId = $("#userId").val().trim();
	var userPwd = $("#userPwd").val().trim();
	var saveId =  $("#saveId").val().trim();
	if(userId.length<3){
		alert("유저아이디 확인해!!");
		$("#userId").focus();
		return;
	}
	if(userPwd.length<3){
		alert("비밀번호 확인해!!");
		$("#userPwd").focus();
		return;
	}
	var param = {uiId:userId, uiPwd:userPwd, saveId:saveId};
	
	param = "param=" + encodeURIComponent(JSON.stringify(param));
	$.ajax({
		url : '<%=rootPath%>/user/login',
		data : param,
		type :'get',
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.login=="ok"){
				location.href="<%=rootPath%>/";
				}
			}
		})
	}

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}

	$(document).ready(function() {
		var userId = getCookie("userId");
		var saveId = getCookie("saveId");
		if (userId) {
			$("#userId").val(userId);
			$("#saveId").prop("checked", true);
		}
	});
</script>
</html>