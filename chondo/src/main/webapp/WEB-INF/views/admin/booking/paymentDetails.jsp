<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="checkOutAPI" value="/api/check-out" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<c:url var="addRate" value="/quan-tri/them-danh-gia" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
</head>
<body>
	<div id="paymentPage" style ="padding-bottom:50px;">
		<h2>Chi tiết thanh toán</h2>
		<p>Khách hàng: ${booking.customer.firstName} ${booking.customer.lastName}</p>
		<p>Số điện thoại: ${booking.customer.phone}</p>
		<p>Mã booking: ${booking.code}</p>
		<h4>Tiền phòng</h4>
		<table class="table">
		  <thead>
		    <tr>  
		      <th scope="col" width="300px">Loại phòng</th>
		      <th scope="col">Số phòng</th>
		      <th scope="col">Số đêm</th>
		      <th scope="col">Gía gốc</th>
		      <th scope="col">Gía đặt</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		    	<c:if test="${not empty upgrade }">
		    		 <th scope="row">${upgrade.initRoomType.name} </br>(Chưa upgrade)</th>
		    	</c:if>
		     	<c:if test="${empty upgrade }">
		    		 <th scope="row">${booking.roomType.name}</th>
		    	</c:if>  	
		    	<td>${booking.roomCount}</td>
		        <td>${booking.nightCount}</td>
		        <td>${PriceUtil.convert(booking.originalPriceBooked)}</td>
		        <td>${PriceUtil.convert(booking.sellPriceBooked)}</td>
		    <tr>
				
		      <td colspan="4" style="text-align:right;">Tổng tiền: </td>
		      <td>${PriceUtil.convert(booking.sellPriceBooked)}</td>
	
		    </tr>
		  </tbody>
		</table>
		
		
		
		
		
		
		
		<c:if test="${not empty upgrade}">
			<h4>Tiền Upgrade booking (Nâng cấp booking)</h4>
			<table class="table">
			  <thead>
			    <tr>  
			      <th scope="col" width="200px">Loại phòng ban đầu</th>
			      <th scope="col">Loại phòng nâng cấp</th>
			      <th scope="col">Giờ nâng cấp</th>
			      <th scope="col">Gía gốc</th>
			      <th scope="col" width="190px">Gía nâng cấp</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:if test="${upgrade.free == 1}">
			  		<tr>
				      <th scope="row">${upgrade.initRoomType.name}</th>
				      <td>${booking.roomType.name}</td>
				      <td>${upgrade.createdDate}</td>
				      <td>0</td>
				      <td>0</td>
				    </tr>
			  	</c:if>
			  <c:if test="${upgrade.free == 0}">
			  		<tr>
				      <th scope="row">${upgrade.initRoomType.name}</th>
				      <td>${booking.roomType.name}</td>
				      <td>${upgrade.createdDate}</td>
				      <td>${PriceUtil.convert(booking.originalPriceUpgrade)}</td>
				      <td>${PriceUtil.convert(booking.sellPriceUpgrade)}</td>
				    </tr>
			  	</c:if>
			  

			    <tr>
			      <td colspan="4" style="text-align:right;">Tổng tiền: </td>
			      <td>${PriceUtil.convert(booking.sellPriceUpgrade)}</td>
		
			    </tr>
			  </tbody>
			</table>
		</c:if>
		
		
		
		
		
		<h4>Tiền dịch vụ</h4>
		<table class="table">
		  <thead>
		    <tr>  
		      <th scope="col" width="180px">Phòng</th>
		      <th scope="col">Tên dịch vụ</th>
		      <th scope="col">Giờ sử dụng</th>
		      <th scope="col" width="190px">Gía</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <c:forEach items="${booking.bookedRooms}" var="bookedRoom">
		  	<c:forEach items="${bookedRoom.bookedServices}" var="bookedService">
		  		<c:if test="${bookedService.free == 1}">
		  			<tr>
				      <th scope="row">${bookedRoom.room.number}</th>
				      <td>${bookedService.service.name}</td>
				      <td>${bookedService.createdDate}</td>
				      <td>0</td>
				    </tr>
		  		</c:if>
		  		<c:if test="${bookedService.free == 0}">
		  			<tr>
				      <th scope="row">${bookedRoom.room.number}</th>
				      <td>${bookedService.service.name}</td>
				      <td>${bookedService.createdDate}</td>
				      <td>${PriceUtil.convert(bookedService.service.price)}</td>
				    </tr>
		  		</c:if>
		  	</c:forEach>
		  </c:forEach>
		  
		    <tr>

		      <td colspan="3" style="text-align:right;">Tổng tiền: </td>
		      <td>${PriceUtil.convert(booking.priceService)}</td>
	
		    </tr>
		  </tbody>
		</table>
		<c:if test="${booking.refund==true}">
			<h5 style ="text-align:right;padding-right:40px;">Check-out sớm trước 2 ngày: -50%</h5>
		</c:if>
		<h4 style ="text-align:right;padding-right:40px;">Tổng thanh toán: ${PriceUtil.convert(booking.totalPrice)} VND</h4>
	</div>
	<c:if test="${not empty types}">
		<select id="paymentType" style="width:350px;margin-bottom:20px;display: block;">
			<option>--Chọn phương thức thanh toán--</option>
			<c:forEach items="${types}" var="type">
				<option value="${type.code }">${type.name}</option>
			</c:forEach>
		</select>
		<button class="btn btn-primary" id="verifyCheckOut" style="width:105px;height:45px;margin-bottom:50px;">Xác nhận</button>
	</c:if>
	<c:if test="${not empty payment}">
		<h3>Phương thức thanh toán: ${payment.paymentType.name}</h3>
		<h4 style="margin-bottom:50px;padding-left:30px;">Ngày lập hóa đơn: ${payment.createdDate}</h4>
	</c:if>

	
	
	
	<script type="text/javascript">
		$('#verifyCheckOut').on('click', function(event) {
			event.preventDefault();
			
			var data = {};
			data["paymentType"] =  {
				"code" : $('#paymentType').val()
			};
			data["booking"] =  {
				"code" : '${booking.code}',
				"refund": '${booking.refund}'
			};
			console.log(data);
			checkOut(data);
		});
		function checkOut(data) {
			$.ajax({
				url : '${checkOutAPI}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Thành công");
					window.location.href = '${addRate}?roomTypeId=' +result["booking"]["roomType"]["id"] + "&bookingId=" + result["booking"]["id"];
				},
				error : function(error) {
					alert("Thất bại");
				}
			});
		}
		
	</script>
</body>
</html>