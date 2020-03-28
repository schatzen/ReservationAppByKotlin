<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="${ pageContext.request.contextPath }/resources/css/style-administration.css">

<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-administration.css">


<script type="text/javascript" src=""></script>

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
<script type="text/javascript">
	function check_confirmed() {
		var reserv_idx = $("#reserv_idx").val();
		$.ajax({
			url : 'check_confirmed.do',
			data : {
				'reserv_idx' : reserv_idx
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == true) {
					alert('예약이 성공적으로 환인되었습니다.');
					location.href = "administration.do"
					return;
				} else {
					alert('예약 확인 실패')
				}

			},
			error : function(request, status, error) {
				alert(request.responseText);
			}

		})
	}

	function check_canceld() {
		var r_idx = $("#reserv_idx").val();

		$.ajax({
			url : 'check_canceld.do',
			data : {
				'reserv_idx' : reserv_idx
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == true) {
					alert('예약이 성공적으로 취소되었습니다.');
					return;
				}
				alert('예약 취소 실패')

			},
			error : function(request, status, error) {
				alert(request.responseText);
			}

		})

	}

	$(document).ready(function() {

		$("#btn_main").click(function() {
			$("#main_pwd").show();
			$("#first_floor_pwd").hide();
			$("#room_pwd").hide();
		});

		$("#btn_first").click(function() {
			$("#main_pwd").hide();
			$("#first_floor_pwd").show();
			$("#room_pwd").hide();
		});

		$("#btn_room").click(function() {
			$("#main_pwd").hide();
			$("#first_floor_pwd").hide();
			$("#room_pwd").show();
		});

	});

	function main_send(loc) {

		var branch_idx = loc
		var branch_main_pwd = $('#' + branch_idx + '_main_pwd').val()

		alert('비밀번호를 ' + branch_main_pwd + "로 변경하시겠습니까?")

		$.ajax({
			url : 'main_pwd_update.do',
			data : {
				'branch_idx' : branch_idx,
				'branch_main_pwd' : branch_main_pwd
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == false) {
					alert('비밀번호 변경에 실패하였습니다.')
					$('#' + branch_idx + '_main_pwd').val('')
					return;
				}

				alert('비밀번호를 변경하였습니다.');
				$('#' + branch_idx + '_main_pwd').val('')
				location.href = "administration.do"

			},
			error : function(request, status, error) {
				alert(request.responseText);
			}

		})

	}

	function floor_send(loc) {

		var branch_idx = loc
		var branch_1_floor_pwd = $('#' + branch_idx + '_floor_pwd').val()

		alert('비밀번호를 ' + branch_1_floor_pwd + "로 변경하시겠습니까?")

		$.ajax({
			url : 'floor_pwd_update.do',
			data : {
				'branch_idx' : branch_idx,
				'branch_1_floor_pwd' : branch_1_floor_pwd
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == false) {
					alert('비밀번호 변경에 실패하였습니다.')
					$('#' + branch_idx + '_floor_pwd').val('')

					return;
				}

				alert('비밀번호를 변경하였습니다.');
				$('#' + branch_idx + '_floor_pwd').val('')
				location.href = "administration.do"

			},
			error : function(request, status, error) {
				alert(request.responseText);
			}

		})

	}

	function room_send(loc) {

		var room_idx = loc
		var room_pwd = $('#' + room_idx + '_room_pwd').val()

		alert('비밀번호를 ' + room_pwd + "로 변경하시겠습니까?")

		$.ajax({
			url : 'room_pwd_update.do',
			data : {
				'room_idx' : room_idx,
				'room_pwd' : room_pwd
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == false) {
					alert('비밀번호 변경에 실패하였습니다.')
					$('#' + room_idx + '_room_pwd').val('')

					return;
				}

				alert('비밀번호를 변경하였습니다.');
				$('#' + room_idx + '_room_pwd').val('')
				location.href = "administration.do"

			},
			error : function(request, status, error) {
				alert(request.responseText);
			}

		})

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
									<li><a
										href="${ pageContext.request.contextPath }/member/login_form.do">로그인</a></li>
								</c:if>
								<c:if test="${not empty member }">
									<li><a href="myPage.do">마이페이지</a></li>
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
									<li><a
										href="${ pageContext.request.contextPath }/member/login_form.do">로그인</a></li>
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
					<h2>예약현황</h2>
				</div>
			</div>

			<div class="my-page">
				<div class="container">
					<div class="row">
						<div class="my-page-inner text-center">
							<div class="col-md-3">
								<a href="#sectionA" data-toggle="tab" id="tab-first">
									<div class="my-page-top top-left">
										<i class="far fa-calendar"></i>
										<p>새로 들어온 예약</p>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<a href="#sectionB" data-toggle="tab">
									<div class="my-page-top top-middle">
										<i class="far fa-calendar-check"></i>
										<p>처리된 예약</p>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<a href="#sectionC" data-toggle="tab">
									<div class="my-page-top top-middle">
										<i class="fas fa-lock"></i>
										<p>지점 비밀번호 변경</p>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<a href="#sectionD" data-toggle="tab">
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
								<div class="col-md-1 text-center">
									<h4>예약번호</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>아이디</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>지점</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>방</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>시작 시간</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>끝나는 시간</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>예약날짜</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>확인</h4>
								</div>
							</div>


							<div class="row" id="reservation_list">
								<c:forEach var="vo" items="${map.not_confirmed_list}">
									<input type="hidden" id="reserv_idx" value="${vo.reserv_idx }">
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_idx }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_member_idx }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_branch }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_room }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_start }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_end }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_regdate }</h5>
									</div>
									<div class="col-md-2 text-center">
										<div id="check_icon">
											<a href="javascript:void(0)" onclick="check_confirmed()"><i
												class="far fa-check-circle"></i></a> <a
												href="javascript:void(0)" onclick="check_canceld()"><i
												class="far fa-times-circle"></i></a>
										</div>
									</div>
								</c:forEach>
							</div>

						</div>


						<div id="sectionB" class="my-page-inner tab-pane fade text-left">
							<div class="row">
								<div class="col-md-1 text-center">
									<h4>예약번호</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>아이디</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>지점</h4>
								</div>
								<div class="col-md-1 text-center">
									<h4>방</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>시작 시간</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>끝나는 시간</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>예약날짜</h4>
								</div>
								<div class="col-md-2 text-center">
									<h4>상태</h4>
								</div>
							</div>

							<c:forEach var="vo" items="${map.confirmed_list}">
								<div class="row" id="reservation_list">
									<input type="hidden" id="reserv_idx" value="${vo.reserv_idx }">
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_idx }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_member_idx }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_branch }</h5>
									</div>
									<div class="col-md-1 text-center">
										<h5>${vo.reserv_room }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_start }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_end }</h5>
									</div>
									<div class="col-md-2 text-center">
										<h5>${vo.reserv_regdate}</h5>
									</div>
									<div class="col-md-2 text-center">
										<div id="check_icon">
											<c:if test="${vo.reserv_state eq 'confirmed'}">
												<i class="far fa-check-circle"></i>
											</c:if>
											<c:if test="${vo.reserv_state eq 'canceld'}">
												<i class="far fa-times-circle"></i>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div id="sectionC" class="my-page-inner tab-pane fade text-left">

							<!-- 비밀번호 체크박스 -->
							<input class="btn btn-default" id="btn_main" type="button"
								value="정문 비밀번호"> <input class="btn btn-default"
								id="btn_first" type="button" value="1층 비밀번호"> <input
								class="btn btn-default" id="btn_room" type="button"
								value="방 비밀번호">


							<!-- 정문 비밀번호 -->
							<div id="main_pwd">
								<table class="table table-striped">
									<th>지점</th>
									<th>현재 정문 비밀번호</th>
									<th>바꿀 정문 비밀번호</th>
									<th>변경</th>
									<tr>
										<c:forEach var="vo" items="${map.main_pwd_list }">
											<td>${vo.branch_name }</td>
											<td>${vo.branch_main_pwd }</td>
											<td><input type="text" id="${vo.branch_idx }_main_pwd"></td>
											<td><input type="button" value="변경"
												onclick="main_send(${vo.branch_idx })"></td>
											<tr>
										</c:forEach>
								</table>
							</div>

							<!-- 1충 비밀번호  -->
							<div id="first_floor_pwd" style="display: none">
								<table class="table table-striped">
									<th>지점</th>
									<th>현재 1층 비밀번호</th>
									<th>바꿀 1층 비밀번호</th>
									<th>변경</th>
									<tr>
										<c:forEach var="vo" items="${map.first_floor_pwd_list }">
											<td>${vo.branch_name }</td>
											<td>${vo.branch_1_floor_pwd }</td>
											<td><input type="text" id="${vo.branch_idx }_floor_pwd"></td>
											<td><input type="button" value="변경"
												onclick="floor_send(${vo.branch_idx})"></td>
											<tr>
										</c:forEach>
								</table>
							</div>


							<!--방 비밀번호  -->
							<div id="room_pwd" style="display: none">
								<table class="table table-striped">
									<th>지점</th>
									<th>방</th>
									<th>현재 방 비밀번호</th>
									<th>바꿀 방 비밀번호</th>
									<th>변경</th>
									<tr>
										<c:forEach var="vo" items="${map.room_pwd_list }">
											<td>${vo.room_branch }</td>
											<td>${vo.room_name }</td>
											<td>${vo.room_pwd }</td>
											<td><input type="text" id="${vo.room_idx}_room_pwd"></td>
											<td><input type="button" value="변경"
												onclick="room_send(${vo.room_idx})"></td>
											<tr>
										</c:forEach>
								</table>
							</div>

						</div>

						<div id="sectionD" class="my-page-inner tab-pane fade text-left">
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
</body>


</html>