<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomTypeAPI" value="/api/roomType" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loại phòng</title>
</head>
<body>
	<c:if test="${empty model.id}">
		<h3>Thêm loại phòng</h3>
	</c:if>
	<c:if test="${not empty model.id}">
		<h3>Chỉnh sửa loại phòng</h3>
	</c:if>
	<form:form id="formSubmit" modelAttribute="model" action=""
					cssStyle="width:50%;margin:auto; padding-bottom:50px;">		
					<label>Tên</label>
					<form:input path="name" placeholder="Tên" />
					<label>Mã</label>
					<form:input path="code" placeholder="Mã" />			
					<label>Diện tích</label>
					<form:input path="acreage" placeholder="Diện tích"  />		
					<label>Sức chứa</label>
					<form:input path="capacity" placeholder="Sức chứa"  />
					<label>Link hình ảnh</label>
					<form:input path="image" placeholder="Link hình ảnh" />
					<label>Gía gốc (VND/đêm)</label>
					<form:input path="originalPrice" placeholder="Gía gốc"  />
					<label>Gía đặt (VND/đêm)</label>
					<form:input path="sellPrice" placeholder="Gía đặt"  />	
					<label>Hình thức thanh toán</label>
					<form:select path="prepayment"  >
						<form:option value="">--Chọn hình thức thanh toán--</form:option>
						<form:option value="1">Trả trước (trước khi nhận phòng)</form:option>
						<form:option value="0">Trả sau (khi trả phòng)</form:option>
					</form:select>
					
					<form:hidden path="id"/>
					
					<c:if test="${empty model.id}">
						<button type= ""id="btnEdit">Thêm</button>
					</c:if>
					<c:if test="${not empty model.id}">
						<button type= ""id="btnEdit">Cập nhật</button>
					</c:if>
					
				</form:form>
	<script type="text/javascript">
	$().ready(function (){
			$('#btnEdit').on('click', function(event) {
		
				event.preventDefault();
				var data = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;
				});
				if ($('#id')==null) {
					addRoomType(data);
				} else{
					editRoomType(data);
				}
			});
			function editRoomType(data) {
				$.ajax({
					url : '${roomTypeAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
					},
					error : function(error) {
						alert("Thất bại");
					}
				});
			}
			function addRoomType(data) {
				$.ajax({
					url : '${roomTypeAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
					},
					error : function(error) {
						alert("Thất bại");
					}
				});
			}

		 
	})
	</script>
</body>
</html>