<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách dịch vụ</title>

</head>
<body>
		
<form id="formSubmit" action="<c:url value = "/quan-tri/dich-vu"/>">
	
	<input id="page" type="hidden" name="page"/>
	<input id="limit" type="hidden" name="limit"/>
	
	

	<h3>Danh sách dịch vụ</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Tên</th>
					<th scope="col">Gía</th>
					<th scope="col">Chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${services}" var="service">
					<tr>
						<td style="line-height: 60px;">${service.name}</td>
						<td style="line-height: 60px;">${PriceUtil.convert(service.price)} VND</td>
						<td style="line-height: 60px;"><a
							href="<c:url value ="/quan-tri/dich-vu?code=${service.code}"/>">Xem</a></td>
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