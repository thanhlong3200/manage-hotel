<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="bookingAPI" value="/api/booking" />
<c:url var="roomURL" value="/quan-tri/phong" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sơ đồ phòng</title>
</head>
<body>
	<div class="listRoom">
		

		<div class="listRoomMain">
			<form id="formSubmit" action="<c:url value = "/quan-tri/phong"/>">
				<div class="filterRoomType">

					<select id="roomTypes" name="roomTypeCode">
						<option value="all">--Tất cả--</option>
						<c:forEach items="${roomTypes}" var="roomType" > 
							<c:if test="${roomType.code == roomTypeCode}">
								<option value="${roomType.code }" selected>${roomType.name}</option>
							</c:if>
							<c:if test="${roomType.code != roomTypeCode}">
								<option value="${roomType.code }">${roomType.name}</option>
							</c:if>
							
						</c:forEach>
					</select>
				</div>
			</form>
			<div id="note">
				<h4 style="display: inline-block;">Trạng thái phòng</h4>
				<ul id="listNote">
					<c:forEach items="${listStatus}" var="status">
						<button class="btn btn-${status.btnStyle}">
							${status.name}</button>

					</c:forEach>
				</ul>
			</div>
			<ul id="listRoom">

				<c:forEach items="${allRoom}" var="room">
					<a href="<c:url value = "/quan-tri/phong?number=${room.number}"/>">
						<li data-id="${room.id}" data-check="false"
							class="btn btn-${room.status.btnStyle} availableRoom">
							<h4>${room.number}</h4>
							<p>Tầng ${room.floor}</p>
						</li>
					</a>






				</c:forEach>
			</ul>
		</div>
		


		
	</div>
	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			  $('#roomTypes').change(function() {
				 if ($(this).val() == "all") {
					window.location.href = '${roomURL}';
				}else{
					$('#formSubmit').submit();
				}
			   
			  });
		 });
	</script>
</body>
</html>