<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết loại phòng</title>
</head>
<body>


<div class="roomDetailsPage">
		<div class="mainRoomDetails">
			<c:forEach items="${model.listResult}" var="roomType">	
				<a href="<c:url value='/quan-tri/loai-phong/chinh-sua?roomTypeId=${roomType.id}'/>" style="font-size:30px;padding:0px 50px"><i class="fa fa-edit">Chỉnh sửa</i></a>
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
				
				<h3 style="margin-top:20px;">Đánh giá</h3>
				<h4>Số lượt đánh giá: ${roomType.rates.size()}</h4>
				<h4>Đánh giá trung bình: ${roomType.averageBadge}</h4>
				<h4>Độ hài lòng: ${roomType.rank}</h4>
				
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