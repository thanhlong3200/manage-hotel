
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="userAPI" value="/api/user" />
<c:url var="login" value="/dang-nhap" />
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
					<form:input path="email" placeholder="Địa chỉ email" />
					<form:input path="phone" placeholder="Số điện thoại"  />
					<form:select path="gender"  >
						<form:option value="">--Chọn giới tính--</form:option>
						<form:option value="male">Nam</form:option>
						<form:option value="female">Nữ</form:option>
						<form:option value="other">Khác</form:option>
					</form:select>
					<input type="date" name="birthday" id="birthday" >
					<form:input path="address" placeholder="Địa chỉ" />
					<button type= ""id="btnRegister">Đăng ký</button>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$().ready(function (){
			console.log("aaaaaaa");
			
			$('#btnRegister').on('click', function(event) {
				console.log("dd");
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				if (data["password"] == data["confirmPassword"]) {
					data["groupId"] = 1;
					data["status"] = 1;
					register(data);
				} else{
					$('#message').css("display","block");
					$('#message').html("Mật khẩu nhập lại không trùng khớp !");
				}
				
			});
			function register(data) {
				$.ajax({
					url : '${userAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
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