<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomtypeAPI" value="/api/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tình hình đặt phòng</title>
</head>
<body>
	<h3>Tình hình đặt phòng</h3>
	<div class="reservation">
		<form id="formSubmit" action="<c:url value = "/quan-tri/tinh-hinh-dat-phong"/>" style="padding-left:25px;margin-bottom:20px;">
			<c:if test="${not empty date }">
				<input id="dateFrom" autocomplete="off" name="date"
				data-date-format="dd/mm/yyyy" class="date-picker" type="text"
				placeholder="Chọn ngày" value="${date }">
			</c:if>
			<c:if test="${empty date }">
				<input id="dateFrom" autocomplete="off" name="date"
				data-date-format="dd/mm/yyyy" class="date-picker" type="text"
				placeholder="Chọn ngày">
			</c:if>

			<input id="submit" type="submit" value="Lọc"/>
		</form>
	</div>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<!-- <th scope="col">Xóa</th> -->
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Phòng</th>
					<th scope="col">Tầng</th>
					<th scope="col">Trạng thái</th>		
					
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${listRooms}" var="room">
					<tr>
						<!-- <td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td> -->
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${room.number}</td>
						<td style="line-height: 60px;">${room.floor}</td>
						<td style="line-height: 60px;">${room.status.name}</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
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
		
	</script>
</body>
</html>