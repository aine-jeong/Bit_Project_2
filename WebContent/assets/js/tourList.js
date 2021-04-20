const API_URL = "http://api.visitjeju.net/vsjApi/contents/searchList";
const API_KEY = "wuuv42tnk9hazf5h"
const LOCALE = "kr";

// 제주비짓 REST API 최대 페이지 수
var maxPage = 0;

// 제주비짓 전체 데이터를 담은 배열
var totalResult = [];

// 1차 지역 라벨 배열
var firstDivision = [];
// 1차 지역 null 값이 없는 배열 전체
var notNullTotalResult = [];

// 1차 지역 라벨 선택한 것
var selectedFirst = "";

// 2차 지역 라벨 배열
var secondDivision = [];

// 2차 지역 라벨 선택한 것
var selectedSecond = "";

init();

// 화면 open시 실행
async function init() {
	var page = 0;

	var form_data = {
		apiKey: API_KEY,
		locale: LOCALE,
		page: 100
	};

	await getJejuData(form_data);
	/*for(var i = 1; i < maxPage; i++) {
		getJejuData(form_data);
	}*/

	await firstDiv();

}

// 제주비짓 REST API 데이터 받기
async function getJejuData(form_data) {
	return new Promise((resolve, reject) => {

		/*form_data.page = form_data.page + 1; */

		$.ajax(
			{
				url: API_URL,
				data: form_data,
				success: (response) => {

					/*maxPage = response.pageCount;*/

					totalResult.push(response);

					resolve(form_data);
				},beforeSend: function() {
					$('.wrap-loading').removeClass('display-none');
				}, complete: function() {
					$('.wrap-loading').addClass('display-none');
				}
				
			}
		);

	});

}

// 1차지역 라벨이 null 값인 경우를 제외하고 전체 목록에 담는다. 
async function firstDiv() {

	return new Promise((resolve, reject) => {

		$.each(totalResult, function(index, item) {

			$.each(item.items, (index2, item2) => {

				var str = "";


				if (item2.region1cd == null) {
					// 1차 지역 코드가 없는 경우
					// fdisNull.push(item2);
					return true;
				} else {
					str = item2.region1cd.label;
					notNullTotalResult.push(item2);
				}

				setDivision1(str);

			});
		});

		resolve();

	});

}

// 중복 값을 제외한 1차 라벨 화면에 셋팅
function setDivision1(str) {
	if (firstDivision.length == 0 || !firstDivisionContainStr(firstDivision, str)) {
		firstDivision.push(str);
		document.querySelector('#division1').innerHTML += '<td>' + str + '</td>';
	}
}

// 라벨 중복 값은 true, 조회 완료후에 중복값이 없다면 false 반환
function firstDivisionContainStr(firstDivision, str) {
	for (var i = 0; i < firstDivision.length; i++) {
		if (str === firstDivision[i]) {
			return true;
		}
	}
	return false;
}

// 1차 지역 클릭 이벤트 동적 할당
$(document).on("click", "#division1 > td", function(event) {
	// 카드 지역 초기화
	$('#row').empty();

	var targetValue = $(event.target).text();

	if (targetValue === "전체") {
		return;
	} else {

		selectedFirst = targetValue;

		// 2차지역 라벨 배열 초기화
		secondDivision = [];

		var arr = [];

		$.each(notNullTotalResult, function(index, item) {
			if (item.region1cd.label === targetValue) {
				arr.push(item);
			}
		});

		setSecondDivision(arr);

	}
});

// 2차 지역 라벨 만들기
function setSecondDivision(arr) {

	// 라벨 중복 값 제거
	$.each(arr, function(index, item) {

		var str = item.region2cd.label;

		if (!firstDivisionContainStr(secondDivision, str)) {
			secondDivision.push(str);
		}
	});

	var innerValue = ""

	innerValue += '<div class="container box_1170"><table class="table table-bordered"><tbody class="text-center">';

	for (var i = 0; i < secondDivision.length; i++) {

		if (i % 4 == 0) {
			innerValue += '<tr>';
		}

		if (i == 0) {
			var rowsp = Math.ceil(secondDivision.length / 4) + 1;
			innerValue += '<td style="vertical-align: center; background-color: orange; color: white;" rowspan="' + rowsp + '">전체</td>';
			continue;
		}

		innerValue += '<td>';

		innerValue += secondDivision[i];

		innerValue += '</td>';


		if (i % 4 == 3) {
			innerValue += "</tr>";
		}
	}

	innerValue += '</tbody></table></div>';

	// 2차 지역 라벨 클리어 
	$('#div2').empty();
	$('#div2').html(innerValue);
}

// 2차 지역 라벨 클릭 시 이벤트 동적 생성
$(document).on("click", "#div2 > div > table > tbody > tr > td", function(event) {

	var targetValue = $(event.target).text();

	if (targetValue === "전체") {
		return;
	} else {
		selectedSecond = targetValue;

		var arr = [];

		$.each(notNullTotalResult, function(index, item) {
			if (item.region1cd.label === selectedFirst && item.region2cd.label === selectedSecond) {
				arr.push(item);
			}
		});

	}

	setCard(arr);

});

// 카드 생성
function setCard(arr) {

	var innerValue = "";

	$.each(arr, function(index, item) {

		// <a href="#" id="myBtn"></a>
		innerValue += `<div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                               <img src="${item.repPhoto.photoid.imgpath}" alt="" id="myBtn">
								<input type="hidden" value="${item.contentsid}">
                            </div>
                            <div class="room-caption text-center">
                                <h3><a href="#" id="myBtn">${item.repPhoto.descseo}</a><input type="hidden" value="${item.contentsid}"></h3>
								<div>${selectedFirst} > ${selectedSecond}</div>
								<div>${"#" + (item.tag).replaceAll(",", " #")}</div>
								<div class="mt-3">
									<button class="genric-btn warning circle" id="button-insert">담기</button>
									<input type="hidden" value="${item.contentsid}">
								</div>
                            </div>
                        </div>
                       </div>`;
	});

	$('#row').empty();
	$('#row').html(innerValue);
	
	$('.category-choice').addClass('display-none');
}

// 모달 부분
var modal = document.getElementById('myModal');
var btn = document.getElementById('myBtn');

var span = document.getElementsByClassName('close')[0];

$(document).on("click", "#myBtn", function(event) {
	$('#myModal').empty();

	event.preventDefault();

	var contentId = $(event.target).next().val();

	var form_data = {
		apiKey: API_KEY,
		locale: LOCALE,
		cid: contentId
	};

	$.ajax(
		{
			url: API_URL,
			data: form_data,
			success: function(response) {
				var innerValue = "" + `<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">${response.items[0].title}</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
												</div>
												<div class="modal-body text-center">
													<img id = "image" class="" src="${response.items[0].repPhoto.photoid.imgpath}">
													<div class = "modal-title-area">
														<p class="category" style="font-size: 18px">${selectedFirst} > ${selectedSecond}</p>
										                <p class="intro-tag" style="font-size: 14px; color: #e68a00;">${"#" + (response.items[0].tag).replaceAll(",", " #")}</p>
									                </div>
									                <div class = "modal-intro-area">
										                <p class="intro-text" align="center" style="font-size: 16px;">${response.items[0].introduction}</p>
										                <p class="intro-addr" align="center" style="font-size: 12px;">주소: ${response.items[0].address}</p>
									                </div>
									                <div class = "modal-map-area">
									                	<div id="map" class="map"></div>
									                </div>
												</div>
												<div class="modal-footer text-center" style="display: block;">
													<button type="button" class="genric-btn warning circle" id="button-insert">담기</button>
													<input type="hidden" value="${response.items[0].contentsid}">
												</div>
											</div>
										</div>`;
										
				$('#myModal').empty();
				$('#myModal').html(innerValue);
				$('#myModal').modal('show');
				
				/******모달 내부 map*******/
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(response.items[0].latitude, response.items[0].longitude), // 지도의 중심좌표
						level: 9 // 지도의 확대 레벨
					};
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(response.items[0].latitude, response.items[0].longitude);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

			}
		}
	)

});


$(document).on("click", ".close", function(event) {
	$('#myModal').modal('hide');
});

// 모달 창 이외의 곳 클릭시에도 모달창 닫기
window.onclick = function(event) {
	if (event.target == modal) {
		$('#myModal').modal('hide');
	}
}

// 찜목록 담기 비동기 처리
$(document).on("click", "#button-insert", function(event) {
	const targetValue = $(event.target).next().val();
	const url = "insertcartlist.tourlist";
	const form_data = {
		contentId: targetValue
	}

	$.ajax(
		{
			url: url,
			data: form_data,
			success: function(response) {
				alert(response);
			}
		}
	)
});