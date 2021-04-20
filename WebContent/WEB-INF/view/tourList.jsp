<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Barber</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	<!-- Place favicon.ico in the root directory -->

	
 <!-- CSS here -->
   <link rel="stylesheet" href="assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
   <link rel="stylesheet" href="assets/css/gijgo.css">
   <link rel="stylesheet" href="assets/css/slicknav.css">
   <link rel="stylesheet" href="assets/css/animate.min.css">
   <link rel="stylesheet" href="assets/css/magnific-popup.css">
   <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
   <link rel="stylesheet" href="assets/css/themify-icons.css">
   <link rel="stylesheet" href="assets/css/slick.css">
   <link rel="stylesheet" href="assets/css/nice-select.css">
   <link rel="stylesheet" href="assets/css/style.css">
   <link rel="stylesheet" href="assets/css/responsive.css">
   
   <!-- 폰트 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
   
   <style type="text/css">
   		* {
   			font-family: 'Nanum Gothic', sans-serif;
   		}
   		
	   	img { 
	   		max-width: 100%; 
	   		height: auto; 
	   	}
	   	
	   	td:hover {
	   		cursor: pointer;
	   		background-color: lightgray;
	   	}
	   	
	   	.modal-body > img {
	   		max-width: 55%; 
	   		height: auto; 
	   		float: left;
	   	}
	   	
	   	.modal-body > p {
	   		font-family: 'Nanum Gothic', sans-serif;
	   		font-color: black;
	   		text-align: center;
	   	}
	   	
	   	p {	
	   		color: black;
		  	font-family: 'Nanum Gothic', sans-serif; 
		}
	   	
	   	.modal-title-area {
	   		font-family: 'Nanum Gothic', sans-serif;
	   		font-color: black;
	   		text-align: center;
	   		max-width: 40%;
	   		height: 200px;
	   		float:right;
	   	}
	   	
	   	.modal-body > .categoty {
	   		font-size: 18px;
	   		text-align: 80px;
	   	}
	   	
	   	.intro-tag {
	   		font-size: 16px;
	   		text-align: 120px;
	   		font-color: #e68a00;
	   	}
	   	
	   	.modal-intro-area {
	   		max-width: 100%;
	   		height: 150px;
	   		float: left;
	   	}
	   	
	   	#button-insert {
	   		background-color: #e68a00;
	   	}
	   	
   </style>
   
</head>
<body>
    <jsp:include page="header.jsp" />
    <main>
    	<!-- 1차 라벨 선택 -->
    	<div id="div1">
	    	<div class="container box_1170">
			    <table class="table table-bordered">
			    	<tbody class="text-center">
			    		<tr id="division1">
			    			<td style="background-color: orange; color: white;">전체</td>
			    		</tr>
			    	</tbody>
			    </table>
			</div>
		</div>
		<!-- 1차 라벨 선택 -->
		
		<!-- 2차 라벨 선택 -->
		<div id="div2" class=""></div>
		<!-- 2차 라벨 선택 -->
		
		<!-- Room Start -->
        <section class="room-area">
            <div class="container">
                <!-- <div class="row justify-content-center">
                    <div class="col-xl-8">
                        font-back-tittle 
                        <div class="font-back-tittle mb-45">
                            <div class="archivment-front">
                                <h3>Our Rooms</h3>
                            </div>
                        </div>
                    </div>
                </div> -->
                
                <div id="row" class="row"></div>
                
                <!-- <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="#" class="btn view-btn1">View more  <i class="ti-angle-right"></i> </a>
                    </div>
                </div> -->
            </div>
        </section>
        <!-- Room End -->
    </main>
    
    
    <!-- 모달 영역 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"></div>

  
</body>
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
		<script src="./assets/js/jquery.magnific-popup.js"></script>
		
		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
        
        <script src="./assets/js/tourList.js"></script>
        
</html>