<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết người dùng</title>
</head>
<body>
<a href="<c:url value='/quan-tri/nguoi-dung/chinh-sua?id=${user.id}'/>" style="font-size:24px;padding:0px 50px"><i class="fa fa-edit">Chỉnh sửa</i></a>
	<div class= "booking-details">
		<div class= "payments-information col-5">
			<h3>Người dùng</h3>
			<p>Tên: ${user.fullname}</p>
			<p>Email: ${user.email}</p>
			<p>Username: ${user.username}</p>
			<p>Địa chỉ: ${user.address}</p>
			<p>Ngày sinh: ${user.birthday}</p>
			<p>Giới tính: ${user.gender}</p>
			<p>Số điện thoại: ${user.phone}</p>
			<p>Vai trò: ${user.group.name}</p>
			<p>Ngày đăng ký: ${user.createdDate}</p>
		</div>

	</div>


</body>
</html>