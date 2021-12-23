
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="userAPI" value="/api/user" />\
<c:url var="confirmAPI" value="/api/sendCode" />
<c:url var="login" value="/dang-nhap" />
<c:url var="confirm" value="/xac-nhan-dang-ky" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đăng ký</title>
<link rel="stylesheet" href="<c:url value='/template/web/css/register.css'/>">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

</head>
<body>

	<div class="container" style="width: 50%; padding: 50px 0px 100px 0px;">
		<h2 style="text-align: center;">ĐĂNG KÝ</h2>
		<div class="register-form">
			<div class="main-div">
				<div id="message" class="alert alert-danger"style="width: 50%;margin: auto;display:none;"></div>	
				<form:form id="formSubmit" modelAttribute="model" action=""
					cssStyle="width:50%;margin:auto;">
					
					<form:input path="username" placeholder="Tên đăng nhập" />
					<form:input type="password" path="password" placeholder="Mật khẩu" />
					<input type="password" id="confirmPassword" name = "confirmPassword" placeholder="Nhập lại mật khẩu"  />
					<form:input path="fullname" placeholder="Họ và tên"  />
					<form:input path="phone" placeholder="Số điện thoại"  />
					<form:select path="gender"  >
						<form:option value="">--Chọn giới tính--</form:option>
						<form:option value="male">Nam</form:option>
						<form:option value="female">Nữ</form:option>
						<form:option value="other">Khác</form:option>
					</form:select>
					<input type="date" name="birthday" id="birthday" >
					<form:input path="address" placeholder="Địa chỉ" />
					<form:input path="email" placeholder="Địa chỉ email" />
					<button type= ""id="btnSendCode" style = "margin-bottom:20px; color:black">Gửi mã</button>
					<input id="code" placeholder="Nhập mã xác nhận" />
					<button type= ""id="btnRegister">Đăng ký</button>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$().ready(function (){
			var code = null;
			$('#btnSendCode').on('click', function(event) {
				alert("Kiem tra email de lay ma xac nhan!");
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				
				confirm(data);
				
			});
			
			$('#btnRegister').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				if (data["password"] == data["confirmPassword"]) {
					if ($('#code').val() == code) {
						data["groupId"] = 1;
						data["status"] = 1;
						console.log("reg");
						register(data);
					}
					else{
						alert("Ma xac nhan khong dung!");
					}
				} else{
					$('#message').css("display","block");
					$('#message').html("Mật khẩu nhập lại không trùng khớp !");
				}
				
			});
			
			function confirm(data) {
				$.ajax({
					url : '${confirmAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						code = result;
					},
					error : function(error) {
					}
				});
			}
			
			function register(data) {
				$.ajax({
					url : '${userAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Đăng ký thành công");
						window.location.href = '${login}';
					},
					error : function(error) {
						alert("Đăng ký thất bại");
						var myJSON = JSON.stringify(error);
						var obj = JSON.parse(myJSON);
						$('#message').css("display","block");
						$('#message').html(obj["responseJSON"].message);
					}
				});
			}
			

		 
	})
	</script>



</body>
</html>