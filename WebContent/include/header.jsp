<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<div class="header-area header-sticky">
			<div class="main-header ">
				<div class="container">
					<div class="row align-items-center">
						<!-- logo -->
						<div class="col-xl-2 col-lg-2">
							<div class="logo">
								<a href="bopage.jsp"><img src="image/headerFinal.png" alt=""></a>
							</div>
						</div>
						<div class="col-xl-8 col-lg-8">
							<!-- main-menu -->
							<div class="main-menu f-right d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="tourList.tourlist">관광지</a></li>
										<li><a href="">커뮤니티</a>
											<ul class="submenu" style="z-index: 5">
												<li><a href="boardList.sun">선희 커뮤니티</a></li>
												<li><a href="boardList.ha">준수 커뮤니티</a></li>
												<li><a href="boardList.ain">아인 커뮤니티</a></li>
											</ul></li>
										<li><a>고객센터</a>
											<ul class="submenu">
												<li><a href="boardList.bo">공지사항</a></li>
												<li><a href="howToUse.do">이용방법</a></li>
												<li><a href="boardList.qna">Q&A</a></li>
												<li><a href="introduce.do">회사소개</a></li>
												<li><a href="terms.do">이용약관</a></li>
												<li><a href="personalInfo.do">개인정보처리방침</a></li>
											</ul></li>
										<li><a href="#">마이페이지</a>
											<ul class="submenu">
												<li><a href="InfoEdit.do">내 정보 변경</a>
												<li><a href="mytourList.tourlist">내 여행지</a></li>
												<li><a href="LogOutOk.do">로그아웃</a></li>
											</ul></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-2 col-lg-2">
							<!-- header-btn -->
							<div class="header-btn">
								<a class="btn btn1 d-none d-lg-block"
								<%
						if(session.getAttribute("email") != null){
						out.print("href='LogOutOk.do'>Logout");
						}else{
						out.print("href='Login.do'>Login"); 
						}
						%> </a>
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
</body>
</html>