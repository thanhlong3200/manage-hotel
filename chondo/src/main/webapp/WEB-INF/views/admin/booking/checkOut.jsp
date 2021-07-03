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
<title>Check-out</title>
</head>
<body>
	<div class="" style ="overflow-y:scroll;padding-bottom:45px;">

			<div class="chooseRoom">
	
				<div class="mainAvailableRoom">
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
		
						<c:forEach items="${listRooms}" var="room">
							<c:if test="${room.status.code == 'owned'}">
								<a href="<c:url value='/quan-tri/check-out?id=${room.id}'/>">
									<li class="btn btn-${room.status.btnStyle } availableRoom" style="width:188px;">
										<h4>${room.number}</h4>
										<p>Tầng ${room.floor}</p>
									</li>	
								</a>
							</c:if>
						</c:forEach>
					</ul>
	
				</div>
			</div>	
							
						
						
		</div>
		
</body>
</html>