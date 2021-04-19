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
   
   <style type="text/css">
   	.modal {
        display: none; /*기본적으로 숨겨놓기 위함 (클릭시 나타나도록)*/
        position: fixed; /* 위치 고정 */
        z-index: 10; /* 현재 화면 위로 덮어 띄우기 */

        left: 0;
        top: 0;
        width: 100%;
        height: 100%;

        overflow: auto; /* Enavle scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 30px;
        border: 1px solid #888;

        width: 600px;
        height: 800px;

    }

    /*제목 넣을 영역 div*/
    .modal-title{
        width: 208px;
        height: 197px;
        /* background-color: #888; */
        float: right;

        text-align: center;
        /* line-height: 232px; */
    }

    .title-text {
        line-height: 80px;
        width: 208px;
        font-size: 20px;
    }

    .category{
        /* line-height: 140px; */
        /* vertical-align: middle; */
        font-size: 16px;
    }

    /*설명 넣을 영역 div*/
    .modal-intro {
        float: right;
        width: 100%;
        height: 170px;

        text-align: center;

        /* background-color: #888; */
    }

    .intro-text {
        /* 일정 글자수넘어가면 스크롤박스 나오도록 처리하기 */
        line-height: 30px;
        font-size: 18px;
    }

    .intro-tag{
        font-size: 16px;
    }

    .intro-margin {
        height: 10px;
    }

    .intro-addr{
        font-size: 14px;
    }

    /*지도넣을 영역 div*/
    .modal-map{
        float: right;
        width: 100%;
        height: 250px;

        /* background-color: rgb(199, 199, 199); */
    }

    /*담기버튼 넣을 영역 div*/
    .modal-putBtn{
        float: right;
        width: 100%;
        height: 70px;

       /*  background-color: #888; */
    }

    .putBtnMargin{
        height: 10px;
    }

    .btnSize{
        width: 200px;
        height: 50px;

        margin: auto;

        
    }

    .putBtn {
        cursor: pointer;
        border: 0;
        outline: 0;

        width: 100%;
        height: 100%;
        background-color: rgb(255, 196, 0);
        color: white;
    }



    /*창닫기 버튼 span*/
    .modal_closeBtn {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .modal_closeBtn:hover, .modal_closeBtn:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    /*이미지 영역*/
    #image{
        width: 309px;
        height: 232px;
        float: left;
    }
   	
   </style>
   
</head>
<body>
    <jsp:include page="header.jsp" />
    <main>
    	<!-- 1차 라벨 선택 -->
    	<div id="div1">
	    	<div class="container box_1170">
			    <table class="table table-bordered table-hover">
			    
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
		<div id="div2"></div>
		<!-- 2차 라벨 선택 -->
		
		<!-- Room Start -->
        <section class="room-area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                        <!--font-back-tittle  -->
                        <div class="font-back-tittle mb-45">
                            <div class="archivment-front">
                                <h3>Our Rooms</h3>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="row" class="row"></div>
                
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="#" class="btn view-btn1">View more  <i class="ti-angle-right"></i> </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Room End -->
    </main>
    
    
    <!--모달-->
    <div id = "myModal" class="modal" style="overflow: auto;">
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