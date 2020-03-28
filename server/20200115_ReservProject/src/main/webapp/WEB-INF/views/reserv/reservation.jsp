<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- jQuery timepicker -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<!-- Bootstrap Timepicker-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/time-picker/css/bootstrap-datetimepicker.css">

<!-- Css link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style-myReservation.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-myreservation.css">


<!-- JQuery file -->
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


<!-- jQuery JS Timepicker -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- JS Common File -->
<script
	src="${ pageContext.request.contextPath }/resources/js/common.js"></script>


<!-- JS  -->
<script type="text/javascript">
	/* DropDown Selected */

	/* =========================
	 Send Form
	 ==========================*/
	function member_send(member_idx) {

		var reserv_member_idx = member_idx;
		var reserv_branch = $("#typeOfBranch").val();
		var reserv_room = $("#typeOfRoom").val();
		var start_date = $(".form_datetime_start").data("datetimepicker")
				.getDate();
		var end_date = $(".form_datetime_end").data("datetimepicker").getDate();
		var reserv_doc = $("#memo").val();

		var reserv_state = 'not_confirmed';

		var s_year = start_date.getFullYear();
		var s_month = (start_date.getMonth() + 1)
		var s_day = start_date.getDate()
		var s_hour = start_date.getHours()
		var s_minute = start_date.getMinutes()

		var e_year = end_date.getFullYear()
		var e_month = (end_date.getMonth() + 1)
		var e_day = end_date.getDate()
		var e_hour = end_date.getHours()
		var e_minute = end_date.getMinutes();

		var d_year = d.getFullYear()
		var d_month = (d.getMonth() + 1)
		var d_day = d.getDate()
		var d_hour = d.getHours()
		var d_minute = d.getMinutes();

		if ((s_day + "").length < 2) {
			s_day = "0" + s_day;
		}

		if ((e_day + "").length < 2) {
			e_day = "0" + e_day;
		}

		if ((d_day + "").length < 2) {
			d_day = "0" + d_day;
		}

		if ((s_month + "").length < 2) {
			s_month = "0" + s_month;
		}

		if ((e_month + "").length < 2) {
			e_month = "0" + e_month;
		}

		if ((d_month + "").length < 2) {
			d_month = "0" + d_month;
		}

		if ((s_hour + "").length < 2) {
			s_hour = "0" + s_hour;
		}

		if ((e_hour + "").length < 2) {
			e_hour = "0" + e_hour;
		}

		if ((d_hour + "").length < 2) {
			d_hour = "0" + d_hour;
		}

		if ((s_minute + "").length < 2) {
			s_minute = "0" + s_minute;
		}

		if ((e_minute + "").length < 2) {
			e_minute = "0" + e_minute;
		}

		if ((s_minute + "").length < 2) {
			s_minute = "0" + s_minute;
		}

		if ((d_minute + "").length < 2) {
			d_minute = "0" + d_minute;
		}

		var reserv_start = s_year + "-" + s_month + "-" + s_day + " " + s_hour
				+ ":" + s_minute;

		var reserv_end = e_year + "-" + e_month + "-" + e_day + " " + e_hour
				+ ":" + e_minute;

		var current_time = d_year + "-" + d_month + "-" + d_day + " " + d_hour
				+ ":" + d_minute;


		if (reserv_branch == 0) {"src/main/resources/config/mybatis/mapper/reserv.xml"
			alert('지점을 선택해주세요');
			$("#typeOfBranch").focus();
			return;
		}

		if (reserv_room == 0) {
			alert('방을 선택해주세요');
			$("#typeOfRoom").focus();
			return;
		}

		if (reserv_start == current_time) {
			alert('시작 시간을 선택해주세요.')
			return;
		}

		if (reserv_end == current_time) {
			alert('끝나는 시간을 선택해주세요.')
			return;
		}
		
		console.log(reserv_branch)
		console.log(reserv_room)
		console.log(reserv_start)
		console.log(reserv_end)
		console.log(reserv_doc)
		console.log(reserv_state)
		console.log(reserv_member_idx)
		

	$.ajax({
			url : 'check_reserv.do',
			data : {
				'reserv_branch' : reserv_branch,
				'reserv_room' : reserv_room,
				'reserv_start' : reserv_start,
				'reserv_end' : reserv_end,
				'reserv_doc' : reserv_doc,
				'reserv_state' : reserv_state,
				'reserv_member_idx' : reserv_member_idx
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == true) {

					alert("시작시간: " + reserv_start + ", 끝나는 시간: " + reserv_end);
				}
				location.href = "reservation.do"

			},

			error : function(request, status, error) {
				alert(request.responseText);
			}
		}); 


	}

	/* =========================
	 Buttons Dropdown
	 ==========================*/
	$(function() {

		$('#typeOfBranch').on(
				'change',
				function() {

					var branch_name = $('#typeOfBranch').val();

					$.ajax({
						url : 'room_search.do',
						data : {
							'branch_name' : branch_name
						},
						dataType : 'json',
						success : function(res_data) {

							var list = res_data.list;

							// 기존 데이터 지우기
							$('#typeOfRoom option').remove();

							for (var i = 0; i < list.length; i++) {

								$('#typeOfRoom').append(
										'<option value=' +list[i].room_name + '>'
												+ list[i].room_name
												+ '</option>');
							}
						},

						error : function(request, status, error) {
							alert(request.responseText);
						}
					});
				});
	});

	/* =========================
	 Time picker
	 ==========================*/

	$(function() {
		$(".form_datetime_start").datetimepicker({
			format : "yyyy/mm/dd hh:ii",
			todayHighlight : true,
			autoclose : true
		});

	});

	$(function() {
		$(".form_datetime_end").datetimepicker({
			format : "yyyy/mm/dd hh:ii",
			todayHighlight : true,
			autoclose : true
		});

	});

	var d = new Date();
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
								<li><a class="active" href="#">예약하기</a></li>
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
								<li><a class="active" href="#">예약하기</a></li>
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

		<div class="contentbox-about">

			<div class="heading-top text-center">
				<div class="horizontal-heading">
					<h5>#쉽고 빠르게 예약하기</h5>
					<h2>예약 정보를 입력해주세요.</h2>
				</div>
			</div>


			<div class="reserv-page">
				<div class="container">
					<form class="form-horizontal">

						<div class="form-group">
							<label for="inputPassword"
								class="col-md-2 col-xs-6 control-label">지점</label>
							<div class="col-md-10">
								<div class="btn-group">
									<select id="typeOfBranch">
										<option value="0">지점을 선택해주세요.</option>
										<c:forEach var="vo" items="${list}">
											<option value="${vo.branch_name }">${vo.branch_name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword"
								class="col-md-2 col-xs-4 control-label">룸 선택</label>
							<div class="col-md-10">
								<div class="btn-group">
									<select id="typeOfRoom">
										<option value="0">룸을 선택해주세요.</option>
									</select>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword"
								class="col-md-2 col-xs-6 control-label">시작 시간</label>
							<div class="col-md-10 col-xs-10 input-append date">
								<input size="20" type="text" value=""
									class="form_datetime_start form-control" readonly>

							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword"
								class="col-md-2 col-xs-6 control-label">끝나는 시간</label>
							<div class="col-md-10 col-xs-10">
								<input size="20" type="text" value=""
									class="form_datetime_end form-control"
									data-format="yyyy-MM-dd hh:mm:ss" readonly>

							</div>
						</div>


						<div class="form-group">
							<label for="inputPassword"
								class="col-md-2 col-xs-4 control-label">메모</label>
							<div class="col-md-10 col-xs-10">
								<textarea id="memo" class="form-control" rows="5"
									placeholder="Memo"></textarea>
							</div>
						</div>
					</form>

				</div>


			</div>


			<div id="reserv-btn">
				<div class="container">
					<div class="row text-center">
						<div class="col-md-12 col-xs-12">
							<input type="button" class="btn btn-general member" value="예약하기"
								onclick="member_send(${member.member_idx})">

							<div class="col-md-12 col-xs-12">
								<a class="btn btn-general contact" href="#about" role="button">문의하기</a>
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




</body>


</html>