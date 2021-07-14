<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil" %>
<c:url var="searchAPI" value="/quan-tri/tim-kiem" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm phòng</title>

</head>
<body>
	<div class="searchPage">
		<div class="filter">
			<div class="booking-box">
				<div class="booking-form">
					<form:form id="formSubmit" action="${searchAPI}" method="get" modelAttribute="search">			
						
						<div class="b-date arrive mb-15">
							<form:input path="dateFrom" autocomplete="off" data-date-format="dd/mm/yyyy" class="date-picker"  placeholder="Ngày đến"/>
						</div>
						<div class="b-date departure mb-15">
							<form:input path="dateTo" autocomplete="off" data-date-format="dd/mm/yyyy" class="date-picker"  placeholder="Ngày đi"/>
						</div>
						<div class="mb-15">
							<form:select path="adult"  >
								<option disabled value="">Số lượng người lớn</option>
								<form:option value="1">1 người lớn</form:option>
								<form:option value="2">2 người lớn</form:option>
								<form:option value="3">3 người lớn</form:option>
								<form:option value="4">4 người lớn</form:option>
								<form:option value="5">5 người lớn</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="children"  >
								<option disabled value="">Số lượng trẻ em</option>
								<form:option value="0">0 trẻ em</form:option>
								<form:option value="1">1 trẻ em</form:option>
								<form:option value="2">2 trẻ em</form:option>
								<form:option value="3">3 trẻ em</form:option>
								<form:option value="4">4 trẻ em</form:option>
								<form:option value="5">5 trẻ em</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="roomCount"  >
								<option disabled value="">Số lượng phòng</option>
								<form:option value="1">1 phòng</form:option>
								<form:option value="2">2 phòng</form:option>
								<form:option value="3">3 phòng</form:option>
								<form:option value="4">4 phòng</form:option>
								<form:option value="5">5 phòng</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							 <form:select path="location"  >
								<option disabled value="">Địa điểm</option>
								<form:option value="Vũng Tàu">Vũng Tàu</form:option>
								<form:option value="Đà Lạt">Đà Lạt</form:option>
							</form:select>
						</div>
						<form:hidden path="page"/>
						<form:hidden path="limit"/>
						<div class="submit-form">
							<button id="searchRoom">Tìm phòng trống</button>
						</div>
					</form:form>
				</div>
			</div>
			
		</div>
		<div class="result">
			<h1 class="resultTitle">
				<c:if test="${search.totalItem == 0}">
					Không tìm thấy loại phòng phù hợp
				</c:if>
				<c:if test="${search.totalItem > 0}">
					Tìm thấy ${search.totalItem} loại phòng phù hợp
				</c:if>
			</h1>
			<div class="listResult">
				<c:forEach items="${model.listResult}" var="roomType">	
					<div class="room">
						<div class="container-fuild">
							<div class="row">
								<div class="col-md-3">
									<a id="roomType${roomType.id}" href = "" class="btnViewRoom">
										<img alt="" src="<c:url value='/template/web/images/room/${roomType.image}'/>">
									</a>
								</div>
								<div class="col-md-6">
									<a id="roomType${roomType.id}" href = "" class="h3 roomTitle btnViewRoom">${roomType.name} </br>${search.location}</a>
									<p style="font-size: 19px;">${roomType.acreage} m<sup>2</sup></p>
									<c:forEach items="${roomType.furnitures}" var="furnitures">
										<p>${furnitures.quality} ${furnitures.name}</p>
									</c:forEach>
									<h5 style="margin-top: 10px;font-weight:600;">Miễn phí</h5>
									<c:forEach items="${roomType.services}" var="service">
										<span style="margin:0px 10px 10px 0px;white-space:nowrap;display:inline-block;">
										${service.symbol} ${service.name}</span>
									</c:forEach>
								</div>	
								<div class="col-md-3">
									<div class="roomReview">
										<div class="roomReviewContent">
											<h4>${roomType.rank}</h4>
											<p>${roomType.rates.size()} đánh giá</p>
										</div>
										<div class="roomReviewBadge">${roomType.averageBadge}</div>
									</div>
									<div class="roomPrice">
										<p>${search.adult} người lớn 
											<c:if test="${search.children > 0}">
												, ${search.children} trẻ em
											</c:if>
										</p>
										<p>${search.nightCount} đêm</p>
										<p>${search.roomCount} phòng</p>
										<c:if test="${roomType.originalPrice != roomType.sellPrice}">
										 	<p style="text-decoration-line:line-through;">${PriceUtil.convert(roomType.originalPrice* search.nightCount * search.roomCount)} VND</p>						
										</c:if>
										<h4>${PriceUtil.convert(roomType.sellPrice * search.nightCount * search.roomCount)} VND</h4>
									</div>
									<a href="<c:url value='/quan-tri/loai-phong/danh-sach?roomTypeId=${roomType.id}'/>" class="btn btn-primary">Xem chi tiết</a>
									<a data-id="roomType${roomType.id}" href="" class="btn btn-success mt-10 btnViewRoom">Xem phòng trống</a>	
								</div>		
							</div>	
						</div>	
					</div>
				</c:forEach>	
					
				<ul id="pagination-demo" class="pagination-lg"></ul>
			</div>
		</div>
	</div>
	<script src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
	
		var totalPage = ${search.totalPage};
		var currentPage = ${search.page};
		var limit = ${search.limit};
		$('#pagination-demo').twbsPagination({
			totalPages: totalPage,
			visiblePages: 5,
			startPage : currentPage,
			onPageClick: function(event, page) {
				if (page!=currentPage) {
					$('#page').val(page);
					$('#limit').val(limit);
					$('#formSubmit').submit();
				}
			}
		});
		$('.btnViewRoom').on('click', function(event) {
			event.preventDefault();
			var idStr = $(this).attr('data-id');
			var roomTypeId = idStr.substring(8, idStr.length);
			$('#formSubmit').append("<input type ='hidden' name='roomTypeId' value = '" + roomTypeId + "'/>")
			$('#formSubmit').attr('action',"<c:url value='/quan-tri/tim-kiem/phong-trong'/>");
			$('#formSubmit').submit();
		});

	</script>
</body>
</html>