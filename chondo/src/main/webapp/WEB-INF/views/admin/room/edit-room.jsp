<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="roomAPI" value="/api/room" />
<c:url var="rooms" value="/quan-tri/quan-ly-phong" />
<c:url var="editRoom" value="/quan-tri/phong/chinh-sua" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phòng</title>
</head>
<body>
	<c:if test="${empty model.id}">
		<h3>Thêm phòng</h3>
	</c:if>
	<c:if test="${not empty model.id}">
		<h3>Chỉnh sửa phòng</h3>
	</c:if>
	<form:form id="formSubmit" modelAttribute="model" action=""
					cssStyle="width:50%;margin:auto; padding-bottom:50px;">		
					<label>Số phòng</label>
					<form:input path="number" placeholder="Số phòng" />
				
					<label>Tầng</label>
					<form:input path="floor" placeholder="Tầng" />			
					
					<form:select path="statusId"  style="margin-top:5px;" >
						<form:option value="">--Chọn trạng thái--</form:option>
						<form:options items="${listStatus}" itemValue="id" itemLabel="name"/>
					</form:select>
					
				
					<form:select path="roomTypeId"  style="margin-top:5px;" >
						<form:option value="">--Chọn loại phòng--</form:option>
						<form:options items="${listRoomType}" itemValue="id" itemLabel="name"/>
					</form:select>
					
					<form:select path="hotelId"  style="margin-top:5px;" >
						<form:option value="">--Chọn khách sạn--</form:option>
						<form:options items="${listHotel}" itemValue="id" itemLabel="location"/>
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
					addRoom(data);
				} else{
					editRoom(data);
				}
			});
			function editRoom(data) {
				$.ajax({
					url : '${roomAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
						window.location.href = '${rooms}';
					},
					error : function(error) {
						alert("Thành công");
						window.location.href = '${rooms}';

					}
				});
			}
			function addRoom(data) {
				$.ajax({
					url : '${roomAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
						window.location.href = '${rooms}';

					},
					error : function(error) {
						alert("Thành công");
						window.location.href = '${rooms}';

					}
				});
			}

		 
	})
	</script>
</body>
</html>