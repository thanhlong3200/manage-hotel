<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="changeRoomAPI" value="/api/change-room" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi phòng</title>
</head>
<body>
	<h2 style="padding-left:30px;">Đổi phòng</h2>
	<form id="formSubmit" action="<c:url value = "/quan-tri/doi-phong"/>">
		<div class="search-form-booking">
			<h5>Nhập mã booking</h5>
			<c:if test="${empty bookingCode}">
				<input id="searchInput" type="text" name="bookingCode" placeholder="Nhập mã booking" required/>
			</c:if>
		  <c:if test="${not empty bookingCode}">
				<input id="searchInput" type="text" name="bookingCode" placeholder="Nhập mã booking" value="${bookingCode}" required/>			 
			</c:if>
		  <button id="searchBtn" type="submit" class="btn btn-primary">
		    <i class="fas fa-search"></i>
		  </button>
		 
		</div>
		<c:if test="${not empty error}">
			<h3>${error}</h3>		
		</c:if>
		
		<c:if test="${not empty bookingCode}">
			<c:if test="${booking.status.code=='cancel'}">
				<h4 style="font-weight:600;padding-left:30px;">Booking này đang trong trạng thái <b>${booking.status.name}</b> , không thể Đổi phòng</h4>
			</c:if>
			<c:if test="${booking.status.code!='cancel'}">
			
				<div class="changeRoom" style="padding-left:25px;" >
					
			
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
						<button id="submit" class="btn btn-danger"  style="display:block;margin-top:15px;"  data-toggle="modal" data-target="#exampleModal">Lưu</button>
					</div>
						
					<c:if test="${not empty availableRoom}">
					
						<div class="popupChooseRoom">
					
							<div class="chooseRoom">
					
								<div class="mainAvailableRoom" id="exampleModal" style="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div id="note">
										<h4 style="display: inline-block;">Trạng thái phòng</h4>
										<ul id="listNote">
											<c:forEach items="${listStatus}" var="status">
												<button class="btn btn-${status.btnStyle}">
													${status.name}</button>
						
											</c:forEach>
										</ul>
											<button class="btn btn-danger" id="closePopupChooseRoom">X</button>
									</div>
									
									
									
									<ul id="listRoom">
						
										<c:forEach items="${availableRoom}" var="available">
						
											<li data-id="${available.id}" data-room-id="roomId${available.id}" data-check="false"
												class="btn btn-success availableRoom" >
												<h4>${available.number}</h4>
												<p>Tầng ${available.floor}</p>
											</li>
						
										</c:forEach>
									</ul>
									
									
									<button class="btn btn-danger" id="saveChangeRoom">Lưu</button>
									
									
								</div>
							</div>	
							
						
							
						</div>
						
				
					</c:if>
				</div>
			</c:if>
		</c:if>
	</form>
	
	
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
					text = $(this).find('h4').text() + " " + $(this).find('p').text();
					roomId = $(this).attr('data-id');
					$(this).css('pointer-events','none');
				}
				
			})
			$('.displayRoomNumber').each(function(){
				if ($(this).attr('data-room-id') == data_room_id) {
					$(this).attr('placeholder','Phòng '+ text);

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
				data["code"] =  $('#searchInput').val();
				var ids = [];

				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					if (i!=0) {
						ids[i-1] = v.value;	
					}
				});
				data["ids"] = ids;
				console.log(data);
				changeRoom(data);
			});
			function changeRoom(data) {
				$.ajax({
					url : '${changeRoomAPI}',
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