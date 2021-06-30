<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="upgradeAPI" value="/api/upgrade" />
<c:url var="changeRoomURL" value="/quan-tri/doi-phong" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nâng cấp booking</title>
</head>
<body>
	<form id="formSubmit" action="<c:url value = "/quan-tri/nang-cap-booking"/>">
		<div class="search-form-booking">
			<h5>Nhập mã booking</h5>
			<c:if test="${empty code}">
				<input id="searchInput" type="text" name="bookingCode" placeholder="Nhập mã booking" required/>
			</c:if>
		  <c:if test="${not empty code}">
				<input id="searchInput" type="text" name="bookingCode" placeholder="Nhập mã booking" value="${code}" required/>			 
			</c:if>
		  <button id="searchBtn" type="submit" class="btn btn-primary">
		    <i class="fas fa-search"></i>
		  </button>
		 
		</div>
		<c:if test="${not empty error}">
			<h3>${error}</h3>		
		</c:if>
		
		<c:if test="${not empty code}">
			<c:if test="${booking.status.code != 'booked' }">
				<h4 style="font-weight:600;padding-left:30px;">Booking này đang trong trạng thái <b>${booking.status.name}</b> , không thể upgrade</h4>
			</c:if>
			<c:if test="${booking.status.code == 'booked' }">
				<div class="upgradeBooking" style="padding-left:25px;" >
					<p>Mã booking: ${booking.code}</p>
					<p>Ngày đặt: ${booking.createdDate}</p>
					<p>Ngày nhận phòng: ${booking.dateFrom}</p>
					<p>Ngày trả phòng: ${booking.dateTo}</p>
					<p>Loại phòng: ${booking.roomType.name}</p>
					<select id="roomTypeIdChoosed" required>
						<option value = "">--Chọn loại phòng nâng cấp--</option>
						<c:forEach items="${roomTypes}" var="roomType">
							<option value = "${roomType.id}">${roomType.name}</option>	
						</c:forEach>
					</select>
					<select id="freeUpgrade" required>
						<option value = "">--Chọn hình thức--</option>
						<option value = "0">Có phí</option>
						<option value = "1">Miễn phí</option>
					</select>
					<input type="hidden" id="bookingCode" value="${booking.code}">
					<button id="saveUpgrade" type="submit" class="btn btn-primary" >Nâng cấp</button>
				</div>
			</c:if>
			
		
		</c:if>
	</form>
	
	
	<script type="text/javascript">
		
		$('#saveUpgrade').on('click', function(event) {
			event.preventDefault();
			var data = {};
			data["booking"] = {
				"code" : $('#bookingCode').val()
			}
			data["initRoomType"] = {
					"id": $('#roomTypeIdChoosed').val()
			}
			data["free"] = $('#freeUpgrade').val();
			console.log(data);
			upgradeBooking(data);
		});
		function upgradeBooking(data) {
			$.ajax({
				url : '${upgradeAPI}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Thành công. Vui lòng chọn lại phòng cho Booking !");
					window.location.href = '${changeRoomURL}?bookingCode=' +result["booking"]["code"];
				},
				error : function(error) {
					alert("Thất bại");
				}
			});
		}	
	</script>
</body>
</html>