<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách khách hàng</title>

</head>
<body>
		
<form id="formSubmit" action="<c:url value = "/quan-tri/khach-hang"/>">
	<input id="page" type="hidden" name="page"/>
	<input id="limit" type="hidden" name="limit"/>

	<h3>Danh sách khách hàng</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<!-- <th scope="col">Xóa</th> -->
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Họ tên</th>
					<th scope="col">Giới tính</th>
					<th scope="col">Số điện thoại</th>
					<th scope="col">CMND</th>
					<th scope="col">Email</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${model.listResult}" var="customer">
					<tr>
						<!-- <td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td> -->
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${customer.firstName} ${customer.lastName}</td>
						<td style="line-height: 60px;">${customer.gender}</td>
						<td style="line-height: 60px;">${customer.phone}</td>
						<td style="line-height: 60px;">${customer.cmnd}</td>
						<td style="line-height: 60px;">${customer.email}</td>

					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
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
				$('#searchInput').attr('name','');
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