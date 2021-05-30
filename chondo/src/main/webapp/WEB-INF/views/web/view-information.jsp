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
<title>Xem thông tin</title>
<link rel="stylesheet" href="<c:url value='/template/web/css/register.css'/>">
</head>
<body>

	<div class="container" style="width: 50%; padding: 50px 0px 100px 0px;">
		<h2 style="text-align: center;">XEM THÔNG TIN</h2>
		<div class="register-form">
			<div class="main-div">
				<div id="message" class="alert alert-danger"style="width: 50%;margin: auto;display:none;"></div>	
				<form:form id="formSubmit" modelAttribute="model"
					cssStyle="width:50%;margin:auto;">
					<form:input path="id" type="hidden"/>
					<form:input path="groupId" type="hidden"/>
					<form:input path="status" type="hidden"/>
					<form:input path="username" type="hidden"/>
					<form:input path="email" type="hidden" />
					<p style="margin-bottom:5px;">Họ và tên</p>
					<form:input path="fullname" placeholder="Họ và tên" required="required"/>
					<p style="margin-bottom:5px;">Số điện thoại</p>
					<form:input path="phone" placeholder="Số điện thoại" required="required"/>
					<p style="margin-bottom:5px;">Giới tính</p>
					<form:select path="gender" required="required">
						<form:option value="">--Chọn giới tính--</form:option>
						<form:option value="male">Nam</form:option>
						<form:option value="female">Nữ</form:option>
						<form:option value="other">Khác</form:option>
					</form:select>
					<p style="margin-bottom:5px;">Ngày sinh</p>
					<form:input type="date" path="birthday" required="required"/>
					<p style="margin-bottom:5px;">Địa chỉ</p>
					<form:input path="address" placeholder="Địa chỉ" required="required"/>
					<input type="password" id="password" name = "password" placeholder="Nhập mật khẩu để xác nhận" required="required"/>
					<button id="btnRegister">Cập nhật</button>
				</form:form>
				
			</div>
		</div>
	</div>

	<script>
		$(window).ready(function (){
			console.log("dd");
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