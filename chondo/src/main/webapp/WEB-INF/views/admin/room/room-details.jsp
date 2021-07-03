<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="assignAPI" value="/api/assign" />
<c:url var="roomURL" value="/quan-tri/phong" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phòng ${room.number}</title>
</head>
<body>
	<h2>Phòng ${room.number}</h2>

		<div class="listRoom">


			<div class="listRoomMain">



				<div id="note">
					<h4 style="display: inline-block;">Trạng thái nhân viên</h4>
					<ul id="listNote">
						<c:forEach items="${listStatus}" var="status">
							<button class="btn btn-${status.btnStyle}">
								${status.name}</button>

						</c:forEach>
					</ul>
				</div>
				<ul id="listRoom">

					<c:forEach items="${availableStaff}" var="staff">
							
							<li style="width:155px;" data-id="${staff.id}" data-check="false"
							class="btn btn-${staff.status.btnStyle} availableRoom">
								<p>${staff.fullname}</p>
							</li>







					</c:forEach>
				</ul>
				
					<div class="taskMain">
						<h2></h2>
						<c:forEach items="${tasks}" var="task">
							<h4 class="task" data-id="${task.id}" data-check="false">${task.name}</h4>
						</c:forEach>
						<button class="btn btn-primary" id="assignBtn">Giao</button>
						<button style="display: block;margin:auto;margin-top:10px;" class="btn btn-danger" id="close">Trở về</button>
					</div>
			</div>
		</div>
		<script type="text/javascript">
			var staffName;
			var roomId='${room.id}';
			var staffId;
			var taskId;
			$('.availableRoom').on('click', function(event) {
				$('.taskMain').addClass('appear');
				staffName = $(this).find('p').text();
				$('.taskMain').find('h2').text(staffName);
				$(this).attr('data-check','true');
				staffId = $(this).attr('data-id');
			});
			$('#close').on('click', function(event) {
				$('.taskMain').removeClass('appear');
			});
			
			var choosed = false;
			$('.task').on('click', function(event) {
				var checked = $(this).attr('data-check');
				if (checked == 'false' && !choosed) {
					$(this).addClass('choosed');
					$(this).attr('data-check', 'true');		
					taskId = $(this).attr('data-id');	
					choosed = true;
				} else if (checked == 'true') {
					$(this).removeClass('choosed');
					$(this).attr('data-check', 'false');
					choosed = false;
				}
			});
			
			$('#assignBtn').on('click', function(event) {
				if (!choosed) {
					alert("Vui lòng chọn công việc !");
				}else{
					
					var data = {};
					data["staff"] =  {
							"id": staffId
					}
					data["room"] =  {
							"id": roomId
					}
					data["task"] =  {
							"id": taskId
					}
					console.log(data);
					assign(data);		
				}
			});
			function assign(data) {
				$.ajax({
					url : '${assignAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Thành công");
						window.location.href = '${roomURL}?number=' +result["room"]["number"];
					},
					error : function(error) {
						alert("Thất bại");
					}
				});
			}
				
		</script>
</body>
</html>