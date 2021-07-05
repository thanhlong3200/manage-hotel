<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="bookingAPI" value="/api/booking" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hủy booking</title>
</head>
<body>
	<h2 style="padding-left:30px;">Hủy booking</h2>
	<form id="formSubmit" action="<c:url value = "/quan-tri/huy-booking"/>">
		<div class="search-form-booking">
			<h5>Nhập mã booking</h5>
			<c:if test="${empty code}">
				<input id="searchInput" type="text" name="code" placeholder="Nhập mã booking" required/>
			</c:if>
		  <c:if test="${not empty code}">
				<input id="searchInput" type="text" name="code" placeholder="Nhập mã booking" value="${code}" required/>			 
			</c:if>
		  <button id="searchBtn" type="submit" class="btn btn-primary">
		    <i class="fas fa-search"></i>
		  </button>
		 	
		</div>
		<c:if test="${not empty error}">
			<h3>${error}</h3>		
		</c:if>
		
	</form>
	<c:if test="${empty error && not empty code}">
		<div class= "booking-details">
			<div class= "booking-information col-4">
				<h3>Chi tiết booking</h3>
				<p>Mã booking: ${booking.code}</p>
				<p>Ngày đặt: ${booking.createdDate}</p>
				<p>Ngày nhận phòng: ${booking.dateFrom}</p>
				<p>Ngày trả phòng: ${booking.dateTo}</p>
				<p>Loại phòng: ${booking.roomType.name}</p>
				<p>Tổng phòng: ${booking.roomCount}</p>
				<p>Tổng khách: ${booking.adult} người lớn, ${booking.children} trẻ em</p>
			</div>
			<div class= "booking-information col-4">
				<h3>Hủy booking</h3>
				<c:if test="${booking.roomType.refunds.size()==0}">
					<p>Hủy miễn phí</p>
				</c:if>
				<c:forEach items="${booking.roomType.refunds}" var="refund">
					<p>Huỷ trước ${refund.preDayCheckIn} ngày hoàn ${refund.percent}%</p>
				</c:forEach>
				<c:if test="${booking.status.code != 'booked'}">
					<h4 style="font-weight:600;">Booking này đang trong trạng thái <b>${booking.status.name}</b> , không thể hủy</h4>
				</c:if>
				<c:if test="${booking.status.code == 'booked'}">
					<button id="cancelBookingBtn" class="btn btn-danger">Hủy booking</button>
				</c:if>
				
			</div>
		</div>
	</c:if>
	
	
	
	<script type="text/javascript">
		$('.btnChange').on('click', function(event) {
			event.preventDefault();
			var data_room_id = $(this).attr('data-room-id');
			$(this).css('display','none');
			$('.formRoomNumber').each(function(){
				if ($(this).attr('data-room-id') == data_room_id) {
					$(this).addClass('appear');
				}
			})
			
			
		})
		
		
		$('#cancelBookingBtn').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				console.log(data);
				cancelBooking(data);
			});
			function cancelBooking(data) {
				$.ajax({
					url : '${bookingAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
						window.location.href = '${bookingDetails}?id=' +result["id"];
					},
					error : function(error) {
						alert("Thất bại");
					}
				});
			}
		</script>
</body>
</html>