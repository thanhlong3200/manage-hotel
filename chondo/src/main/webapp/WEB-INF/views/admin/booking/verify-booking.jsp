	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="assignPage" value="/quan-tri/phan-cong" />
<c:url var="paymentDetails" value="/quan-tri/thanh-toan" />
<c:url var="upgrade" value="/quan-tri/nang-cap-booking" />
<c:url var="assignAPI" value="/api/assign" />
<c:url var="paymentAPI" value="/api/checkout" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xác nhận Booking</title>
</head>
<body>
	<div class= "booking-details">
		<div class= "booking-information col-3">
			<h3>Chi tiết booking</h3>
			<p>Mã booking: ${booking.code}</p>
			<p>Ngày đặt: ${booking.createdDate}</p>
			<p>Ngày nhận phòng: ${booking.dateFrom}</p>
			<p>Ngày trả phòng: ${booking.dateTo}</p>
			<p>Loại phòng: ${booking.roomType.name}</p>
			<p>Tổng phòng: ${booking.roomCount}</p>
			<p>Tổng khách: ${booking.adult} người lớn, ${booking.children} trẻ em</p>
			<h4 style="font-weight:600;">Trạng thái: ${booking.status.name }</h4>
			
		</div>
		<div class= "payments-information col-3">
			<h3>Lịch sử</h3>
			<p>${booking.logs}</p>
			
		</div>
		<div class= "payments-information col-3">
			<h3>Liên hệ</h3>
			<p>Khách hàng: ${booking.customer.firstName} ${booking.customer.lastName}</p>
			<p>Số điện thoại: ${booking.customer.phone}</p>
			<a href="<c:url value='/quan-tri/xac-nhan-booking?code=${booking.code}&manipulation=verify'/>"><button class="btn btn-success">Xác nhận</button></a>
			<a href="<c:url value='/quan-tri/huy-booking?code=${booking.code }'/>"><button class="btn btn-danger">Hủy booking</button></a>
		</div>
		<a href="<c:url value='/quan-tri/tinh-hinh-dat-phong?page=1&limit=10'/>"><button class="btn btn-primary">Trở lại</button></a>
	</div>
</body>

</html>