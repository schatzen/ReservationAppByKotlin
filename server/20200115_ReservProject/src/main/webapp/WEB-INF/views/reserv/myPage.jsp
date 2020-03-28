<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>

<!--important meta tag-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- title -->
<title>우연 - 우리동네 연습실</title>

<!-- shortcut icon -->
<link rel="shortcut icon"
	href="${ pageContext.request.contextPath }/resources/img/favicon/favicon.ico">

<!-- google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap&subset=korean"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.0/css/v4-shims.css">

<!-- BootStrap -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap/bootstrap.css">

<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/owl-carousel/owl.theme.default.min.css">


<!-- Css link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style-myPage.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-myPage.css">


<!-- Javascript in HTML -->
<script type="text/javascript">
	function getTanFrist() {
		$("#tab-first").tab('show');
	}

</script>

</head>

<body data-spy="scroll" data-target=".navbar" data-offset="65">

	<!-- Header-->
	<header>
		<nav class="navbar navbar-fixed-top">
			<div class="container-fluid">
				<div class="site-nav-wrapper">
					<div class="navbar-header">

						<!-- Mobile Menu Poen Button -->
						<span id="mobile-nav-open-btn">&#9776;</span>

						<!-- Logo -->
						<a href="#home" class="navbar-brand"> <img
							src="${ pageContext.request.contextPath }/resources/img/logo/logo.png"
							alt="logo">

						</a>

					</div>

					<!-- Main Menu -->
					<div class="container">
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav pull-right">
								<li><a href="main.do">Home</a></li>
								<li><a href="search.do">연습실 찾기</a></li>
								<li><a href="reservation.do">예약하기</a></li>
								<li><a href="#">문의하기</a></li>
								<c:if test="${empty member }">
									<li><a href="login_form.do">로그인</a></li>
								</c:if>
								<c:if test="${not empty member }">
									<li><a href="myPage.do?member_idx=${member.member_idx }">마이페이지</a></li>
								</c:if>

							</ul>
						</div>
					</div>

					<!-- Mobile Menu -->
					<div id="mobile-nav">
						<!-- Mobile Menu Close Button -->
						<span id="mobile-nav-close-btn">&times;</span>
						<div id="mobile-nav-content">
							<ul class="nav">
								<li><a href="main.do">Home</a></li>
								<li><a href="search.do">연습실 찾기</a></li>
								<li><a href="#">예약하기</a></li>
								<li><a href="reservation.do">문의하기</a></li>
								<c:if test="${empty member }">
									<li><a href="login_form.do">로그인</a></li>
								</c:if>
								<c:if test="${not empty member }">
									<li><a href="myPage.do?member_idx=${member.member_idx }">마이페이지</a></li>
								</c:if>

							</ul>
						</div>
					</div>

				</div>
			</div>

		</nav>

	</header>
	<!-- Header Ends-->


	<!-- Home -->

	<section id="home">

		<div id="home-bg-video" class="img-reponsive"></div>

		<!-- Overlay -->
		<div id="home-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="home-content-total">
					<div class="col-md-6">
						<!-- Home Content-01 -->
						<div id="home-content-01">


							<div id="home-content-inner" class="text-left">

								<div id="home-heading">

									<h1 id="home-heading-1">
										Space service<br> <span>forward</span>
									</h1>
									<br>
								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>


	</section>
	<!-- Home -->

	<!-- About -->
	<section id="about">

		<!-- About 02-->

		<div class="content-box-lg">

			<div class="heading-top text-center">
				<div class="horizontal-heading">
					<h2>나의 예약</h2>
				</div>
			</div>

			<div class="my-page">
				<div class="container">
					<div class="row">
						<div class="my-page-inner text-center">
							<div class="col-md-3">
								<div class="my-page-top top-profile">
									<p>${member_vo.member_name }님</p>
									<p>
										잔여시간 : <span>00시간 00분</span>
									</p>
								</div>
							</div>
							<div class="col-md-3">
								<a href="#sectionA" data-toggle="tab" id="tab-first">
									<div class="my-page-top top-left">
										<i class="far fa-calendar"></i>
										<p>이용예정</p>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<a href="#sectionB" data-toggle="tab">
									<div class="my-page-top top-middle">
										<i class="far fa-calendar-check"></i>
										<p>이용내역</p>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<a href="#sectionC" data-toggle="tab">
									<div class="my-page-top top-right">
										<i class="fas fa-exclamation-circle"></i>
										<p>공지사항</p>
									</div>
								</a>
							</div>
						</div>
					</div>

					<div class="tab-content my-page-bottom">

						<div id="sectionA" class="my-page-inner tab-pane fade text-center">
							<div class="row">
								<c:forEach var="vo" items="${reserv_vo}">
										<div class="col-md-6">
											<div class="my-page-content content-left">

												<p>${vo.reserv_start } - ${vo.reserv_end }<br>
													<strong>${vo.reserv_branch } ${vo.reserv_room }룸</strong>

												</p>

												<span>${vo.reserv_regdate }에 예약등록 </span>
											</div>
										</div>
										<div class="col-md-6">
											<div class="my-page-content content-right">
												<c:if test="${vo.reserv_state eq 'not_confirmed' }">
													<p>관리자의 승인을 기다리는 중입니다.</p>
													<p>조금만 기다려주세요.</p>
												</c:if>
												<c:if test="${vo.reserv_state eq 'confirmed' }">
													<p>
														1층 비밀번호 : <strong>1234 </strong> | 정문 비밀번호 : <strong>0000</strong>
													</p>
													<p>
														룸 비밀번호는 예약시간 <strong>20분</strong>전에 알려드립니다.
													</p>
												</c:if>
											</div>
										</div>
								</c:forEach>

								<c:if test="${ empty reserv_vo}">
								   예약내용이 없습니다.
								</c:if>

							</div>

					
						</div>

						<div id="sectionB" class="my-page-inner tab-pane fade text-left">
							<div class="col-md-12">
								<div class="my-page-content content-use">
									<c:forEach var="vo" items="${reserv_used_list}">
	
											<p>
												<strong>${vo.reserv_start } - ${vo.reserv_end }</strong><br>
												${vo.reserv_branch } 지점 ${vo.reserv_room} 이용 <br>
												${vo.reserv_regdate }에 예약
											</p>
											<br>
								
									</c:forEach>

								</div>
							</div>
						</div>

						<div id="sectionC" class="my-page-inner tab-pane fade text-left">
							<div class="col-md-12">
								<div class="my-page-content content-notice">
									<a href="#">
										<p>
											<strong>공지사항&nbsp;</strong>우연을 예약해주셔서 대단히 감사합니다.
										</p>
									</a> <a href="#">
										<p>
											<strong>공지사항&nbsp;</strong>이용시 주의사항
										</p>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About ends-->


	<!-- Plust-->

	<section id="plus">
		<div id="plus-slider" class="owl-carousel owl-theme">
			<!-- Plus Friend 01 -->
			<div class="plus-friend-01">
				<div class="plus-content text-center">
					<h1>지금 바로 카카오 플러스 친구를 등록하세요</h1>
					<p>더 쉽고 빠르게 우연의 최신 소식을 받아 볼 수 있습니다.</p>
					<div id="plus-btn">
						<a class="btn btn-general btn-plus-kakao" href="#about"
							id="member" role="button">친구 추가</a>
					</div>
				</div>
			</div>

			<!-- Plus Friend 02 -->
			<div class="plus-friend-02">
				<div class="plus-content text-center">
					<h1>지금 바로 페이스북 친구를 등록하세요</h1>
					<p>더 쉽고 빠르게 우연의 최신 소식을 받아 볼 수 있습니다.</p>
					<div id="plus-btn">
						<a class="btn btn-general btn-plus-facebook" href="#about"
							id="member" role="button">친구 추가</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--  JQuery file -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<!--  BootStrap file -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.js"></script>

	<!-- Owl Carousel Js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/owl_carousel/owl.carousel.min.js"></script>


	<!-- JavaScript file-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/script-myPage.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/common.js"></script>

</body>


</html>