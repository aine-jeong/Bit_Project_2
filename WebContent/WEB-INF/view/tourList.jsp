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
   
   <!-- 맵API -->
   <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff92759dc421a0bf0b08eca76214da7f"></script>
   
   <style type="text/css">
   		/***로딩이미지***/
   		.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		    position: fixed;
		    left:0;
		    right:0;
		    top:0;
		    bottom:0;
		    background: rgba(0,0,0,0.2); /*not in ie */
		    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
		}

   		 .wrap-loading div{ /*로딩 이미지*/
	        position: fixed;
	        top:50%;
	        left:50%;
	        margin-left: -21px;
	        margin-top: -21px;
   		 }

   		 .display-none{ /*감추기*/
     	   display:none;
   		 }
   		/***로딩이미지***/
   
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
	   	
	   	.table td, .table th {
    		vertical-align: middle;
		}
	   	
	   	
	   	/***모달***/
	   	.modal-content {
  		  margin-top: 100px;
		}
	   	
	   	.modal-body > img {
	   		max-width: 55%; 
	   		height: auto; 
	   		float: left;
	   	}
	   	
	   	p {	
	   		text-align: center;
	   		color: black;
		  	font-family: 'Nanum Gothic', sans-serif; 
		  	align-content: center;
		}
		
		p > .category {
			font-size: 18px;
		}
		
		p > .intro-tag {
			font-color: #e68a00;
		}
	   	
	   	.modal-title-area {
	   		padding-top: 40px;
	   		text-align: center;
	   		max-width: 180px;
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
	   	
	   	.intro-text {
	   		height: 100px;
	   		overflow: auto;
	   	}
	   	
	   	.intro-addr {
	   		margin: 0 auto;
	   	}
	   	
	   	.modal-map-area {
	   		width: 100%;
	   		height: 180px;
	   		float: left;
	   	}
	   	
	   	.map{
		width: 100%;
		height: 100%;
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
		
		<!-- 라벨선택요청이미지 -->
		<img class="category-choice" src="img/choice.png">
		
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
	
	<!-- 로딩이미지용 -->
  	<div class="wrap-loading display-none">
   		 <div><img src="img/loading.gif" /></div>
	</div>  
	
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