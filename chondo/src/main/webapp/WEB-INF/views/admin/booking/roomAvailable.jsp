<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="bookingAPI" value="/api/booking" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chọn phòng</title>
</head>
<body>
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

				<c:forEach items="${availableRoom}" var="available">

					<li data-id="${available.id}" data-check="false"
						class="btn btn-success availableRoom">
						<h4>${available.number}</h4>
						<p>Tầng ${available.floor}</p>
					</li>







				</c:forEach>
			</ul>
		</div>
		


		<div class="room-booking ptb-30 white_bg">
			<div class="container" style="width: 100%;">
				<h1 style="font-weight: 600;" class="text-center mb-20">Đặt
					phòng</h1>
				<div class="row">
					<div class="col-md-12">
						<div class="booking-rooms-tab">
							<ul class="nav" role="tablist">
								<li class="active"><a href="#booking" data-toggle="tab"><span
										class="tab-border">1</span><span>Thông tin phòng</span></a></li>
								<li><a href="#personal" data-toggle="tab"><span
										class="tab-border">2</span><span>Thông tin cá nhân</span></a></li>
								<c:if test="${roomType.prepayment == 1}">
									<li><a href="#payment" data-toggle="tab"><span
											class="tab-border">3</span><span>Thanh Toán</span></a></li>
								</c:if>
								<c:if test="${roomType.prepayment == 0}">
									<li><a href="#payment" data-toggle="tab"><span
											class="tab-border">3</span><span>Thanh Toán</span></a></li>
								</c:if>


								<li><a href="#done" data-toggle="tab"><span
										class="tab-border">4</span><span>Hoàn tất</span></a></li>
							</ul>
						</div>




						<form action="" id="bookingForm">
							<div class="service-tab-desc text-left mt-60">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="booking">
										<div class="booking-info-deatils">


											<input id="roomTypeId" type="hidden" value="${roomType.id}">

											<div class="room" stype="width:95%;">
												<div class="container-fuild">
													<div class="row">
														<div class="col-md-3">
															<a id="roomType${roomType.id}" class="btnViewRoom"> <img
																alt=""
																src="<c:url value='/template/web/images/room/${roomType.image}'/>">
															</a>
														</div>
														<div class="col-md-6">
															<p id="roomType${roomType.id}"
																class="h3 roomTitle btnViewRoom">${roomType.name}
																</br>${search.location}</p>
															<p style="font-size: 19px;">${roomType.acreage}
																m<sup>2</sup>
															</p>
															<c:forEach items="${roomType.furnitures}"
																var="furnitures">
																<p>${furnitures.quality}${furnitures.name}</p>
															</c:forEach>
															<h5 style="margin-top: 10px; font-weight: 600;">Miễn
																phí</h5>
															<c:forEach items="${roomType.services}" var="service">
																<span
																	style="margin: 0px 10px 10px 0px; white-space: nowrap; display: inline-block;">
																	${service.symbol} ${service.name}</span>
															</c:forEach>
														</div>
														<div class="col-md-3">
															<div class="roomReview">
																<div class="roomReviewContent">
																	<h4>${roomType.rank}</h4>
																	<p>${roomType.rates.size()}đánh giá</p>
																</div>
																<div class="roomReviewBadge">${roomType.averageBadge}</div>
															</div>
															<div class="roomPrice">
																<p>${search.dateFrom}-${search.dateTo}</p>
																<p>${search.adult}
																	người lớn
																	<c:if test="${search.children > 0}">
																				, ${search.children} trẻ em
																			</c:if>
																</p>
																<p>${search.nightCount} đêm</p>
																<p>${search.roomCount} phòng</p>
																<c:if
																	test="${roomType.originalPrice != roomType.sellPrice}">
																	<p style="text-decoration-line: line-through;">${PriceUtil.convert(roomType.originalPrice* search.nightCount * search.roomCount)}
																		VND</p>
																</c:if>
																<h4>${PriceUtil.convert(roomType.sellPrice * search.nightCount * search.roomCount)}
																	VND</h4>
																<c:forEach items="${roomType.refunds}" var="refund">
																	<p>Huỷ trước ${refund.preDayCheckIn} ngày hoàn
																		${refund.percent}%</p>
																</c:forEach>
															</div>
															
															<button onclick="information()" style="height: 60px;"
																href="" class="btn btn-primary">Kế tiếp</button>
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="personal">
										<div class="personal-info-details">
											<div class="booking-info-inner">
												<input type="hidden" name="dateFrom"
													value="${dateFromBooking}" /> <input type="hidden"
													name="dateTo" value="${dateToBooking}" /> <input
													type="hidden" name="roomCount" value="${search.roomCount}" />
												<input type="hidden" name="adult" value="${search.adult}" />
												<input type="hidden" name="children"
													value="${search.children}" /> <input type="hidden"
													id="location" value="${search.location}" />

												<div class="booking-form-list">
													<div class="single-form-part">
														<div class="name mb-15">
															<input class="mb-10" id="firstName" type="text" placeholder="Họ" style="width:100%;"> 
															<input class="mb-10" id="lastName" type="text" placeholder="Tên" style="width:100%;"> 
															<input class="mb-10" id="email" type="text" placeholder="Email" style="width:100%;">
															<input class="mb-10" id="phone" type="number" placeholder="Số điện thoại" style="width:100%;">
														</div>
														<div class="mt-20">
														<button onclick="roomTypeInfor()"
																style="height: 60px; float: left;" href=""
																class="btn btn-secondary">Trở lại</button>
															<button onclick="payment()"
																style="height: 60px; float: right;" href=""
																class="btn btn-primary">Kế tiếp</button>
														</div>
													</div>

												</div>


											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="payment">
										<div class="payment-info">
											<h3 style="text-align: center;">Qúy khách sẽ thanh toán
												sau khi trả phòng</h3>
											<div class="mt-20">
												<button onclick="information()"  style="height: 60px; float: left;"
													href="" class="btn btn-secondary">Trở lại</button>
												<button onclick="done()"  style="height: 60px; float: right;"
													href="" class="btn btn-primary">Kế tiếp</button>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="done">
										<div class="booking-done">
										<h3 style="text-align: center;">Hoàn tất đặt phòng</h3>
											<button onclick="payment()"
																style="height: 60px; float: left;" href=""
																class="btn btn-secondary">Trở lại</button>
											<button id="submit" style="height: 60px; float: right;"
													href="" class="btn btn-primary">Hoàn tất</button>
										</div>
									</div>
								</div>
							</div>
						</form>






					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		$('.booking-rooms-tab ul li').on('click', function(event) {
			$('.booking-rooms-tab ul li').removeClass('active');
			$('.tab-pane').removeClass('active');
			$(this).addClass('active');
		});
		$('.chooseRoom button').on('click', function(event) {
			event.preventDefault();
		});
		function roomTypeInfor() {
			$('.booking-rooms-tab ul li').removeClass('active');
			$('.tab-pane').removeClass('active');
			$('.booking-rooms-tab ul li:nth-child(1)').addClass('active');
			$('.tab-pane:nth-child(1)').addClass('active');
		}
		function information() {
			$('.booking-rooms-tab ul li').removeClass('active');
			$('.tab-pane').removeClass('active');
			$('.booking-rooms-tab ul li:nth-child(2)').addClass('active');
			$('.tab-pane:nth-child(2)').addClass('active');
		}
		function payment(e) {

			$('.booking-rooms-tab ul li').removeClass('active');
			$('.tab-pane').removeClass('active');
			$('.booking-rooms-tab ul li:nth-child(3)').addClass('active');
			$('.tab-pane:nth-child(3)').addClass('active');
		}
		
		function done(e) {
			$('.booking-rooms-tab ul li').removeClass('active');
			$('.tab-pane').removeClass('active');
			$('.booking-rooms-tab ul li:nth-child(4)').addClass('active');
			$('.tab-pane:nth-child(4)').addClass('active');
		}

		$('#submit').on('click', function checkRoom(event) {
			event.preventDefault();
			if (maxRoom > 0) {
				alert('Vui lòng chọn phòng !');
			} else {
				var data = {};
				var formData = $('#bookingForm').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				data["customer"] = {
					"firstName" : $('#firstName').val(),
					"lastName" : $('#lastName').val(),
					"email" : $('#email').val(),
					"phone" : $('#phone').val()
				};
				data["roomType"] = {
					"id" : $('#roomTypeId').val()
				};
				data["hotel"] = {
					"location" : $('#location').val()
				};
				var ids = [];
				var indexID = 0;
				$('#listRoom li').each(function( index, element ) {
					if ($(element).attr('data-check') == 'true') {
						ids[indexID] = parseInt($(element).attr('data-id'));
						indexID++;
					}
				});
				data["ids"] = ids;
				console.log(data);
				booking(data);
			}
			
		});
		function booking(data) {
			$.ajax({
				url : '${bookingAPI}',
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

		var maxRoom = ${search.roomCount}
		$('.review').html($('#review').val());
		$('#allImage li img').on('click', function(event) {
			var src = $(this).attr('src');
			$('#mainImage').attr('src', src);
		});
		$('#mainServiceImage').attr('src',
				$('#allServiceImage li img').first().attr('src'));
		$('#allServiceImage li img').on('click', function(event) {
			var src = $(this).attr('src');
			$('#mainServiceImage').attr('src', src);
		});

		$('.availableRoom').on('click', function(event) {
			var checked = $(this).attr('data-check');
			if (checked == 'false' && maxRoom != 0) {
				$(this).addClass('booked');
				$(this).attr('data-check', 'true');
				maxRoom--;
				console.log(maxRoom);
			} else if (checked == 'true') {
				$(this).removeClass('booked');
				$(this).attr('data-check', 'false');
				maxRoom++;
				console.log(maxRoom);
			}
		});
	</script>
</body>
</html>