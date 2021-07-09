<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doanh thu dịch vụ</title>

</head>
<body>
	<a href="<c:url value='/quan-tri/doanh-so/hoa-don'/>">
		<button class="btn btn-primary">Doanh số hóa đơn</button>
	</a>
	<a href="<c:url value='/quan-tri/doanh-so/tien-phong'/>">
		<button class="btn btn-primary">Doanh số tiền phòng</button>
	</a>
	<a href="<c:url value='/quan-tri/doanh-so/dich-vu'/>">
		<button class="btn btn-primary">Doanh số dịch vụ</button>
	</a>
	<form id="formSubmit" action="<c:url value = "/quan-tri/doanh-so/dich-vu"/>">
		<div class="b-date arrive mb-15">
			<input id="dateFromPayment" autocomplete="off" name="dateFrom"
				data-date-format="dd/mm/yyyy" class="date-picker" type="text"
				placeholder="Từ ngày"  value="${dateFrom }" style="width: 200px; margin-top:20px;" required>
		</div>
		<div class="b-date departure mb-15">
			<input id="dateToPayment" autocomplete="off" name="dateTo"
				data-date-format="dd/mm/yyyy" class="date-picker" type="text"
				placeholder="Đến ngày" value="${dateTo }"  style="width: 200px;" required>
		</div>
		<input style="width: 70px;" type ="submit" value="Lọc"/>
	</form>

	<h3>Doanh thu dịch vụ</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>

					<th scope="col">Tên dịch vụ</th>
					<th scope="col">Ngày lập</th>
					<th scope="col">Gía dịch vụ</th>	
					<th scope="col">Miễn phí</th>
					<th scope="col">Tổng tiền</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<td style="line-height: 60px;"></td>
					<td style="line-height: 60px;">Tổng tiền: </td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalPriceService + total.totalPriceServiceFree)}</td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalPriceServiceFree)}</td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalPriceService)}</td>
	
				</tr>
				<c:forEach items="${model}" var="bookedService">
				
					<tr>

						<td style="line-height: 60px;">${bookedService.service.name}</td>
						<td style="line-height: 60px;">${bookedService.createdDate}</td>
						<td style="line-height: 60px;">${PriceUtil.convert(bookedService.service.price)}</td>
						
						<c:if test="${bookedService.free == 1}">
							<td style="line-height: 60px;">Miễn phí</td>
						</c:if>
						<c:if test="${bookedService.free == 0}">
							<td style="line-height: 60px;">Không</td>
						</c:if>
						
					
						<c:if test="${bookedService.free == 1}">
							<td style="line-height: 60px;">0</td>
						</c:if>
						<c:if test="${bookedService.free == 0}">
							<td style="line-height: 60px;">${PriceUtil.convert(bookedService.service.price)}</td>
						</c:if>
						
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>