<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
</head>


<!-- 냠냠 -->
<style>
	.myTour_name{
		background: #e6e6e6;
		height: 100px;
	}
	
	.mapArea{
		background: #f2f2f2;
		height: 500px;
		
		display: flex;
	}
	
	.map{
		width: 100%;
		height: 100%;
		
		margin: auto;
	}
</style>

<body>
<!-- DB에서 가져온 cid 처리하려고 hidden으로 받아둠 -->
<input id="myTourList" type="hidden" value="<%=request.getAttribute("myTourList") %>">

	<header>
        <!-- Header Start -->
       <div class="header-area header-sticky">
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                               <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="index.html">Home</a></li>
                                        <li><a href="about.html">About</a></li>
                                        <li><a href="services.html">Service</a></li>
                                        <li><a href="blog.html">Blog</a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="single-blog.html">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Pages</a>
                                            <ul class="submenu">
                                                <li><a href="rooms.html">Rooms</a>
                                                <li><a href="elements.html">Element</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        <div class="col-xl-2 col-lg-2">
                            <!-- header-btn -->
                            <div class="header-btn">
                                <a href="#" class="btn btn1 d-none d-lg-block ">Book Online</a>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    
	<!-- 요기부터 -->
	<!-- 내가 담은 관광지 (헤더) -->
	<div class="container box_1170 myTour_name">
	
	</div>
	
	<div class="container box_1170 mapArea">
		<div id="map" class="map">
		
		</div>
	</div>


	
	
	
	
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff92759dc421a0bf0b08eca76214da7f"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.36159410409114, 126.52920948469817), // 지도의 중심좌표
			// 지도의 확대 레벨
			level : 10
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//관광지 API URL
		var url = "http://api.visitjeju.net/vsjApi/contents/searchList";
		
		/*
		//로그인한 유저가 담아둔 관광지 contentID 목록
		List<String> myTourList = (ArrayList<String>)request.getAttribute("myTourList");
		
		System.out.print(myTourList);
		
		*/
		//<c:set var="myTourList" value="${requestScope.myTourList}"></c:set>
		
		
		//샘플 사용자가 담아둔 관광지 목록의 contentID
		//var markerArray = ["CNTS_000000000021622","CNTS_200000000009833","CNTS_000000000022065","CNTS_200000000007536"];
		var markerArray = $('#myTourList').val().replaceAll("[","").replaceAll("]","").split(", ");
		
		//마커를 표시할 위치와 title 객체 배열
		var positions = [];
		
		for(var index in markerArray) {
			
			var data = {
						apiKey: "wuuv42tnk9hazf5h",
						locale: "kr",
						cid: markerArray[index]
					};
			
			$.getJSON(url, data, function(response) {
				
				/*
				console.log(response);
				console.log(response.items[0].title);
				console.log(response.items[0].latitude);
				console.log(response.items[0].longitude);
				*/
				
				var marker = {
								title: response.items[0].title,
								latlng: new kakao.maps.LatLng(response.items[0].latitude, response.items[0].longitude)
							}
				
				positions.push(marker);
				
				//마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
				
			}); 
		
		};
		
		// 마커가 표시될 위치입니다 
		//var markerPosition = new kakao.maps.LatLng(33.36159410409114, 126.52920948469817);

		
	</script>


	<!-- 요기까지 -->
	
<!-- JS here -->
	
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
        
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
        //     icons: {
        //      rightIcon: '<span class="fa fa-caret-down"></span>'
        //  }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
        var timepicker = $('#timepicker').timepicker({
         format: 'HH.MM'
     });
    </script>
</body>
</html>