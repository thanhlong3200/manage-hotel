<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="searchController" value="/quan-tri/tim-kiem" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm phòng</title>

</head>
<body>
	<div class="homeAdmin">
		<div class="booking-form">
			<form id="formSubmit" action="${searchController}" method="get">
				<h3>TÌM PHÒNG</h3>
				<div class="b-date arrive mb-15">
					<input id="dateFrom" autocomplete="off" name="dateFrom"
						data-date-format="dd/mm/yyyy" class="date-picker" type="text"
						placeholder="Ngày đến">
				</div>
				<div class="b-date departure mb-15">
					<input id="dateTo" autocomplete="off" name="dateTo"
						data-date-format="dd/mm/yyyy" class="date-picker" type="text"
						placeholder="Ngày đi">
				</div>
				<div class="mb-15">
					<select id="adult" name="adult" class="">
						<option value="0" disabled>Số người lượng lớn</option>
						<option value="1" selected>1 người lớn</option>
						<option value="2">2 người lớn</option>
						<option value="3">3 người lớn</option>
						<option value="4">4 người lớn</option>
						<option value="5">5 người lớn</option>
					</select>
				</div>
				<div class="mb-15">
					<select id="children" name="children" class="">
						<option value="" disabled>Số lượng trẻ em</option>
						<option value="0" selected>0 trẻ em</option>
						<option value="1">1 trẻ em</option>
						<option value="2">2 trẻ em</option>
						<option value="3">3 trẻ em</option>
						<option value="4">4 trẻ em</option>
						<option value="5">5 trẻ em</option>
					</select>
				</div>
				<div class="mb-15">
					<select id="roomCount" name="roomCount" class="">
						<option value="" disabled>Số lượng phòng</option>
						<option value="1" selected>1 phòng</option>
						<option value="2">2 phòng</option>
						<option value="3">3 phòng</option>
						<option value="4">4 phòng</option>
						<option value="5">5 phòng</option>
					</select>
				</div>
				<div class="mb-15">
					<select id="location" name="location" class="">
						<option value="1" disabled>Địa điểm</option>
						<option value="Vũng Tàu" selected>Vũng Tàu</option>
						<option value="Đà Lạt">Đà Lạt</option>
					</select>
				</div>
				<input type="hidden" name="page" value="1" /> <input type="hidden"
					name="limit" value="2" />
				<div class="submit-form">
					<button id="searchRoom">Tìm phòng trống</button>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			var today = new Date(); 
			var tomorrow = new Date(); 
			tomorrow.setDate(today.getDate()+1);
			$("#dateFrom").datepicker('setDate', today);
			$("#dateTo").datepicker('setDate', tomorrow);
	     
		})

	
	</script>
</body>
</html>