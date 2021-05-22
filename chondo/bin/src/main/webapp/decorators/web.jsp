<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
	<link href="<c:url value='/template/web/images/apple-touch-icon.png'/>" type="images/x-icon" rel="shortcut icon">
    <!-- Place favicon.ico in the root directory -->
    
    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap.min.css'/>">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/core.css'/>">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/shortcode/shortcodes.css'/>">
    <!-- Theme main style -->
    <link rel="stylesheet" href="<c:url value='/template/web/style.css'/>">
    <!-- Responsive css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/responsive.css'/>">
    <!-- customizer style css -->
    <link rel="stylesheet" href="<c:url value='/template/web/css/style-customizer.css'/>">
   
    <!-- Modernizr JS -->
    <script src="<c:url value='/template/web/js/vendor/modernizr-2.8.3.min.js'/>"></script>

</head>
<body>
	<div class="preloader">
		<div class="loading-center">
			<div class="loading-center-absolute">
				<div class="object object_one"></div>
				<div class="object object_two"></div>
				<div class="object object_three"></div>
			</div>
		</div>
	</div>
	
	<div class="wrapper">
		<%@ include file="/common/web/header.jsp" %>
		<%@ include file="/common/web/search.jsp" %>
		<dec:body/>
		<%@ include file="/common/web/footer.jsp" %>
	</div>
	

	


    <script src="<c:url value='/template/web/js/vendor/jquery-1.12.0.min.js'/>"></script>
    <!-- Bootstrap framework js -->
    <script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
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