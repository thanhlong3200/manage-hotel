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
			<h4 style="font-weight:600;">Trạng thái: ${booking.status.name }</h4>
		</div>
		<div class= "payments-information col-3">
			<h3>Các khoản chi trả</h3>
			<c:forEach items="${payments}" var="payment">
				<h4>${payment.description}</h4>
				<p>Tổng giá gốc: ${payment.totalOriginalPrice} VND</p>
				<p>Tổng thanh toán: ${payment.totalSellPrice} VND</p>
				<p>Thanh toán: ${payment.status.name}</p>
			</c:forEach>
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
						<p style="color: gray;text-align: left;">CMND: ${customer.cmnd}</p>
					</c:forEach>
					<c:if test="${booking.status.code != 'cancel' }">
						<c:if test="${bookedRoom.customers.size() == 0}">
							<a style="margin-bottom:20px;" href="<c:url value= '/quan-tri/check-in?code=${booking.code}'/>" class ="btn btn-success">Check-in ngay</a>
						</c:if>
						<c:if test="${bookedRoom.customers.size() > 0}">
							<a style="margin-bottom:20px;" class ="btn btn-secondary">Đã check-in</a>
							
							<c:forEach items="${booking.bookedRooms}" var="bookedRoom">
								<input type="hidden" name = "roomChoosed" value="${bookedRoom.room.id}" />
								<input type="hidden" name = "roomChoosed" value="${bookedRoom.room.id}" data-room-id="roomId${bookedRoom.room.id}" class="roomChoosed"/>
								
								<button style="display: block;" data-room-id="roomId${bookedRoom.room.id}"  class="btn btn-primary btnChange">Nhân viên</button>
								
								<div class="formRoomNumber" data-room-id="roomId${bookedRoom.room.id}">
									<input type="text" data-room-id="roomId${bookedRoom.room.id}" class="displayRoomNumber" style ="width: 100%;" disabled/>
									<button data-room-id="roomId${bookedRoom.room.id}" data-check="false" class="btn btn-primary btnChooseRoom">Chọn nhân viên</button>
								</div>
							</c:forEach>
							<div class="popupChooseRoom" style ="overflow-y:scroll;padding-bottom:45px;">
					
								<div class="chooseRoom">
						
									<div class="mainAvailableRoom" id="exampleModal" style="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div id="note">
											<h4 style="display: inline-block;">Trạng thái nhân viên</h4>
											<ul id="listNote">
												<c:forEach items="${listStatus}" var="status">
													<button class="btn btn-${status.btnStyle}">
														${status.name}</button>
							
												</c:forEach>
											</ul>
												<button class="btn btn-danger" id="closePopupChooseRoom">X</button>
										</div>
										
										
										
										<ul id="listRoom">
							
											<c:forEach items="${availableStaff}" var="staff">
							
												<li data-id="${staff.id}" data-room-id="roomId${staff.id}" data-check="false"
													class="btn btn-success availableRoom" style="width:188px;">
													<h4>${staff.fullname}</h4>
												</li>
							
											</c:forEach>
										</ul>
										
										<button class="btn btn-danger" id="saveChangeRoom">Lưu</button>
									
										
										
									</div>
								</div>	
							
						
							
							</div>
						</c:if>
						</c:if>
					
				</c:forEach>
			</form>
			<button class="btn btn-success" id="submit" style="width: 180px;height: 50px;font-size: 20px;margin-top:50px;">Hoàn tất</button>
		</div>
	</div>
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
		
		
	
		var data_room_id;
		var maxRoom;
		$('.btnChooseRoom').on('click', function(event) {
			event.preventDefault();
					
			$('.popupChooseRoom').addClass('appear');	
			data_room_id = $(this).attr('data-room-id');
					
			maxRoom = 1;
	
		})	
			
		$('.availableRoom').on('click', function(event) {
			var checked = $(this).attr('data-check');
			if (checked == 'false' && maxRoom != 0) {
				$(this).addClass('booked');
				$(this).attr('data-check', 'true');		
				maxRoom--;
			} else if (checked == 'true') {
				$(this).removeClass('booked');
				$(this).attr('data-check', 'false');
				maxRoom++;
			}
			if (maxRoom==0) {
				$('#saveChangeRoom').css('display','block');
			}else{
				$('#saveChangeRoom').css('display','none');
			}
			

		});
			
			
		$('.availableRoom').each(function(){
			if ($(this).attr('data-check') == "true") {
				$('#saveChangeRoom').css('display','block');
			}
		});
		$('#saveChangeRoom').on('click', function(event) {
			event.preventDefault();
			var text;
			var roomId;
			$('.availableRoom').each(function(){
				if ($(this).attr('data-check') == "true") {
					text = $(this).find('h4').text();
					roomId = $(this).attr('data-id');
					$(this).css('pointer-events','none');
				}
				
			})
			$('.displayRoomNumber').each(function(){
				if ($(this).attr('data-room-id') == data_room_id) {
					$(this).attr('placeholder','NV: '+ text);

				}
			})
			$('.roomChoosed').each(function(){
				if ($(this).attr('data-room-id') == data_room_id) {
					var id = "roomId" +$(this).val();
					console.log(id);
					$('.availableRoom').each(function(){
						if ($(this).attr('data-room-id')== id) {
							$(this).css('pointer-events','all');
						}
						
					})
					$(this).val(roomId);
					
				}
			})
			
			
			
			$('.popupChooseRoom').removeClass('appear');	
			$('.availableRoom').each(function(){
				if ($(this).attr('data-check') == "true") {
					$(this).attr('data-check','false');
					$(this).removeClass('booked');
				}
				
			})
		
		});

		
		$('#closePopupChooseRoom').on('click', function(event) {
			event.preventDefault();
			$('.popupChooseRoom').removeClass('appear');	
			$('#saveChangeRoom').css('display','none');
			$('.availableRoom').each(function(){
				if ($(this).attr('data-check') == "true") {
					$(this).attr('data-check','false');
					$(this).removeClass('booked');
				}
				
			})
			return;
		})
		
		
		
		
		
		
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