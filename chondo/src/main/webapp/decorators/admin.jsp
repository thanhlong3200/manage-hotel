	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title default="Trang chủ" /></title>
	<link rel="stylesheet" href="<c:url value='/template/web/style.css'/>">

	<link rel="stylesheet" href="<c:url value='/template/admin/css/admin.css' />" />

    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />
    <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
   

    <link rel="stylesheet" href="<c:url value='/template/web/css/custom.css'/>">




    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
    <!-- Place favicon.ico in the root directory -->

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap.min.css'/>">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/core.css'/>">
     <link rel="stylesheet" href="<c:url value='/template/web/css/custom.css'/>">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/shortcode/shortcodes.css'/>">
    <!-- Theme main style -->
    <link rel="stylesheet" href="<c:url value='/template/web/style.css'/>">
    <!-- Responsive css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/responsive.css'/>">
    <!-- customizer style css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/style-customizer.css'/>">
   	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
   
 	<script src="<c:url value='/template/web/js/vendor/jquery-1.12.0.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/vendor/jquery.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/vendor/modernizr-2.8.3.min.js'/>"></script>

    <dec:head></dec:head>
    
   
</head>
<body class="no-skin">
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- header -->
    	<%@ include file="/common/admin/menu.jsp" %>
    	<!-- header -->
		<div class="bodyAdmin">
			<dec:body/>
		</div>
		
	</div>
	
	 <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="<c:url value='/template/web/js/vendor/bootstrap.min.js'/>"></script>
    <!--counter up js-->
    <script src="<c:url value='/template/web/js/waypoints.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.counterup.min.js'/>"></script>
    <!-- Video player js -->
    <script src="<c:url value='/template/web/js/video-player.js'/>"></script>
    <!-- headlines js -->
    <script src="<c:url value='/template/web/js/animated-headlines.js'/>"></script>
    <!-- Ajax mail js -->
    <script src="<c:url value='/template/web/js/mailchimp.js'/>"></script>
    <!-- Ajax mail js -->
    <script src="<c:url value='/template/web/js/ajax-mail.js'/>"></script>
    <!-- parallax js -->
    <script src="<c:url value='/template/web/js/parallax.js'/>"></script>
    <!-- textilate js -->
    <script src="<c:url value='/template/web/js/textilate.js'/>"></script>
    <script src="<c:url value='/template/web/js/lettering.js'/>"></script>
    <!--isotope js-->
    <script src="<c:url value='/template/web/js/isotope.pkgd.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/packery-mode.pkgd.min.js'/>"></script>
    <!-- Style Customizer Js  -->
    <script src="<c:url value='/template/web/js/style-customizer.js'/>"></script>
    <!-- Owl carousel Js -->
    <script src="<c:url value='/template/web/js/owl.carousel.min.js'/>"></script>
    <!--Magnificant js-->
    <script src="<c:url value='/template/web/js/jquery.magnific-popup.js'/>"></script>
    <!-- All js plugins included in this file. -->
    <script src="<c:url value='/template/web/js/plugins.js'/>"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="<c:url value='/template/web/js/main.js'/>"></script>
</body>
</html>