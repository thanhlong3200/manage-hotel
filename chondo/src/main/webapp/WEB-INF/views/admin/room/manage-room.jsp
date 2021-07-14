<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách phòng</title>
</head>
<body>
	<h3>Danh sách phòng</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Chỉnh sửa</th>
					<th scope="col">Phòng</th>
					<th scope="col">Tầng</th>
					<th scope="col">Loại phòng</th>		
					<th scope="col">Trạng thái</th>
				</tr>
			</thead>
			<tbody class="scrollDiv" >
				<c:forEach items="${allRoom}" var="room">
					<tr>
						<td style="line-height: 60px;"><a href="<c:url value='/quan-tri/phong/chinh-sua?number=${room.number}'/>"><i
								class="fa fa-edit"></i></a></td>
						<td style="line-height: 60px;">${room.number}</td>
						<td style="line-height: 60px;">${room.floor}</td>
						<td style="line-height: 60px;">${room.roomTypeName}</td>
						<td style="line-height: 60px;">${room.status.name}</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>
<div class="btn-control ml-2 mb-2"  style="padding-bottom:50px;">
		<a style="color: white; text-decoration: none;"
			href="<c:url value ="/quan-tri/phong/chinh-sua"/>"
			type="button" class="btn btn-info"> Thêm phòng <i
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