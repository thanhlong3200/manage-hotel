<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết Booking</title>
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
		</div>
		<div class= "payments-information col-3">
			<h3>Các khoản chi trả</h3>
			<c:forEach items="${payments}" var="payment">
				<h4>${payment.description}</h4>
				<p>Tổng giá gốc: ${payment.totalOriginalPrice} VND</p>
				<p>Tổng thanh toán: ${payment.totalSellPrice} VND</p>
				<p>Thanh toán: ${payment.status.name}</p>
			</c:forEach>
		</div>
		<div class= "payments-information col-3">
			<h3>Các phòng đã đặt</h3>
			<c:forEach items="${bookedRooms}" var="bookedRoom">
				<h4>Phòng ${bookedRoom.room.number} Tầng  ${bookedRoom.room.floor}</h4>
				
				<h5>Khách ở: <c:if test="${bookedRoom.customers.size() == 0}">Chưa có</c:if> </h5>
				<c:forEach items="${bookedRoom.customers}" var="customer">
					<p>Tên: ${customer.firstName} ${customer.lastName}</p>
					<p>CMND: ${customer.cmnd}</p>
				</c:forEach>
				<c:if test="${bookedRoom.customers.size() == 0}">
					<a href="<c:url value= '/quan-tri/check-in?bookingCode=${booking.code}'/>" class ="btn btn-success">Check-in ngay</a>
				</c:if>
				<c:if test="${bookedRoom.customers.size() > 0}">
					<a class ="btn btn-secondary">Đã check-in</a>
				</c:if>
			</c:forEach>
			
		</div>
	</div>
</body>
</html>