<%@page import="java.util.List"%>
<%@page import="kr.or.bit.noticeboard.dto.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content</title>
<link rel="Stylesheet"
	href="${pageContext.request.contextPath}/style/default.css" />
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
<link rel="stylesheet" href="css/bopage.css">

<style>
.adminPro {
	width: 36px;
	height: 36px;
}

.noneBorder {
	border-top-width: 0px;
	border-right-width: 0px;
	border-left-width: 0px;
	border-bottom-width: 0px;
}

.menuClip {
	width: 80px;
	background: #FAECCC;
	border-radius: 5px;
	text-align: center;
	padding: 8px;
	font-weight: bold;
}

.hrSpace {
	margin: auto;
	margin-top: 10px;
	margin-bottom: 30px;
}

a, button {
	color: black;
	font-weight: 1000;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div id="pageContainer">
		<div style="padding-top: 10px; text-align: center">
			<br>
			<div class="font-back-tittle mb-10 ">
				<div class="archivment-front">
					<h3 style="color: #EAAF24; font-size: 50px;">통계자료</h3>
				</div>
				<h3 class="archivment-back">통계자료</h3>
			</div>
			<center>
				<table width="80%" class="noneBorder">
				</table>
			</center>
			<center>
			<hr width="80%">
				<table width="70%" class="noneBorder">
					<tr style="height: 200px; padding-top: 10px;">
						<td colspan="1" align="center" width="10%">
							<div id="graph-container">
								<canvas id="myChart" width="800" height="500"></canvas>
							</div>

						</td>
					</tr>
<!-- 					<tr style="height: 300px;"> -->
<!-- 						<td colspan="5" align="center"> -->
<!-- 							<div id="graph-container"> -->
<%-- 								<canvas id="myChart2" width="800" height="500"></canvas> --%>
<!-- 							</div> -->

<!-- 						</td> -->
<!-- 					</tr> -->

				</table>
			</center>
			<hr width="80%" align="center" class="hrSpace">
			<%-- <table width="80%" align="center">
				<tr align="right" style="opacity: 0.65;">
					<td align="left" width="20%"><a class="menuClip"
						href="boardList.bo?cp=${cpage}&ps=${pagesize}">목록가기</a></td>
					<td class="admin"><a class="admin menuClip"
						href="boardWrite.bo">글쓰기</a> <a class="menuClip admin"
						href="boardEdit.bo?n_NUMBER=${n_NUMBER}">수정하기</a> <a
						class="menuClip admin" href="boardDelete.bo?n_NUMBER=${n_NUMBER}">삭제하기</a>
					</td>
				</tr>
			</table> --%>
			<br>
		</div>
		<div style="padding-bottom: 100px; text-align: center"></div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<!-- 	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script> -->
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


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>



	<script type="text/javascript">
	window.onload = function() {
		
		var nowEmail= "<%=session.getAttribute("email")%>";
		var nowJSON= ${requestScope.chartTourList}
		console.log(nowJSON);
		
		if('<%=session.getAttribute("email")%>' != 'admin@naver.com'){
			$('.admin').css("display","none");
			}
		
		var chartJSON = ${requestScope.chartList}
		console.log(chartJSON);
		
		var emailList = [
			chartJSON[0].email,
			chartJSON[1].email,
			chartJSON[2].email
			];
		
		var nicknameList = [
			chartJSON[0].nickname,
			chartJSON[1].nickname,
			chartJSON[2].nickname
			];
		
		var totalCount1 = [
			chartJSON[0].count,
			];
		
		var totalCount2 = [
			chartJSON[1].count,
			];
		
		var totalCount3 = [
			chartJSON[2].count,
			];
		
		
		var chartLabel = ["작성 횟수"];
	
		
		
	var ctx = document.getElementById('myChart').getContext('2d');
    let myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: chartLabel,
            datasets: [
            	{
                label: chartJSON[0].nickname,
                data: totalCount1,
                backgroundColor: [
                   'rgba(255, 159, 64, 0.7)',
                ],
                borderColor: [
    			'rgba(255, 159, 64, 0.7)',
                ],
                borderWidth: 1,
            },
            {
                label: chartJSON[1].nickname,
                data: totalCount2,
                backgroundColor: [
                    'rgba(120, 159, 64, 0.7)',
                ],
                borderColor: [
                    'rgba(120, 159, 64, 0.7)',
                ],
                borderWidth: 1
            },
            {
                label: chartJSON[2].nickname,	
                data: totalCount3,
                backgroundColor: [
                    'rgba(0, 159, 64, 0.7)',
                ],
                borderColor: [
                    'rgba(0, 159, 64, 0.7)',
                ],
                borderWidth: 1
            }
            
            ]
    	},
    	plugins: [ChartDataLabels],
        options: {
        	legend: {
                display: true,
                labels: {
                        fontSize: 20,
                        //fontFamily: 'sans-serif',
                        //fontColor: '#000000',
                        //fontStyle: 'bold'
                            }
                },
        	animation: {
        	      onComplete: () => {
        	        delayed = true;
        	      },
        	      delay: (context) => {
        	        let delay = 0;
        	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
        	          delay = context.dataIndex * 300 + context.datasetIndex * 100;
        	        }
        	        return delay;
        	      },
        	    },
        	responsive: true,
    		plugins:{
    			datalabels: {
    				align: 'center',
    				//anchor: 'end',
    				color: 'white',
    				font: {
    					weight: 'bold',
    					size: 40
    				},
    			}
    		},
            scales: {
            	labels: [{
            		ticks: {
                        beginAtZero: true,
                        fontSize : 500
                    }
            	}],
            	
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        fontSize : 20
                    }
                }],
                xAxes: [{
                    ticks: {
                        beginAtZero: true,
                        fontSize : 20
                    }
                }]
            }
        }
    });
    
    /* 두번째 차트 */
    
//     var ctx2 = document.getElementById('myChart2').getContext('2d');
//     let myChart2 = new Chart(ctx2, {
//         type: 'bar',
//         data: {
//             labels: chartLabel,
//             datasets: [
//             	{
//                 label: chartJSON[0].nickname,
//                 data: totalCount1,
//                 backgroundColor: [
//                    'rgba(255, 159, 64, 0.7)',
//                 ],
//                 borderColor: [
//     			'rgba(255, 159, 64, 0.7)',
//                 ],
//                 borderWidth: 1,
//             },
//             {
//                 label: chartJSON[1].nickname,
//                 data: totalCount2,
//                 backgroundColor: [
//                     'rgba(120, 159, 64, 0.7)',
//                 ],
//                 borderColor: [
//                     'rgba(120, 159, 64, 0.7)',
//                 ],
//                 borderWidth: 1
//             },
//             {
//                 label: chartJSON[2].nickname,	
//                 data: totalCount3,
//                 backgroundColor: [
//                     'rgba(0, 159, 64, 0.7)',
//                 ],
//                 borderColor: [
//                     'rgba(0, 159, 64, 0.7)',
//                 ],
//                 borderWidth: 1
//             }
            
//             ]
//     	},
//     	plugins: [ChartDataLabels],
//         options: {
//         	legend: {
//                 display: true,
//                 labels: {
//                         fontSize: 20,
//                         //fontFamily: 'sans-serif',
//                         //fontColor: '#000000',
//                         //fontStyle: 'bold'
//                             }
//                 },
//         	animation: {
//         	      onComplete: () => {
//         	        delayed = true;
//         	      },
//         	      delay: (context) => {
//         	        let delay = 0;
//         	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
//         	          delay = context.dataIndex * 300 + context.datasetIndex * 100;
//         	        }
//         	        return delay;
//         	      },
//         	    },
//         	responsive: true,
//     		plugins:{
//     			datalabels: {
//     				align: 'center',
//     				//anchor: 'end',
//     				color: 'white',
//     				font: {
//     					weight: 'bold',
//     					size: 40
//     				},
//     			}
//     		},
//             scales: {
//             	labels: [{
//             		ticks: {
//                         beginAtZero: true,
//                         fontSize : 500
//                     }
//             	}],
            	
//                 yAxes: [{
//                     ticks: {
//                         beginAtZero: true,
//                         fontSize : 20
//                     }
//                 }],
//                 xAxes: [{
//                     ticks: {
//                         beginAtZero: true,
//                         fontSize : 20
//                     }
//                 }]
//             }
//         }
//     });
    
    
    
	}
	</script>
</body>
</html>





