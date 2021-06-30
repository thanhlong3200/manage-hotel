	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="serviceDetails" value="/quan-tri/dich-vu" />
<c:url var="serviceAPI" value="/api/service" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết dịch vụ</title>
</head>
<body>
	<div class= "booking-details">
		<div class= "booking-information col-3">
			<h3>Chi tiết dịch vụ</h3>
			<p>Mã : ${service.code}</p>
			<p>Tên : ${service.name}</p>
			<p>Gía : ${PriceUtil.convert(service.price)} VND</p>
		</div>

		<button class="btn btn-primary btnChooseRoom">Sử dụng dịch vụ</button>
		<div class="popupChooseRoom" style ="overflow-y:scroll;padding-bottom:45px;">

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
		
						<c:forEach items="${listRooms}" var="room">
			
							<li data-id="${room.id}" data-check="false"
								class="btn btn-${room.status.btnStyle } availableRoom" style="width:188px;">
								<h4>${room.number}</h4>
								<p>Tầng ${room.floor}</p>
							</li>
		
						</c:forEach>
					</ul>
					
					<button class="btn btn-danger" id="saveChangeRoom">Lưu</button>
				
					
					
				</div>
			</div>	
							
						
						
		</div>
	</div>
	<script type="text/javascript">

		var maxRoom;
		$('.btnChooseRoom').on('click', function(event) {
			event.preventDefault();
					
			$('.popupChooseRoom').addClass('appear');	
					
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
					roomId = $(this).attr('data-id');
					$(this).css('pointer-events','none');
				}
				
			})
			
			var data = {};
			data["id"] = roomId;
			data["code"] = '${service.code}';
			console.log(data);
			createService(data);
			
		
		});

		function createService(data) {
			$.ajax({
				url : '${serviceAPI}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Thành công");
					window.location.href = '${serviceDetails}?code=' +result["code"];
				},
				error : function(error) {
					alert("Thất bại");
				}
			});
		}
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
		
		
		
	</script>
</body>
</html>