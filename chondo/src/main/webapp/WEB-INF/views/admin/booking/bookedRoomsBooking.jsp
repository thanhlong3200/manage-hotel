	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="assignPage" value="/quan-tri/phan-cong" />
<c:url var="assignAPI" value="/api/assign" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check out</title>
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
		<div id="roomsBooked" style="margin-bottom:25px;">
			<h2>Các phòng đã đặt</h2>
			<c:forEach items="${bookedRooms}" var="bookedRoom">
				<h4 style="margin-right: 20px;">Phòng ${bookedRoom.room.number} Tầng  ${bookedRoom.room.floor}</h4>		
				<input type="hidden" name = "roomChoosed" value="${bookedRoom.room.id}"/>
				<input type="hidden" name = "roomChoosed" value="${bookedRoom.room.id}" data-room-id="roomId${bookedRoom.room.id}" class="roomChoosed"/>
				
				<button data-room-id="roomId${bookedRoom.room.id}"  class="btn btn-primary btnChange">Đổi</button>
				
				<div class="formRoomNumber" data-room-id="roomId${bookedRoom.room.id}">
					<input type="text" data-room-id="roomId${bookedRoom.room.id}" class="displayRoomNumber" placeholder ="Phòng ${bookedRoom.room.number} Tầng ${bookedRoom.room.floor}" disabled/>
					<button data-room-id="roomId${bookedRoom.room.id}" data-check="false" class="btn btn-primary btnChooseRoom">Chọn phòng</button>
				</div>
				
				<c:if test="${bookedRoom.customers.size() > 0}"><h5>Khách ở: ${bookedRoom.customers.size()} người</h5></c:if>
			</c:forEach>
			<c:if test="${bookedRoom.customers.size() == 0}">
				<a href="<c:url value= '/quan-tri/check-in?bookingCode=${booking.code}'/>" class ="btn btn-success">Check-in ngay</a>
			</c:if>
			<c:if test="${bookedRoom.customers.size() > 0}">
				<a class ="btn btn-secondary">Đã check-in</a>
			</c:if>
			<button id="submit" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Lưu</button>
		</div>
		
		<script type="text/javascript">
		$('#submit').on('click', function(event) {
				event.preventDefault();
				
				var data = {};

				var ids = [];

				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
				
						ids[i] = v.value;	
					
				});
				data["ids"] = ids;
				console.log(data);
				assignTask(data);
			});
			function assignTask(data) {
				$.ajax({
					url : '${assignAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
					/* 	window.location.href = '${bookingDetails}?id=' +result["id"]; */
					},
					error : function(error) {
						alert("Thất bại");
					}
				});
			}
	</script>
</body>
</html>