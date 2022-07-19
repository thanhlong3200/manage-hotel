<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="verifyAPI" value="/api/verify" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ký đơn hàng</title>
</head>
<body>
	<div class="container" style="width: 35%; padding: 50px 0px 100px 0px;">
		<h2 style="text-align: center;">Ký đơn hàng</h2>
		<div class="login-form">
			<div class="main-div">
				<form action="" id="formSubmit">
					<div class="form-group">
						<input type="text" class="form-control" value="${code}" name="code"
							name="code" readonly>
					</div>
					<div class="form-group">
						<textarea class="form-control" name="signature"
							placeholder="Chữ ký"></textarea>
					</div>
					<div class="form-group">
						<textarea class="form-control" name="publickey"
							placeholder="Khóa công khai"></textarea>
					</div>
					<button id="btnSubmit" type="button" class="btn btn-primary"
						style="text-align: center;">Ký đơn hàng</button>
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$().ready(function() {
			$('#btnSubmit').on('click', function(event) {
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				console.log(data);
				verify(data);
			});

			function verify(data) {
				$.ajax({
					url : '${verifyAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					success : function(result) {
						if(result == "true"){
							alert("Đặt phòng thành công!");
							window.location.href = "http://localhost:8080/chondo/trang-chu";
						}else{
							alert("Thất bại!");
						}
					},
					error : function(error) {
						alert("Lỗi!");
					}
				});
			}
		})
	</script>
</body>
</html>