<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.chondo.util.SecurityUtils" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="userAPI" value="/api/user" />
<c:url var="login" value="/dang-nhap" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đổi thông tin</title>
<link rel="stylesheet" href="<c:url value='/template/web/css/register.css'/>">
</head>
<body>
	<div class="container" style="width: 50%; padding: 50px 0px 100px 0px;">
		<h2 style="text-align: center;">THAY ĐỔI THÔNG TIN</h2>
		<div class="register-form">
			<div class="main-div">
				<div id="message" class="alert alert-danger"style="width: 50%;margin: auto;display:none;"></div>	
				<form:form id="formSubmit" modelAttribute="model"
					cssStyle="width:50%;margin:auto;">
					<button id="btnChange" style="margin:10px 0px;">Chỉnh sửa </button>
					<form:input path="id" type="hidden"/>
					<form:input path="groupId" type="hidden"/>
					<form:input path="status" type="hidden"/>
					<form:input path="username" type="hidden"/>
					<form:input path="email" type="hidden" />
					<p style="margin-bottom:5px;">Họ và tên</p>
					<form:input path="fullname" placeholder="Họ và tên" />
					<p style="margin-bottom:5px;">Số điện thoại</p>
					<form:input path="phone" placeholder="Số điện thoại" />
					<p style="margin-bottom:5px;">Giới tính</p>
					<form:select path="gender" id="gender">
						<form:option value="">--Chọn giới tính--</form:option>
						<form:option value="male">Nam</form:option>
						<form:option value="female">Nữ</form:option>
						<form:option value="other">Khác</form:option>
					</form:select>
					<p style="margin-bottom:5px;">Ngày sinh</p>
					<form:input type="date" path="birthday" />
					<p style="margin-bottom:5px;">Địa chỉ</p>
					<form:input path="address" placeholder="Địa chỉ" />
					<input type="password" id="password" name = "password" placeholder="Nhập mật khẩu để xác nhận" />
					<button id="btnRegister">Cập nhật</button>
				</form:form>
				
			</div>
		</div>
	</div>

	<script>
		$(window).ready(function (){
			$('input').prop( "disabled", true);
			$('#gender').prop( "disabled", true);
			$('input#password').css("display","none");
			$('#btnRegister').css("display","none");
			$('#btnChange').on('click', function(event) {
				event.preventDefault();
				$('input').prop( "disabled", false);
				$('#gender').prop( "disabled", false);
				$('input#password').css("display","block");
				$('#btnRegister').css("display","block");
				$('#btnChange').css("display","none");
			})
			$('#btnRegister').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				register(data);
				
			});
			function register(data) {
				$.ajax({
					url : '${userAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
					},
					error : function(error) {
						alert("Thay đổi thông tin thất bại");
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