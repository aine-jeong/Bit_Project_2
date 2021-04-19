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

function setDivision1(str) {
	
	if(firstDivision.length == 0 || !firstDivisionContainStr(firstDivision, str)) {
		firstDivision.push(str);
		document.querySelector('#division1').innerHTML += '<td>' + str + '</td>';
	}
}

async function firstDiv() {
	
	return new Promise((resolve, reject) => {
		
		$.each(totalResult, function(index, item) {
    		
    		$.each(item.items, (index2, item2) => {
				
    			var str = "";
    			
    			
    			if(item2.region1cd == null) {
    				// 1차 지역 코드가 없는 경우
    				fdisNull.push(item2);
    				return true;
    			} else {
    				str = item2.region1cd.label;
    				notNullTotalResult.push(item2);
    			}
    			
    			setDivision1(str);
				
			});
    	});
		
		resolve();
		
	})
	
}

async function init() {
	var page = 0;
	
	var form_data = {
		apiKey : API_KEY,
		locale : LOCALE,
		page : page
	};
	
	await getJejuData(form_data);
	for(var i = 1; i < maxPage; i++) {
		getJejuData(form_data);
	}
	
	await firstDiv();
	
}

// 배열의 중복값은 받지 않음
function firstDivisionContainStr(firstDivision, str) {
	for(var i = 0; i < firstDivision.length; i++){
		if(str === firstDivision[i]) {
			return true;
		}
	}
	return false;
}

// 제주비짓 REST API 데이터 받기
async function getJejuData(form_data) {
	return new Promise((resolve, reject) => {

		form_data.page = form_data.page + 1; 
		
		$.ajax(
        		{
					url: API_URL,
					data: form_data,
					success: (response) => {
						
						maxPage = response.pageCount;
						
						totalResult.push(response);
						
						resolve(form_data);
					}
				}
        	);
		
	});
	
}

// 1차 지역 클릭 이벤트 동적 할당
$(document).on("click", "#division1 > td", function(event) {
	
	var targetValue = $(event.target).text();
	
	if(targetValue === "전체") {
		return;
	}else {
		
		selectedFirst = targetValue;
		
		// 2차지역 라벨 배열 초기화
		secondDivision = [];	
		
		var arr = [];
		
		$.each(notNullTotalResult, function(index, item) {
			if(item.region1cd.label === targetValue) {
				arr.push(item);
			}
		});
		
		setSecondDivision(arr);
		
	}
	
	
	
	
});

$(document).on("click", "#div2 > div > table > tbody > tr > td", function(event) {
	
	var targetValue = $(event.target).text();
	
	if(targetValue === "전체") {
		return;
	} else {
		selectedSecond = targetValue;
		
		var arr = [];
		
		$.each(notNullTotalResult, function(index, item){
			if(item.region1cd.label === selectedFirst && item.region2cd.label === selectedSecond) {
				arr.push(item);
			}
		});
		
	}
	
	setCard(arr);
	
});

// 2차 지역 라벨 만들기
function setSecondDivision(arr) {
	
	$.each(arr, function(index, item) {
		
		var str = item.region2cd.label;
		
		if(!firstDivisionContainStr(secondDivision, str)){
			secondDivision.push(str);
		}
	});
	
	var innerValue = ""
	
	innerValue += '<div class="container box_1170"><table class="table table-bordered table-hover"><tbody class="text-center">';
	
	for(var i = 0; i < secondDivision.length; i++) {
		
		if(i % 4 == 0) {
			innerValue += '<tr>';
		}
		
		if(i == 0) {
			var rowsp = Math.ceil(secondDivision.length / 4) + 1;
			innerValue += '<td class="text-center" style="background-color: orange; color: white;" rowspan="'+rowsp+'">전체</td>';
			continue;
		}
		
		innerValue += '<td>';
		
		innerValue += secondDivision[i];
		
		innerValue += '</td>';
		
		
		if(i % 4 == 3) {
			innerValue += "</tr>";
		}
	}
	
	innerValue += '</tbody></table></div>';
	
	// 2차 지역 라벨 클리어 
	$('#div2').empty();
	$('#div2').html(innerValue);
}

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
								<div>${"#"+(item.alltag).replaceAll(",", " #")}</div>
								<div class="mt-3"><a href="insertcartlist.tourlist?contentId=${item.contentsid}" class="genric-btn warning circle">담기</a></div>

                            </div>
                        </div>
                       </div>`;
	});
	
	console.log(innerValue);
	
	$('#row').empty();
	$('#row').html(innerValue);

}


var modal = document.getElementById('myModal');
var btn = document.getElementById('myBtn');

var span = document.getElementsByClassName('close')[0];


$(document).on("click", "#myBtn", function(event) {
	// e.preventDefault() 와 stopPropagation() 의 차이
	
	$('#myModal').empty();
	
	event.preventDefault();
    modal.style.display = "block";
	
	var contentId = $(event.target).next().val();
	console.log(contentId);
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
				
				var innerValue = "" + `<div class="modal-content">
			            <span class="modal_closeBtn"> &times; </span>
			            <img id = "image" src="${response.items[0].repPhoto.photoid.imgpath}">
			            <div class = "modal-title">
			                <p class="title-text">${response.items[0].title}</p>
			                <p class="category">${selectedFirst} > ${selectedSecond}</p>
			            </div>
			            <div class = "modal-intro">
			                <p class="intro-text">${response.items[0].introduction}</p>
			                <p class="intro-tag">${"#"+(response.items[0].alltag).replaceAll(",", " #")}</p>
			                <p class="intro-addr">${response.items[0].address}</p>
			            </div>
			            <div class = "modal-map">
			            </div>
			            <div class = "modal-putBtn">
			                <div class = "putBtnMargin"></div>
			                <div class = "btnSize">
			                    <button class="putBtn">담기</button>
			                </div>
			            </div>
			        </div>`;

				$('#myModal').empty();
				$('#myModal').html(innerValue);

			}
		}
	)
	
});

$(document).on("click", ".close", function(event) {
	modal.style.display = "none";
});

// 모달 창 이외의 곳 클릭시에도 모달창 닫기
window.onclick = function(event) {
    if(event.target == modal) {
        modal.style.display = "none";
    }
}




