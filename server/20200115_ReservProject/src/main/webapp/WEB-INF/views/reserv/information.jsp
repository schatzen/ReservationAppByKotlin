<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- Bootstrap Timepicker-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/time-picker/css/bootstrap-datetimepicker.css">

<!-- Css link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style-reservation-detail.css">

<!-- Reponsive Css -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-detail.css">


<!--  JQuery file -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!--  BootStrap file -->
<script
	src="${ pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.js"></script>

<!-- Owl Carousel Js -->
<script
	src="${ pageContext.request.contextPath }/resources/js/owl_carousel/owl.carousel.min.js"></script>

<!-- Google Maps JS -->
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6QwBUDy6aQdb9980psIyti3euOxh02Wc&callback=initMap">
    </script>

<!-- Bootstrap Timepicker-->
<script
	src="${ pageContext.request.contextPath }/resources/js/time-picker/js/bootstrap-datetimepicker.js"></script>

<!-- JavaScript file-->
<script
	src="${ pageContext.request.contextPath }/resources/js/common.js"></script>


<script type="text/javascript">
   $(window).on('load', function () {

	    var addressString = 'Losangeles';
	    
	    var infowindow = new google.maps.InfoWindow({
	        content : addressString
	    });
	    
	    //alert('${ lng }');
	    var map= new google.maps.Map(document.getElementById('map'), {
	        zoom: 15,
	        center: {'lat':${lat}, 'lng':${lng} }
	        });
	    
	    var marker = new google.maps.Marker({position:{'lat':${lat}, 'lng':${lng} }, map:map});
	    
	});
   


		/* =========================
		Photo
		==========================*/
		$(function() {
			$("#photo-slider").owlCarousel({
				items : 1,
				margin : 14,
				autoplay : true,
				autoplayTimeout : 3000,
				loop : true,
				autoplayHoverPause : true,
			});

		});

		/* =========================
		 Tab
		 ==========================*/

		$(document).ready(function() {
			//1st (1-1 = 0) tab selected initialy
			$("#myTab li:eq(0) a").tab('show');
		});

   
   </script>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="65">

	<!-- Preloader -->
	<!--<div id="preloader">
        <div id="status">&nbsp;</div>
    </div>-->

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
								<li><a href="main.do">Home</a></li>
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
								<li><a href="main.do">Home</a></li>
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


	<!-- Home Start -->

	<section id="home">

		<div id="home-bg-video"></div>

		<!-- Overlay -->
		<div id="home-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="home-content-total">
					<div class="col-md-12">
						<!-- Home Content-01 -->
						<div id="home-content-01">

							<div id="home-content-inner" class="text-left">

								<div id="home-heading">

									<h1 id="home-heading-1">
										Space service<br> that moves work<br> <span>forward</span>
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
	<!-- Home Ends-->

	<!-- About -->
	<section id="about">
		<div id="about-inner">
			<div class="container">

				<!-- Photo Slider Content-->
				<div class="contentbox-about">

					<!-- Photo Heading -->
					<div class="heading-top text-center">
						<div class="horizontal-heading">
							<h5>#지점 정보를 확인하세요.</h5>
							<h2>${loc_name }</h2>
						</div>
					</div>

					<!-- Photo Slider-->
					<div class="row">
						<div class="branch-photos text-center">
							<div class="branch-photo text-center">
								<div id="photo-slider" class="owl-carousel owl-theme">

									<!--Photo 01 -->
									<div class="item">
										<img
											src="${ pageContext.request.contextPath }/resources/img/reserv/reserv-10.jpg">
									</div>

									<!-- Photo 02 -->
									<div class="item">
										<img
											src="${ pageContext.request.contextPath }/resources/img/reserv/reserv-11.jpg">
									</div>

									<!-- Photo 03 -->
									<div class="item">
										<img
											src="${ pageContext.request.contextPath }/resources/img/reserv/reserv-9.jpg">
									</div>

									<!-- Photo 04 -->
									<div class="item">
										<img
											src="${ pageContext.request.contextPath }/resources/img/room/room_1.jpg">
									</div>

									<!-- Photo 05 -->
									<div class="item">
										<img
											src="${ pageContext.request.contextPath }/resources/img/room/room_2.jpg">
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Ends-->


	<!-- Detail Start-->
	<section id="detail">
		<div class="content-box-lg">
			<div class="container">

				<!-- Nav Tab -->
				<div class="row">
					<div class="col-md-12 col-xs-12">
						<div class="nav-content">
							<ul class="nav nav-tabs" id="myTab">
								<li><a data-toggle="tab" href="#sectionA">Location</a></li>
								<li><a data-toggle="tab" href="#sectionB">Services</a></li>
								<li><a data-toggle="tab" href="#sectionC">Information</a></li>
							</ul>
						</div>
					</div>
				</div>


				<div class="tab-content">

					<!-- Section A -->
					<div id="sectionA" class="tab-pane fade">
						<div class="section-content text-center">
							<div id="map"></div>
						</div>
					</div>

					<!-- Section B -->
					<div id="sectionB" class="tab-pane fade">
						<div class="section-content text-center">

							<div class="inner-icon">
								<i class="fas fa-fan"></i>
								<p>에어컨</p>
							</div>

							<div class="inner-icon">
								<i class="fas fa-wifi"></i>
								<p>무료 Wifi</p>
							</div>

							<div class="inner-icon">
								<i class="fas fa-microphone-alt"></i>
								<p>마이크</p>
							</div>

							<div class="inner-icon">
								<i class="fas fa-volume-up"></i>
								<p>스피커</p>
							</div>

							<br>

							<div class="inner-icon">
								<i class="fas fa-tint"></i>
								<p>정수기</p>
							</div>
							<div class="inner-icon">
								<i class="fab fa-hotjar"></i>
								<p>난방</p>
							</div>

							<div class="inner-icon">
								<i class="fas fa-video"></i>
								<p>CCTV</p>
							</div>
							<div class="inner-icon">
								<i class="fas fa-keyboard"></i>
								<p>피아노</p>
							</div>
							<div class="inner-icon">
								<i class="far fa-clock"></i>
								<p>24시간</p>
							</div>

						</div>
					</div>

					<!-- Section C -->
					<div id="sectionC" class="tab-pane fade in active">
						<div class="section-content information">

							<div class="inner-content">

								<table class="table text-center">
									<tbody>

										<tr>
											<th>지점명</th>
											<td>${loc_name }</td>
										</tr>

										<tr>
											<th>방 개수</th>
											<td>10</td>
										</tr>

										<tr>
											<th>주소</th>
											<td>${loc_addr }</td>
										</tr>

										<tr>
											<th>사업자번호</th>
											<td>013-12314-123141</td>
										</tr>

										<tr>
											<th>연락처</th>
											<td>${loc_tel }</td>
										</tr>

									</tbody>
								</table>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Detail ends-->


	<!-- Plus-->
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
	<!-- Plus Ends -->






</body>


</html>