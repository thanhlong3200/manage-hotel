<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="bookingAPI" value="/api/booking" />
<c:url var="rateURL" value="/quan-tri/danh-gia" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đánh giá</title>
</head>
<body>
	<div class="">
		

		<div class="">
			<form id="formSubmit" action="<c:url value = "/quan-tri/danh-gia"/>">
				<div class="filterRoomType">
					<h4 style="display: inline;">Loại phòng</h4>
					<select id="roomTypes" name="roomTypeId"  style="display: inline;width:250px;">
						<option value="all">--Tất cả--</option>
						<c:forEach items="${roomTypes}" var="roomType" > 
							<c:if test="${roomType.id == type.id}">
								<option value="${roomType.id }" selected>${roomType.name}</option>
							</c:if>
							<c:if test="${roomType.id != type.id}">
								<option value="${roomType.id }">${roomType.name}</option>
							</c:if>
							
						</c:forEach>
					</select>
				</div>
			</form>
			
		</div>
		<c:if test="${not empty type}">
			<h5>Tổng số đánh giá: ${type.rates.size()}</h5>
			<h5>Trung bình: ${type.averageBadge }</h5>
			<h5>Xếp loại: ${type.rank}</h5>
		</c:if>
		<div class="scrollDiv">
			<table class="table text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Loại phòng</th>
						<th scope="col">Vote</th>
						<th scope="col">Bình luận</th>		
						<th scope="col">Ngày đánh giá</th>
					</tr>
				</thead>
				<tbody class="scrollDiv">
					<c:forEach items="${listResult}" var="rate">
						<tr>
							<td style="line-height: 60px;">${rate.roomTypeName}</td>
							<td style="line-height: 60px;">${rate.vote}</td>
							<td style="line-height: 60px;">${rate.comment}</td>
							<td style="line-height: 60px;">${rate.createdDate}</td>
							
						</tr>
	
					</c:forEach>
	
				</tbody>
			</table>
		</div>

	</div>
	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			  $('#roomTypes').change(function() {
				 if ($(this).val() == "all") {
					window.location.href = '${rateURL}';
				}else{
					$('#formSubmit').submit();
				}
			   
			  });
		 });
	</script>
</body>
</html>