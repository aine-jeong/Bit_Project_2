
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
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
   <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
   
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
   
   <style type="text/css">
	
	*{
	 font-family: 'Nanum Gothic', sans-serif;
	}
	
	.note-editable{
	height:300px;
	}
	
	.btn-primary{
		color : #F2CF7C;
	}
	
	#btnSave2{
		margin-right : 5px;
	}
	</style>
	
   
	<%-- <link rel="Stylesheet" href="${pageContext.request.contextPath}/css/default.css" /> --%>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <!-- include summernote css/js -->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   
   <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
     </script>
     
	<SCRIPT type="text/javascript">
	function boardcheck() {
		if (!rewrite.title.value) {
			alert("????????? ???????????????");
			rewrite.title.focus();
			return false;
		}
		if (!rewrite.summernote.value) {

			alert("????????? ???????????????");
			rewrite.summernote.focus();
			return false;
		}
		/*
		if (!bbs.content.value) {
			alert("??? ????????? ???????????????");
			bbs.content.focus();
			return false;
		}
		

		if (!bbs.pwd.value) {
			alert("??????????????? ???????????????");
			bbs.pwd.focus();
			return false;
		}
		*/

		document.rewrite.submit();

	}
</SCRIPT>
</head>
<body>
<!-- Header-->
       <jsp:include page="/include/header.jsp"></jsp:include>
      <!-- /Header -->

    <c:set var="dto" value="${multi.dto}" />
	<c:set var="c_number" value="${requestScope.c_number}" />
	<c:set var="cpage" value="${requestScope.cp}" />
	<c:set var="pagesize" value="${requestScope.ps}" />
	<c:set var="title" value="${requestScope.title}" />
	<hr style="color : gray;">
     <!--   <div class="breadcrumbs">
         <div class="col-sm-4">
            <div class="page-header float-left">
            </div>
         </div>
         <div class="col-sm-8">
            <div class="page-header float-right">
               <div class="page-title">
               
               </div>
            </div>
         </div>
      </div> -->

      <!-- <form name="list"> -->
      <%-- ${requestScope.list} --%>
      <!--  </form> -->
     <div class="main-panel">
         <div class="content-wrapper">
            <div class="row ">
               <div class="col-12">
               
               
               
       <article>
		<div class="container" role="main">
			<form name="rewrite" action="boardRewriteOk.sun" method="POST" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="reg_id">??????</label> 
					<input type="text" class="form-control" name="title" id="title" value="RE_${title}"
						placeholder="????????? ????????? ?????????">
				</div>

				<div class="mb-3">
					<label for="reg_id">?????????</label> <input type="text"
						class="form-control" name="nickname" id="nickname" value="${nickname}" style="border:none" readonly>
				</div>
				
				
				<div class="mb-3">
					<label for="reg_id">????????????</label> <input type="file"
						class="form-control" name="filename" id="filename"
						placeholder="????????????">
				</div>

				<!-- ???????????? ?????? -->
				<div class="mb-3">
					<label for="content">??????</label>
				<textarea class="form-control" rows="50" name="content" id="summernote"
						placeholder="????????? ????????? ?????????" ></textarea>
					<!--  <textarea id="summernote" name="editordata"></textarea>-->
				</div>
				
				<input type="hidden" name="c_number" value="${c_number}">
				
			</form>
				<div>
				<button type="button" class="btn" id="btnSave" onclick="boardcheck()">??????</button>
				<button type="button" class="btn" id="btnList" onclick="location.href='boardList.sun';">??????</button>
			</div>
				
			<div style = "padding: 5px 1px 2px 3px;"></div>
		</div>

	</article>
              
            </div>
         </div>
         </div>
         
         
      </div> 
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>

