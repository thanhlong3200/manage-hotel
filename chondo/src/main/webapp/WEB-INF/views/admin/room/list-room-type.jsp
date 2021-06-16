<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách loại phòng</title>
</head>
<body>
	<h3>Danh sách loại phòng</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Xóa</th>
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Tên</th>
					<th scope="col">Diện tích</th>
					<th scope="col">Hình ảnh</th>		
					<th scope="col">Gía đặt</th>
					<th scope="col">Gía gốc</th>
					<th scope="col">Sức chứa</th>
					<th scope="col">Chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${model.listResult}" var="roomType">
					<tr>
						<td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td>
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${roomType.name}</td>
						<td style="line-height: 60px;">${roomType.acreage} m<sup>2</sup></td>
						<td><img style="width: 60px; height: 60px;" alt=""
							src="<c:url value='/template/web/images/room/${roomType.image}'/>"></td>		
						<td style="line-height: 60px;">${PriceUtil.convert(roomType.sellPrice)}</td>
						<td style="line-height: 60px;">${PriceUtil.convert(roomType.originalPrice)}</td>
						<td style="line-height: 60px;">${roomType.capacity}</td>
						<td style="line-height: 60px;"><a
							href="<c:url value ="/quan-tri/loai-phong/danh-sach?roomTypeId=${roomType.id}"/>">Xem</a></td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
	<div class="btn-control ml-2 mb-2">
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


<form id="formSubmit" action="<c:url value = "/quan-tri/loai-phong/danh-sach"/>">
	<input id="page" type="hidden" name="page"/>
	<input id="limit" type="hidden" name="limit"/>
	<ul id="pagination-demo" class="pagination-lg"></ul>
</form>
	

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
		
	</script>
</body>
</html>