<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tình hình đặt phòng</title>
</head>
<body>
	<h3>Tình hình đặt phòng</h3>
	<div class="reservation">
		<form id="formSubmit" action="<c:url value = "/quan-tri/tinh-hinh-dat-phong"/>" style="margin-bottom:20px;">
			<c:if test="${not empty date }">
				<input id="dateFromPayment" autocomplete="off" name="date"
				data-date-format="dd/mm/yyyy" class="date-picker" type="text"
				placeholder="Chọn ngày" value="${date }" style="width:150px;" required>
			</c:if>
			<c:if test="${empty date }">
				<input id="dateFromPayment" autocomplete="off" name="date"
				data-date-format="dd/mm/yyyy" class="date-picker"  style="width:150px;" type="text"
				placeholder="Chọn ngày" required>
			</c:if>
			<input id="page" type="hidden" name="page" value="${model.page}"/>
			<input id="limit" type="hidden" name="limit" value="${model.limit}"/>
			<input style="width: 70px;" type ="submit" value="Lọc"/>
			<select id="bookingStatus" name= "status" style="width: 120px;">
				<option value="checkin">Check-in</option>
				<option value="checkout">Check-out</option>
			</select>
			
			
			<h3>Danh sách Booking</h3>
			
			<div class="scrollDiv">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<!-- <th scope="col">Xóa</th> -->
							<!-- <th scope="col">Cập nhật</th> -->
							<th scope="col">Mã</th>
							<th scope="col">Nhận phòng</th>
							<th scope="col">Trả phòng</th>
							<th scope="col">Số phòng</th>
							<th scope="col">Người lớn</th>
							<th scope="col">Trẻ em</th>
							<th scope="col">Lịch sử</th>
							<th scope="col">Liên hệ</th>
							<th scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody class="scrollDiv">
						<c:forEach items="${model.listResult}" var="booking">
							<tr>
								<!-- <td style="line-height: 60px;"><input type="checkbox"
									name="delete"></td> -->
							<!-- 	<td style="line-height: 60px;"><a href=""><i
										class="fa fa-edit"></i></a></td> -->
								<td style="line-height: 60px;">${booking.code}</td>
								<td style="line-height: 60px;">${booking.dateFrom}</td>
								<td style="line-height: 60px;">${booking.dateTo}</td>
								<td style="line-height: 60px;">${booking.roomCount}</td>
								<td style="line-height: 60px;">${booking.adult}</td>
								<td style="line-height: 60px;">${booking.children}</td>
								<td style="line-height: 60px;">${booking.logs}</td>
								<td style="line-height: 60px;"><a
									href="<c:url value ="/quan-tri/xac-nhan-booking?code=${booking.code}"/>">Liên hệ</a></td>
								<td style="line-height: 60px;"><a
									href="<c:url value ="/quan-tri/booking?id=${booking.id}"/>">Xem</a></td>
							</tr>
		
						</c:forEach>
		
					</tbody>
				</table>
				<ul id="pagination-demo" class="pagination-lg"></ul>
			</div>		
		</form>
		
	</div>
	<script src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		var totalPage = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = ${model.limit};
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
		 $('#bookingStatus').change(function() {
				$('#formSubmit').submit();
		  });
		 $('#bookingStatus option').each(function(){
				if ($(this).val() == '${statusCode}') {
					$(this).attr("selected","selected");
				}
				
			})
	</script>
</body>
</html>