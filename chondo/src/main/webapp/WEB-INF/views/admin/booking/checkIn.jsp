<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="checkInAPI" value="/api/check-in" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check-in</title>
</head>
<body>
	<div class="checkInForm">
		<h2>Mã booking: ${booking.code}</h2>
		<h3>Các phòng đã đặt</h3>
		<form id="checkInForm">

			<c:set var="count" value="1" scope="page" />
			<c:forEach items="${bookedRooms}" var="bookedRoom">
				<div class="col-3">
					<h4>* Phòng ${bookedRoom.room.number} Tầng
						${bookedRoom.room.floor}</h4>
					<h5>- Khách ở:</h5>
					<c:forEach begin="1" end="${booking.roomType.capacity}"
						varStatus="loop">
						<div class="oneInforCustomer">
							<h5>+ Thông tin khách ${loop.index}:</h5>
							<div class="booking-form-list">
								<div class="single-form-part">
									<div class="name mb-15">
										<input class="mb-10" id="firstName${count}" type="text"
											placeholder="Họ" value="Long"> <input class="mb-10"
											id="lastName${count}" type="text" placeholder="Tên"
											value="Nguyen"> <input class="mb-10"
											id="cmnd${count}" type="text" placeholder="CMND"
											value="12354"> <select id="gender${count}">
											<option value="">--Chọn giới tính--</option>
											<option value="male" selected>Nam</option>
											<option value="female">Nữ</option>
											<option value="other">Khác</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>
				</div>
			</c:forEach>
			<button id="submit">Hoàn tất</button>
		</form>
	</div>
	</div>
	<script type="text/javascript">
		$('#submit').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var count = 1;
				data["bookedRooms"] = [];
					<c:forEach items="${bookedRooms}" var="bookedRoom" varStatus="wloop">
						data["bookedRooms"].push({
							id : ${bookedRoom.id}
						})			 	
						 data["bookedRooms"][${wloop.index}]["customers"] = [];
						<c:forEach begin="0" end="${booking.roomType.capacity - 1}" varStatus="loop">   
								data["bookedRooms"][${wloop.index}]["customers"].push({
									firstName : $('#firstName'+count).val(),
									lastName : $('#lastName'+count).val(),
									cmnd : $('#cmnd'+count).val(),
									gender : $('#gender'+count).val()		
							})
							count++;
						</c:forEach>			
						
					</c:forEach>

					
				checkIn(data);
		
				
			});
			function checkIn(data) {
				$.ajax({
					url : '${checkInAPI}',
					type : 'POST',
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