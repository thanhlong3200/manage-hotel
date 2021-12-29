	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="assignPage" value="/quan-tri/phan-cong" />
<c:url var="paymentDetails" value="/quan-tri/thanh-toan" />
<c:url var="upgrade" value="/quan-tri/nang-cap-booking" />
<c:url var="extend" value="/quan-tri/gia-han-booking" />
<c:url var="bill" value="/quan-tri/hoa-don" />
<c:url var="paymentAPI" value="/api/checkout" />
<c:url var="cancelBooking" value="/quan-tri/huy-booking" />
<c:url var="changeRoom" value="/quan-tri/doi-phong" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết Booking</title>
</head>
<body>
	<div class= "booking-details" style="display: block;z-index: 3;position: relative;margin-bottom: 35rem;margin-top: 5rem;">
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
			<c:if test="${booking.status.code == 'checkin'}">
				<a href="${paymentDetails}?code=${booking.code}">
					<button id="checkOutBtn" class="btn btn-danger">Check-out</button>
				</a>
			</c:if>
			<c:if test="${booking.status.code != 'checkout' && booking.status.code != 'cancel'}">
				<a href="${upgrade}?bookingCode=${booking.code}">
					<button id="checkOutBtn" class="btn btn-primary">Nâng cấp booking</button>
				</a>
				<a href="${extend}?code=${booking.code}">
					<button id="checkOutBtn" class="btn btn-primary" style="margin-top:10px;">Gia hạn booking</button>
				</a>
				<a href="${changeRoom}?bookingCode=${booking.code}">
					<button id="checkOutBtn" class="btn btn-primary" style="margin-top:10px;">Đổi phòng</button>
				</a>
			</c:if>
			<c:if test="${booking.status.code == 'booked'}">
				<a href="${cancelBooking}?code=${booking.code}">
					<button id="checkOutBtn" class="btn btn-danger" style="margin-top:10px;">Hủy booking</button>
				</a>
			</c:if>
			
			
			<c:if test="${booking.status.code == 'checkout'}">
				<a href="${paymentDetails}?code=${booking.code}">
					<button id="checkOutBtn" class="btn btn-primary">Chi tiết hóa đơn</button>
				</a>
			</c:if>
			
		
			
		</div>
		<div class= "payments-information col-3">
			<h3>Lịch sử</h3>
			<p>${booking.logs}</p>
		</div>
		<div class= "payments-information col-3">
			<form id="formSubmit">
				<h3>Các phòng đã đặt</h3>
				<c:forEach items="${bookedRooms}" var="bookedRoom">
					<h4>Phòng ${bookedRoom.room.number} Tầng  ${bookedRoom.room.floor}</h4>
					
					<h5>Khách ở: <c:if test="${bookedRoom.customers.size() == 0}">Chưa có</c:if> </h5>
					<c:forEach items="${bookedRoom.customers}" var="customer">
						<p style="color: gray;text-align: left;">Tên: ${customer.firstName} ${customer.lastName}</p>
						<p style="color: gray;text-align: left;margin-bottom:20px;">CMND: ${customer.cmnd}</p>
						<c:if test="${booking.status.code == 'checkout'}">
							<a style="margin-bottom:20px;" class ="btn btn-primary">Đã trả CMND</a>
						</c:if>
					</c:forEach>
					<c:if test="${booking.status.code != 'cancel' }">
						<c:if test="${bookedRoom.customers.size() == 0}">
							<a style="margin-bottom:20px;" href="<c:url value= '/quan-tri/check-in?code=${booking.code}'/>" class ="btn btn-success">Check-in ngay</a>
						</c:if>
						<c:if test="${bookedRoom.customers.size() > 0}">
							<a style="margin-bottom:20px;" class ="btn btn-secondary">Đã check-in</a>
							
						</c:if>
					</c:if>
					
				</c:forEach>
			</form>
			
		</div>
	</div>
</body>
</html>