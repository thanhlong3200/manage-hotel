<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lưu trú khách sạn</title>

</head>
<body>
		

	<h3>Danh sách booking của khách hàng: ${cmnd}</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<!-- <th scope="col">Xóa</th> -->
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Mã</th>
					<th scope="col">Nhận phòng</th>
					<th scope="col">Trả phòng</th>
					<th scope="col">Số phòng</th>
					<th scope="col">Người lớn</th>
					<th scope="col">Trẻ em</th>
					<th scope="col">Trạng thái</th>
					<th scope="col">Chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${bookings}" var="booking">
					<tr>
						<!-- <td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td> -->
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${booking.code}</td>
						<td style="line-height: 60px;">${booking.dateFrom}</td>
						<td style="line-height: 60px;">${booking.dateTo}</td>
						<td style="line-height: 60px;">${booking.roomCount}</td>
						<td style="line-height: 60px;">${booking.adult}</td>
						<td style="line-height: 60px;">${booking.children}</td>
						<td style="line-height: 60px;">${booking.status.name}</td>
						<td style="line-height: 60px;"><a
							href="<c:url value ="/quan-tri/booking?id=${booking.id}"/>">Xem</a></td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
	
</body>
</html>