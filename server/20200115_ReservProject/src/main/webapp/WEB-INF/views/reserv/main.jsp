<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<!--important meta tag-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- title -->
<title>우연 - 우리 동네 연습실</title>

<!-- shortcut icon -->
<link rel="shortcut icon" href="img/favicon/favicon.ico">

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
	href="${ pageContext.request.contextPath }/resources/css/style.css">

<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive.css">

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
						<a href="main.do" class="navbar-brand"> <img
							src="${ pageContext.request.contextPath }/resources/img/logo/logo.png"
							alt="logo">

						</a>

					</div>

					<!-- Main Menu -->
					<div class="container">
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav pull-right">
								<li><a class="active" href="#">Home</a></li>
								<li><a href="search.do">연습실 찾기</a></li>
								<li><a href="reservation.do">예약하기</a></li>
								<li><a href="#">문의하기</a></li>
								<c:if test="${empty member }">
									<li><a href="${ pageContext.request.contextPath }/member/login_form.do">로그인</a></li>
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
								<li><a class="active" href="#">Home</a></li>
								<li><a href="search.do">연습실 찾기</a></li>
								<li><a href="reservation.do">예약하기</a></li>
								<li><a href="#">문의하기</a></li>
								<c:if test="${empty member }">
									<li><a href="${ pageContext.request.contextPath }/member/login_form.do">로그인</a></li>
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

		<!-- Background Video -->
		<video id="home-bg-video"
			poster="${ pageContext.request.contextPath }/resources/video/Strum-Away.jpg"
			autoplay loop muted>
			<source
				src="${ pageContext.request.contextPath }/resources/video/Strum-Away.mp4"
				type="video/mp4">
			<source
				src="${ pageContext.request.contextPath }/resources/video/Strum-Away.ogv"
				type="video/ogv">
			<source
				src="${ pageContext.request.contextPath }/resources/video/Strum-Away.webm"
				type="video/webm">
		</video>

		<!-- Overlay -->
		<div id="home-overlay"></div>

		<!-- Home Content -->
		<div id="home-content">


			<div id="home-content-inner" class="text-center">

				<div id="home-heading">

					<h1 id="home-heading-1">
						<span>힐링</span>과 <span>성장</span>을 대여하세요
					</h1>
					<br>

				</div>

				<div id="home-text">

					<p class="lead">큰 비용 부담 없이 여러분의 삶이 지금보다 한 단계 업그레이드됩니다.</p>

				</div>

				<div id="home-btn">
					<a class="btn btn-general btn-home-member" href="reservation.do"
						id="member" role="button">예약하기</a>

				</div>


			</div>

		</div>

	</section>
	<!-- Home Ends -->

	<!-- About -->
	<section id="about">
		<div class="about-content">
			<!--About heading -->
			<div class="heading-top text-center">
				<div class="horizontal-heading">
					<h5>'우연'이어야만 하는 이유 #1</h5>
					<h2>
						다양한 서비스로 <strong>우연</strong>과 함께하세요
					</h2>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<!--About 01-->
					<div class="col-md-4">
						<div class="about-item text-center">
							<i class="fas fa-hand-holding-usd"></i>
							<h3>부담없는 가격</h3>
							<hr>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Natus enim cumque qui impedit quasi alias repellendus error
								tempore.</p>
						</div>
					</div>

					<!--About 02-->
					<div class="col-md-4">
						<div class="about-item text-center">
							<i class="far fa-calendar-check"></i>
							<h3>간편한 예약시스템</h3>
							<hr>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Natus enim cumque qui impedit quasi alias repellendus error
								tempore.</p>
						</div>
					</div>
					<!--About 03-->
					<div class="col-md-4">
						<div class="about-item text-center">
							<i class="fas fa-icons"></i>
							<h3>쾌적한 시설</h3>
							<hr>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Natus enim cumque qui impedit quasi alias repellendus error
								tempore.</p>
						</div>
					</div>

				</div>
			</div>

		</div>

	</section>
	<!-- About ends-->

	<!-- Reason -->
	<section id="reason">
		<div class="content-box-lg">

			<div class="container">
				<div class="row">
					<!-- Reason Heading -->
					<div class="col-md-12">
						<div class="heading-top text-center">
							<div class="horizontal-heading">
								<h5>'우연'이어야만 하는 이유 #2</h5>
								<h2>
									더 좋은 <strong>나</strong>를 위해<br> 더 좋은 <strong>날</strong>을
									위해
								</h2>

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-xs-12 hidden hr">
						<hr>
					</div>
				</div>


				<!-- Reason 01-->
				<div class="reason">

					<div class="row">
						<div class="col-md-5">

							<div class="room-img">
								<img
									src="${ pageContext.request.contextPath }/resources/img/room/room_1.jpg"
									alt="room" class="img-responsive">
							</div>
						</div>

						<div class="col-md-7 reason-content">
							<div class="reason-doc text-center">
								<h4>Brand Stroy</h4>
								<h3>THE PREMIUM SPACE</h3>
							</div>
							<div class="reason-doc-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Nesciunt voluptate porro maiores quam ut sequi quis, expedita
									labore minima reiciendis odit voluptatum fugit, iure amet ab
									quod odio praesentium tempore? Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Nesciunt voluptate porro maiores
									quam ut sequi quis.</p>


							</div>
						</div>
					</div>

				</div>

				<!-- Reason 02-->
				<div class="reason">
					<div class="row">

						<div class="col-md-5">
							<div class="room-img">
								<img
									src="${ pageContext.request.contextPath }/resources/img/room/room_2.jpg"
									alt="room" class="img-responsive">
							</div>
						</div>

						<div class="col-md-7 reason-content">
							<div class="reason-doc text-center">
								<h4>Service</h4>
								<h3>PERFECT SERVICE</h3>
							</div>
							<div class="reason-doc-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Nesciunt voluptate porro maiores quam ut sequi quis, expedita
									labore minima reiciendis odit voluptatum fugit, iure amet ab
									quod odio praesentium tempore? Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Nesciunt voluptate porro maiores
									quam ut sequi quis.</p>

							</div>
						</div>
					</div>
				</div>

				<!-- Reason 03-->
				<div class="reason">
					<div class="row">
						<div class="col-md-5">

							<div class="room-img">
								<img
									src="${ pageContext.request.contextPath }/resources/img/room/room_3.jpg"
									alt="room" class="img-responsive">
							</div>
						</div>

						<div class="col-md-7 reason-content">
							<div class="reason-doc text-center">
								<h4>Welcome Gift</h4>
								<h3>WELCOME GIFT BOX</h3>
							</div>
							<div class="reason-doc-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Nesciunt voluptate porro maiores quam ut sequi quis, expedita
									labore minima reiciendis odit voluptatum fugit, iure amet ab
									quod odio praesentium tempore? Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Nesciunt voluptate porro maiores
									quam ut sequi quis.</p>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Reason ends -->

	<!-- Plus -->
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
	<!-- Plus Ends-->

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
		src="${ pageContext.request.contextPath }/resources/js/common.js"></script>

</body>


</html>