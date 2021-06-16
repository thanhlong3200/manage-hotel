<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="searchAPI" value="/quan-tri/dat-phong" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết phòng</title>
</head>
<body>
	<div class="roomDetailsPage">
		<div class="mainRoomDetails">
			<c:forEach items="${model.listResult}" var="roomType">	
				<h3>${roomType.name} ${search.location}</h3>	
				<div class="sliderImage">
					<img alt="" id="mainImage" src="<c:url value='/template/web/images/room/${roomType.image}'/>">
					<ul id="allImage">
						<c:forEach items="${roomType.images}" var="image">
							<li><img src="<c:url value='/template/web/images/room/${image.url}'/>"/></li>
						</c:forEach>
					</ul>
				</div>
				
				
				
				<h3 style="margin-top:20px;">Giới thiệu</h3>
				<p style="margin-bottom:20px;font-weight:600;font-size:19px;">Phòng có diện tích ${roomType.acreage} m<sup>2</sup></p>
				<p style="font-size:20px;margin-bottom:20px;">Nội thất: </p>	
				<c:forEach items="${roomType.furnitures}" var="furniture">
					<p style="font-weight:600;font-size:19px;">
					${furniture.quality} ${furniture.name}  </p>
				</c:forEach>
			
				<div class="review"><input type="hidden" id="review" value="${roomType.review}"></div>
				
				<h3 style="margin-top:20px;">Các dịch vụ miễn phí</h3>
				<c:forEach items="${roomType.services}" var="service">
					<span style="margin:0px 20px 20px 0px;white-space:nowrap;display:inline-block;font-size:19px;">
					${service.symbol} ${service.name}</span>
				</c:forEach>
				
				<div class="sliderServiceImage">
					<img alt="" id="mainServiceImage" src="">
					<ul id="allServiceImage">
						<c:forEach items="${roomType.services}" var="service">
							<c:if test="${service.image != null}">
								<li><img src="<c:url value='/template/web/images/service/${service.image}'/>"/></li>
							</c:if>					
						</c:forEach>
					</ul>	
				</div>
				
				
			</c:forEach>		
		</div>
		
		<div class="filter">
			<div class="booking-box">
				<div class="booking-form">
					<form:form id="formSubmit" action="${searchAPI}" method="get"
						modelAttribute="search">	
						<button id="booking" class="btn btn-success">Xem phòng trống</button>
						<div class="b-date arrive mb-15">
							<form:input path="dateFrom" autocomplete="off"
								data-date-format="dd/mm/yyyy" class="date-picker"
								placeholder="Ngày đến" style="pointer-events: none;"/>
						</div>
						<div class="b-date departure mb-15">
							<form:input path="dateTo" autocomplete="off"
								data-date-format="dd/mm/yyyy" class="date-picker"
								placeholder="Ngày đi"  style="pointer-events: none;"/>
						</div>
						<div class="mb-15">
							<form:select path="adult" style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng người lớn</option>
								<form:option value="1">1 người lớn</form:option>
								<form:option value="2">2 người lớn</form:option>
								<form:option value="3">3 người lớn</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="children" style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng trẻ em</option>
								<form:option value="0">0 trẻ em</form:option>
								<form:option value="1">1 trẻ em</form:option>
								<form:option value="2">2 trẻ em</form:option>
								<form:option value="3">3 trẻ em</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="roomCount" style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng phòng</option>
								<form:option value="1">1 phòng</form:option>
								<form:option value="2">2 phòng</form:option>
								<form:option value="3">3 phòng</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="location" style="pointer-events: none;appearance: none;">
								<option disabled value="">Địa điểm</option>
								<form:option value="Vũng Tàu">Vũng Tàu</form:option>
								<form:option value="Đà Lạt">Đà Lạt</form:option>
							</form:select>
						</div>
						<c:forEach items="${model.listResult}" var="roomType">
						
							<c:if test="${roomType.originalPrice == roomType.sellPrice}">
							 	<p>${PriceUtil.convert(roomType.originalPrice)} VND</p>	
							 	<p style="font-size:15px;">/ đêm / phòng</p>						
							</c:if>
							<c:if test="${roomType.originalPrice != roomType.sellPrice}">
							 	<p id ="orgPrice">${PriceUtil.convert(roomType.originalPrice)} VND</p>								
								<p>${PriceUtil.convert(roomType.sellPrice)} VND</p>
								<p style="font-size:15px;">/ đêm / phòng</p>
							</c:if>
							<p>x</p>
							<p style="font-size:15px;"> ${search.nightCount} đêm / ${search.roomCount} phòng</p>
							<p style="font-size:25px;">${PriceUtil.convert(roomType.sellPrice * search.nightCount * search.roomCount)} VND</p>
							
							<input type="hidden" name = "roomTypeId" value="${roomType.id}"/>
						</c:forEach>
						
						
	
					</form:form>
				</div>
			</div>

		</div>
	</div>
	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		$(document).ready(function() {
	        $('.review').html($('#review').val());
			$('#allImage li img').on('click', function(event) {		
				var src = $(this).attr('src');
				$('#mainImage').attr('src',src);
			});
			$('#mainServiceImage').attr('src',$('#allServiceImage li img').first().attr('src'));
			$('#allServiceImage li img').on('click', function(event) {		
				var src = $(this).attr('src');
				$('#mainServiceImage').attr('src',src);
			});
			
			/* $('#booking').on('click', function(event) {
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				booking(data);
				
			}); */
			
		});
	</script>
</body>
</html>