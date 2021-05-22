<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="userAPI" value="/api/user"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng ký</title>

   
</head>
<body>
	<form:form id="formSubmit" modelAttribute="model" cssStyle="width:50%;margin:auto;">
		<form:input path="username" placeholder="Username"/>
		<form:input path="password" placeholder="pass"/>
		<form:input path="fullname" placeholder="full"/>
		<form:input path="email" placeholder="mail"/>
		<form:input path="phone" placeholder="phone"/>
		<form:select path="gender">
			<form:option value="">--Chọn giới tính--</form:option>
			<form:option value="male">Nam</form:option>
			<form:option value="female">Nữ</form:option>
			<form:option value="other">Khác</form:option>
		</form:select>
		<input type="date" name = "birthday" id = "birthday">
		<form:input path="address" placeholder="address"/>
		<button id="btnRegister">Đăng ký</button>
	</form:form>
		
	<script>
		$('#btnRegister').click(function (e) {
		    e.preventDefault();
		    var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    data["groupId"] = 1;
		    data["status"] = 1;
		   	register(data);
		});
		function register(data) {
			$.ajax({
	            url: '${userAPI}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	alert("thành công");
	            },
	            error: function (error) {
	            	alert("thất bại");
	            }
	        });
		}
	</script>
	
	

</body>
</html>