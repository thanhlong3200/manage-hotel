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
		<h2 style="padding-left:30px;">Check-in</h2>
		<form id="checkInForm">
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
		
			<c:if test="${not empty code}">
					<h3>Mã booking: <a href="<c:url value="/quan-tri/booking?id=${booking.id}"/>">${booking.code}</a></h3>
					<c:if test="${booking.status.code != 'booked' }">
						<h4 style="font-weight:600;">Booking này đang trong trạng thái <b>${booking.status.name}</b> , không thể Check-in</h4>
					</c:if>
					<c:if test="${booking.status.code == 'booked' }">
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
														placeholder="Họ" style="width:85%;"> <input class="mb-10"
														id="lastName${count}" type="text" placeholder="Tên" style="width:85%;"
														> <input class="mb-10"
														id="cmnd${count}" type="text" placeholder="CMND" style="width:85%;"
														> <select id="gender${count}" style="width:85%;">
														<option value="">--Chọn giới tính--</option>
														<option value="male">Nam</option>
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
						<button class="btn btn-primary"  id="submit">Hoàn tất</button>	
						
					</c:if>
					
			</c:if>
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