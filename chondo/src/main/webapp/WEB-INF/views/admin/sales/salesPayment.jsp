<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doanh thu hóa đơn</title>

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
	<form id="formSubmit" action="<c:url value = "/quan-tri/doanh-so/hoa-don"/>">
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

	<h3>Doanh thu hóa đơn</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<!-- <th scope="col">Xóa</th> -->
					<!-- <th scope="col">Cập nhật</th> -->
					<th scope="col">Mã</th>
					<th scope="col">Khách hàng</th>
					<th scope="col">Ngày lập</th>
					<th scope="col">Tiền phòng</th>
					<th scope="col">Dịch vụ</th>
					<th scope="col">Hoàn tiền</th>
					<th scope="col">Tổng tiền</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<td style="line-height: 60px;"></td>
					<td style="line-height: 60px;"></td>
					<td style="line-height: 60px;">Tổng tiền: </td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalPriceBooked)}</td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalPriceService)}</td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalRefund)}</td>
					<td style="line-height: 60px;">${PriceUtil.convert(total.totalSales)}</td>
				</tr>
				<c:forEach items="${model}" var="payment">
					<tr>
						<!-- <td style="line-height: 60px;"><input type="checkbox"
							name="delete"></td> -->
					<!-- 	<td style="line-height: 60px;"><a href=""><i
								class="fa fa-edit"></i></a></td> -->
						<td style="line-height: 60px;">${payment.booking.code}</td>
						<td style="line-height: 60px;">${payment.booking.customer.firstName} ${payment.booking.customer.lastName}</td>
						<td style="line-height: 60px;">${payment.createdDate}</td>
						<td style="line-height: 60px;">${PriceUtil.convert(payment.booking.sellPriceBooked)}</td>
						<td style="line-height: 60px;">${PriceUtil.convert(payment.booking.priceService)}</td>

						<c:if test="${payment.refund == 1}">
							<td style="line-height: 60px;">Hoàn 50%</td>
						</c:if>
						<c:if test="${payment.refund== null}">
							<td style="line-height: 60px;">Không</td>
						</c:if>
						<td style="line-height: 60px;">${PriceUtil.convert(payment.booking.totalPrice)}</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>