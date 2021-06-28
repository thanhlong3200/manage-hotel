<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách phân công</title>
</head>
<body>
	<h3>Danh sách phân công công việc</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<!-- <th scope="col">Xóa</th> -->
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Nhân viên</th>
					<th scope="col">Phòng</th>
					<th scope="col">Công việc</th>		
					<th scope="col">Giờ giao</th>	
					<th scope="col">Trạng thái</th>	
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${model.listResult}" var="assign">
					<!-- <tr>
						<td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td> -->
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${assign.staff.fullname}</td>
						<td style="line-height: 60px;">${assign.room.number}</td>	
						<td style="line-height: 60px;">${assign.task.name}</td>
						<td style="line-height: 60px;">${assign.createdDate}</td>
						<td style="line-height: 60px;">
							<c:if test="${assign.done == 0}">Chưa xong</c:if>
							<c:if test="${assign.done == 1}">Đã xong</c:if>
						</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
	


<form id="formSubmit" action="<c:url value = "/quan-tri/phan-cong"/>">
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