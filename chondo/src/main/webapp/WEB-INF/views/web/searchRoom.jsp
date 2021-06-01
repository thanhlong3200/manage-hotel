<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="com.chondo.util.SecurityUtils" %>
<c:url var="searchAPI" value="/tim-kiem"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm phòng</title>
   
</head>
<body>

                            
         <div class="booking-box">
            
             <div class="booking-form">
                 <form id = "formSubmit" action="${searchAPI}" method="get"> 
                     <div class="b-date arrive mb-15">
                         <input id="dateFrom" name="dateFrom" class="date-picker" type="text" placeholder="Ngày đến">                   
                     </div>
                     <div class="b-date departure mb-15">
                         <input id="dateTo" name="dateTo" class="date-picker" type="text" placeholder="Ngày đi">              
                     </div>
                     <div class="mb-15">
                         <select  id="adult" name="adult" class="">
                             <option value="1" disabled>Số người lượng lớn</option>
                             <option value="1" selected>1 người lớn</option>
                             <option value="1" >2 người lớn</option>
                             <option value="1" >3 người lớn</option>
                             <option value="1" >4 người lớn</option>
                             <option value="1" >5 người lớn</option>
                         </select>
                     </div>
                     <div class="mb-15">
                         <select id="children" name="children" class="">
                             <option value="1" disabled>Số lượng trẻ em</option>
                             <option value="1" selected>0 trẻ em</option>
                             <option value="1" >1 trẻ em</option>
                             <option value="1" >2 trẻ em</option>
                             <option value="1" >3 trẻ em</option>
                             <option value="1" >4 trẻ em</option>
                             <option value="1" >5 trẻ em</option>
                         </select>
                     </div>
                     <div class="mb-15">
                         <select id="roomCount" name="roomCount" class="">
                             <option value="1" disabled>Số lượng phòng</option>
                             <option value="1" >1 phòng</option>
                             <option value="1" >2 phòng</option>
                             <option value="1" >3 phòng</option>
                             <option value="1" >4 phòng</option>
                             <option value="1" >5 phòng</option>
                         </select>
                     </div>
                     <div class="mb-15">
                         <select id="location" name="location" class="">
                             <option value="1" disabled>Địa điểm</option>
                             <option value="1" >Đà Lạt</option>
                             <option value="1" >Vũng Tàu</option>                                           
                         </select>
                     </div>
                     <div class="submit-form">
                         <button id="searchRoom">Tìm phòng trống</button>
                     </div>
                 </form>
             </div>
         </div>
     </div>
                    
</body>
</html>