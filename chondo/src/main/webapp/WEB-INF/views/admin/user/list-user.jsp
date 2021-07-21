<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách người dùng</title>
</head>
<body>
	<h3>Danh sách người dùng</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Tên</th>
					<th scope="col">Email</th>
					<th scope="col">Vai trò</th>		
					<th scope="col">Số điện thoại</th>
					<th scope="col">Ngày đăng ký</th>
					<th scope="col">Chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${listUser}" var="user">
					<tr>
					  
						<td style="line-height: 60px;">${user.fullname}</td>
						<td style="line-height: 60px;">${user.email}</td>
						<td style="line-height: 60px;">${user.group.name}</td>
						<td style="line-height: 60px;">${user.phone}</td>
						<td style="line-height: 60px;">${user.createdDate}</td>
						<td style="line-height: 60px;"><a
							href="<c:url value ="/quan-tri/nguoi-dung/danh-sach?id=${user.id}"/>">Xem</a></td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
	<div class="btn-control ml-2 mb-2">
		<a style="color: white; text-decoration: none;"
			href="<c:url value ="/quan-tri/nguoi-dung/them-nguoi-dung"/>"
			type="button" class="btn btn-info"> Thêm người dùng <i
			class="fa fa-plus ml-2"></i>
		</a>
	</div>
				

	

	
</body>
</html>