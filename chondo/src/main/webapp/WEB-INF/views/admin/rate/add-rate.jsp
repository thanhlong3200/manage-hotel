<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="voteAPI" value="/api/rate" />
<c:url var="bookingDetails" value="/quan-tri/booking" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đánh giá</title>
</head>
<body>

	<h3>Thêm đánh giá</h3>

	<form id="formSubmit" action="" style="width:50%;margin:auto; padding-bottom:50px;">		
					<label>Bình luận</label>
					<textarea rows="5" cols="20" name="comment"></textarea>
					
					<label>Đánh giá</label>
					<select name="vote">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
		
		
					<input type="hidden" value="${roomTypeId}" name="roomTypeId"/>
					
								
					
		
					<button type= ""id="btnEdit">Thêm</button>
		
					
					
				</form>
	<script type="text/javascript">
	$().ready(function (){
			$('#btnEdit').on('click', function(event) {
		
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				console.log(data);
				vote(data);
				
			});
			
			function vote(data) {
				$.ajax({
					url : '${voteAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
						window.location.href = '${bookingDetails}?id=' + ${bookingId};

					},
					error : function(error) {
						alert("Thành công");
						window.location.href = '${bookingDetails}?id=' + ${bookingId};
					}
				});
			}

		 
	})
	</script>
</body>
</html>