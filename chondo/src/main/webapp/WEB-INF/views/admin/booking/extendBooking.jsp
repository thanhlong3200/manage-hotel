<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="extendAPI" value="/api/extend-booking"/>
<c:url var="extendBooking" value="/quan-tri/gia-han-booking" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gia hạn booking</title>
</head>
<body>
	<h2 style="padding-left:30px;">Gia hạn booking</h2>
	<form id="formSubmit" action="<c:url value = "/quan-tri/gia-han-booking"/>">
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
		
	
		<c:if test="${empty error && not empty code}">
			<div class= "booking-details">
				<div class= "booking-information col-4">
					<p>Mã booking: ${booking.code}</p>
					<p>Ngày đặt: ${booking.createdDate}</p>
					<p>Ngày nhận phòng: ${booking.dateFrom}</p>
					<p>Ngày trả phòng: ${booking.dateTo}</p>
					<p>Loại phòng: ${booking.roomType.name}</p>
					<p>Các phòng đã đặt: 
						<c:forEach items="${booking.bookedRooms}" var="bookedRoom">
							${bookedRoom.room.number} &ensp;
						</c:forEach>
					</p>
				</div>
				<div class="extendDiv">
					<h5>Gia hạn</h5>
					<input type="number" min="1" value="${dateNumber}" name="dateNumber" id="dateNumber" required/>
					<h5>ngày</h5>
					<button type="submit" id="searchExtend" class="btn btn-primary" style="display:block;margin-top:20px;">Tìm kiếm phòng trống</button>
				</div>
				
			</div>
			
		</c:if>
		<c:if test="${not empty dateNumber}">
			<div class="mainAvailableRoom" style="margin-top:25px;margin-left:10px;">

				<h4 style="display: inline-block;">Phòng trống trong ${dateNumber} ngày kể từ ${booking.dateTo}</h4>
				<ul id="listRoom">
					
					<c:forEach items="${availableRoom}" var="available">
	
						<li data-id="${available.id}" data-check="false"
							class="btn btn-success availableRoom">
							<h4>${available.number}</h4>
							<p>Tầng ${available.floor}</p>
						</li>
	
					</c:forEach>
					<button id="saveExtend" style="width:150px;" class="btn btn-primary">Gia hạn</button>
				</ul>
			</div>
		
		</c:if>
		
	</form>
	
	<script type="text/javascript">
		$('#searchBtn').on('click', function(event) {
			event.preventDefault();
			window.location.href = '${extendBooking}?code=' + $('#searchInput').val();
		});
		$('#saveExtend').on('click', function(event) {
			if (maxChoosed!=0) {
				alert("Vui lòng chọn phòng !");
			}
		});
		$('#saveExtend').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var date = new Date('${booking.dateTo}');
				var number = $('#dateNumber').val();
				var endDate = new Date(date.getTime() + 60 * 60 * 24 * 1000*number);
				
				data["code"]= '${booking.code}';
				data["dateTo"]= endDate;
				
				data["ids"] =[];
				$('.availableRoom').each(function(){
					if ($(this).attr('data-check') == "true") {
						data["ids"].push($(this).attr("data-id"));
					}
				});
				console.log(data);
			 	extendBooking(data);
			});
			function extendBooking(data) {
				$.ajax({
					url : '${extendAPI}',
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
			
			var maxChoosed = ${booking.bookedRooms.size()};
			$('.availableRoom').on('click', function(event) {
				var checked = $(this).attr('data-check');
				if (checked == 'false' && maxChoosed != 0) {
					$(this).addClass('booked');
					$(this).attr('data-check', 'true');		
					maxChoosed--;
				} else if (checked == 'true') {
					$(this).removeClass('booked');
					$(this).attr('data-check', 'false');
					maxChoosed++;
				}

			});
		</script>
</body>
</html>