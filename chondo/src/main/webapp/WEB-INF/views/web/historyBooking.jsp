<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Booking</title>

</head>
<body>

	<form class="container" id="formSubmit" style="margin-top: 2rem;"
		action="<c:url value = "/quan-tri/lich-su-dat-phong"/>">
		<div class="search-form-booking ">
			<h5>Tìm kiếm booking</h5>


			<c:if test="${empty bookingCode}">
				<input id="searchInput" type="text" name="bookingCode"
					placeholder="Nhập mã booking" required />
			</c:if>
			<c:if test="${not empty bookingCode}">
				<input id="searchInput" type="text" name="bookingCode"
					placeholder="Nhập mã booking" value="${bookingCode}" required />
			</c:if>
		</div>
		<button id="searchBtn" type="submit" class="btn btn-primary">
			<i class="fas fa-search"></i>
		</button>
		<c:if test="${not empty bookingCode}">
			<a style="height: 45px; font-weight: 600; line-height: 45px;"
				href="<c:url value ="/quan-tri/booking?page=1&limit=2"/>"
				class="btn btn-light"> Trở về </a>
		</c:if>

		<input id="page" type="hidden" name="page" /> <input id="limit"
			type="hidden" name="limit" />



		<h3 style="margin-top: 2rem;">Lịch sử Booking</h3>

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
						<th scope="col">Trạng thái</th>
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
							<td style="line-height: 60px;">${booking.status.name}</td>
							<td style="line-height: 60px;"><a
								href="<c:url value ="/chi-tiet-dat-phong?id=${booking.id}"/>">Xem</a></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>
		<ul id="pagination-demo" class="pagination-lg"></ul>
	</form>
	<%-- <div class="btn-control ml-2 mb-2">
		<button type="button" class="btn btn-danger">
			Xóa<i class="fa fa-trash ml-2"></i>
		</button>
		<button type="button" class="btn btn-danger">
			Xóa tất cả<i class="fa fa-trash  ml-2"></i>
		</button>
		<a style="color: white; text-decoration: none;"
			href="<c:url value ="/view/admin/product/add-product.jsp"/>"
			type="button" class="btn btn-info"> Thêm loại phòng <i
			class="fa fa-plus ml-2"></i>
		</a>
	</div>
 --%>

	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		var totalPage = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = ${model.limit};
		$('#pagination-demo').twbsPagination({
			totalPages: totalPage,
			visiblePages: 5,
			startPage : currentPage,
			onPageClick: function(event, page) {
				$('#searchInput').attr('name','');
				if (page!=currentPage) {
					$('#page').val(page);
					$('#limit').val(limit);
					$('#formSubmit').submit();
				}
			}
		});
		$('#searchBtn').on('click', function(event) {
			$('#searchInput').attr('name','bookingCode');
			$('#page').val(${model.page});
			$('#limit').val(${model.limit});
		});
	</script>
</body>
</html>