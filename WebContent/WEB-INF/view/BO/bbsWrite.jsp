<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="manifest" href="site.webmanifest">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

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
	
		<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<SCRIPT type="text/javascript">
	
function check(){
    if(!bbs.N_TITLE.value){
        alert("제목을 입력하세요");
        bbs.N_TITLE.focus();
        return false;
    } else if(!bbs.N_CONTENT.value){            
        alert("글 내용을 입력하세요");
        bbs.N_CONTENT.focus();
        return false;
    }else{
    	document.bbs.submit();
    }
}

</SCRIPT>

<!-- include summernote css/js -->
<link href="boSummernote/summernote.min.css" rel="stylesheet">
<script src="boSummernote/summernote.min.js"></script>

<style>
.btn i {
  color: #000000;
  font-size: 12px;
  -webkit-transition: all 0.4s ease-out 0s;
  -moz-transition: all 0.4s ease-out 0s;
  -ms-transition: all 0.4s ease-out 0s;
  -o-transition: all 0.4s ease-out 0s;
  transition: all 0.4s ease-out 0s;
  }
  
  .font-back-tittle .archivment-front h3{
	font-family: 'Nanum Gothic', sans-serif;
	}
	
	.font-back-tittle h3.archivment-back{
	font-family: 'Nanum Gothic', sans-serif;
	}
	
	.note-editor.note-airframe, .note-editor.note-frame{
	width: 95%
	}
	
	[class^="ti-"], [class*=" ti-"] {
	line-height:inherit;
	}
	
	.preview {
	border-color: black;
	border-radius: 10px;
	}
	
	.preview p{
	font-family: 'Nanum Gothic', sans-serif;
	color: #587D4E;
	}
	
	#image_uploads{
	float: left;
	}
	
	
	/* 
	.writeBtn{
	padding: 25px 0px;
    padding-top: 25px;
    padding-right: 0px;
    padding-bottom: 25px;
    padding-left: 0px;
	} */
</style>
</head>
<body>
	 <%
        pageContext.include("/include/header.jsp");
     %>
	
	
    <div id="pageContainer">
        <div style="padding-top: 25px; text-align: center">
            <!-- form 시작 ---------->
            <form name="bbs" action="boardWriteOk.bo" method="POST" enctype="multipart/form-data">
            <div class="font-back-tittle mb-50">
								<div class="archivment-front">
									<h3 style="color: #EAAF24">공지사항 📣</h3>
								</div>
								<h3 class="archivment-back">공지사항</h3>
							</div>
                <table width="95%" border="0" align="center">
                    <tr>
                        <td width="10%" align="center"></td>
                        <td width="95%" align="left"><input type="text" style="width:inherit;" name="N_TITLE" size="40" value="제목을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td width="10%" align="center"></td>
                        <td style="padding-top: 25px;" width="95%" align="left"><textarea style="width=95%" id ="summernote" rows="40" cols="60" style="width:inherit;" name="N_CONTENT" class="ckeditor" ></textarea></td>
                    </tr>
                    <tr>
                        <td width="10%" align="center"></td>
                        <td width="80%" align="left">
                         <label for="image_uploads" style="color: #587D4E; font-family: 'Nanum Gothic';"><img src="image/upload.png">(gif,png,jpg,jpeg의 형식만 업로드 가능합니다.)</label>
                         <input height="1px" name="image_uploads" id="image_uploads" type="file">
                         <div class="preview">
						    <p>아직 업로드 된 파일이 없습니다.</p>
						 </div>
                         </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 30px;" colspan="2" align="center">
                        	<input class="btn" type="button" value="목록" onclick="location.href = 'boardList.bo'" />
                            <input class="btn" type="button" value="글쓰기" onclick="check()" />
                        </td>
                    </tr>
                </table>
              </form>
        </div>
    </div>
    <div style="padding-top: 50px">
		</div>
    <footer>
		<jsp:include page="/include/footer.jsp"></jsp:include>
	</footer>
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<!-- <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script> -->
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
	
	<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote({
			height: 300,
			minHeight: 300,             // set minimum height of editor
			maxHeight: 600,       
		    lang: 'ko-KR' // default: 'en-US'
		  });
		  var input = document.querySelector('#image_uploads');
		  var preview = document.querySelector('.preview');
		  input.style.opacity = 0.0;
		  input.style.float = "right";
		  input.addEventListener("change", function(event) {
			  $('.preview').empty();
			  $('.preview').append("<p>"+event.target.value+"<p>");
		  })
	});
	</script>	
	
</body>
</html>