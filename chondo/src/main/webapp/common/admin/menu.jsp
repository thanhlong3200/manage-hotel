<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar responsive ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <ul class="nav nav-list">
     <li >
            <a href="<c:url value='/quan-tri/tim-phong'/>">
                Đặt phòng
            </a>
        </li>
        
        
        <li >
            <a href="<c:url value='/quan-tri/tinh-hinh-dat-phong?page=1&limit=10'/>">
               	Tình hình đặt phòng
            </a>
        </li>
     <security:authorize access = "hasAnyRole('receptionist')">
		<li >
            <a href="<c:url value='/quan-tri/phong'/>">
                        Sơ đồ phòng
                    </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/booking?page=1&limit=10'/>">
                 Danh sách booking
             </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/check-in'/>">
                Check in
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/check-out'/>">
                Check out
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/huy-booking'/>">
                Hủy booking
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/doi-phong'/>">
                Đổi phòng
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/gia-han-booking'/>">
                Gia hạn booking
            </a>
        </li>
         <li >
            <a href="<c:url value='/quan-tri/dich-vu'/>">
                Dịch vụ
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/nang-cap-booking'/>">
                Nâng cấp booking
            </a>
        </li>
	</security:authorize>
         
        <li >
            <a href="<c:url value='/quan-tri/phan-cong?page=1&limit=10'/>">
               	Phân công
            </a>
        </li>
     
        
      <security:authorize access = "hasAnyRole('accountant')">
	      <li >
            <a href="<c:url value='/quan-tri/doanh-so/hoa-don'/>">
               	Thống kê doanh số
            </a>
        	</li>
		</security:authorize>
       
        <security:authorize access = "hasAnyRole('system')">
	          <li >
				  <a href="<c:url value='/quan-tri/loai-phong/danh-sach?page=1&limit=10'/>">
	               	Quản lý loại phòng
	         	  </a>
	        </li>
	        <li >
				  <a href="<c:url value='/quan-tri/danh-gia'/>">
	               Quản lý đánh giá
	         	  </a>
	        </li>
	        <li >
				  <a href="<c:url value='/quan-tri/quan-ly-phong'/>">
	               	Quản lý phòng
	         	  </a>
	        </li>
		  </security:authorize>
       
         <security:authorize access = "hasAnyRole('personnel')">
			 <li >
	            <a href="<c:url value='/quan-tri/nguoi-dung/danh-sach?page=1&limit=10'/>">
	               	Quản lý người dùng
	            </a>
	        </li>
	        
	        
	         <li >
	            <a href="<c:url value='/quan-tri/khach-hang?page=1&limit=10'/>">
	               	Danh sách khách hàng
	            </a>
	        </li>
		  </security:authorize>
    </ul>
</div>