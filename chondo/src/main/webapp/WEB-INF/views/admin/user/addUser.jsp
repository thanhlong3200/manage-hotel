<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="userAPI" value="/api/user" />
<c:url var="userDetails" value="/quan-tri/nguoi-dung/danh-sach" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Người dùng</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script>
</head>
<body>
	<c:if test="${empty model.id}">
		<h3>Thêm người dùng</h3>
	</c:if>

	<div id="message" class="alert alert-danger"style="width: 50%;margin: auto;display:none;"></div>
	<form:form id="formSubmit" modelAttribute="model" action="" cssStyle="width:50%;padding-bottom:50px;margin-left:35%;">		
										
					<form:hidden path="id"/>
					
					<label style="margin-top:5px;">Tên đăng nhập</label>
					<form:input path="username" placeholder="Tên đăng nhập" />
					<label style="color:red;" class="error" for="username"></label>	
				
					<c:if test="${empty model.id}">
					
						<label style="margin-top:5px;">Mật khẩu</label>
						<form:input type="password" path="password" placeholder="Mật khẩu" />
						<label style="color:red;" class="error" for="password"></label>	
						
						<label style="margin-top:5px;">Nhập lại mật khẩu</label>
						<input type="password" id="confirmPassword" name = "confirmPassword" placeholder="Nhập lại mật khẩu"  />
						<label style="color:red;" class="error" for="confirmPassword"></label>	
					</c:if>
					
					<c:if test="${not empty model.id}">
					
						<label style="margin-top:5px;">Mật khẩu</label>
						<form:input type="password" path="password" placeholder="Mật khẩu" />
						<label style="color:red;" class="error" for="password"></label>	
						
					</c:if>
					
					<label style="margin-top:5px;">Họ tên</label>
					<form:input path="fullname" placeholder="Họ và tên"  />
					<label style="color:red;" class="error" for="fullname"></label>	
					
					<label>Email</label>
					<form:input path="email" placeholder="Địa chỉ email" />
					<label style="color:red;" class="error" for="email"></label>	
					
					<label style="margin-top:5px;">Số điện thoại</label>
					<form:input path="phone" placeholder="Số điện thoại"  />
					<label style="color:red;" class="error" for="phone"></label>	
					
					<form:select path="gender"  style="margin-top:5px;" >
						<form:option value="">--Chọn giới tính--</form:option>
						<form:option value="male">Nam</form:option>
						<form:option value="female">Nữ</form:option>
						<form:option value="other">Khác</form:option>
					</form:select>
					<label style="color:red;" class="error" for="gender"></label>	
					
					<label style="margin-top:5px;">Ngày sinh</label>
					<input type="date" value="${model.birthday}"name="birthday" id="birthday" >
					<label style="color:red;" class="error" for="birthday"></label>	
					
					<label style="margin-top:5px;">Địa chỉ</label>
					<form:input path="address" placeholder="Địa chỉ" />
					<label style="color:red;" class="error" for="address"></label>	
					
					<form:select path="groupId"  style="margin-top:5px;" >
						<form:option value="">--Chọn vai trò--</form:option>
						<form:options items="${groups}" itemValue="id" itemLabel="name"/>
					</form:select>
					<label style="color:red;" class="error" for="group"></label>	
					
					<form:select path="status"  style="margin-top:5px;" >
						<form:option value="">--Chọn trạng thái--</form:option>
						<form:option value="1">Hoạt động</form:option>
						<form:option value="0">Ngừng hoạt động</form:option>
					</form:select>
					<label style="color:red;" class="error" for="gender"></label>	
					
					
					<c:if test="${empty model.id}">
						<button type= ""id="btnEdit">Thêm</button>
					</c:if>
					
					
				</form:form>

	<script src="<c:url value="/template/admin/js/register.js" />"></script>
	<script type="text/javascript">
	
	$('#btnEdit').on('click', function(event) {
		event.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		console.log(data);
		
		addRoomType(data);
		
	});
	
	function addRoomType(data) {
		$.ajax({
			url : '${userAPI}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				alert("Thành công");
				window.location.href = '${userDetails}';
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

	</script>
</body>
</html>