<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar responsive ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
    	<%-- <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Đặt phòng
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href="<c:url value='/quan-tri/trang-chu'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Tìm phòng
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li> --%>
        <li >
            <a href="<c:url value='/quan-tri/phong'/>">
                        Sơ đồ phòng
                    </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/trang-chu'/>">
                        Đặt phòng
                    </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/booking?page=1&limit=2'/>">
                        Danh sách booking
                    </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/check-in'/>">
                Check in
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
            <a href="<c:url value='/quan-tri/nang-cap-booking'/>">
                Upgrade booking
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/tinh-hinh-dat-phong'/>">
               	Tình hình đặt phòng
            </a>
        </li>
        <li >
            <a href="<c:url value='/quan-tri/phan-cong?page=1&limit=2'/>">
               	Phân công
            </a>
        </li>
    </ul>
</div>