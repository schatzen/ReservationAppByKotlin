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

<!-- Css link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style-member_insert_form.css">

<!-- Css Responsive link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-login.css">

<script type="text/javascript">
	//JQuery 초기화이벤트

	var regular_id = /^[a-zA-Z0-9]{4,8}$/;

	function check_id() {

		var member_id = $("#input-id-content").val().trim();

		if (regular_id.test(member_id) == false) {
			alert('4자리 이상의 값을 입력하세요.');
			$("#input-id-content").val('');
			$("#input-id-content").focus();
			return;
		}

		//Ajax을 이용해서 중복ID 체크
		$.ajax({
			url : 'check_id.do', //MemberCheckidAction
			data : {
				'member_id' : member_id
			},
			dataType : 'json',
			success : function(res_data) {
				//res_data={"result":true}
				if (res_data.result == false) {
					alert('이미 사용중인 아이디 입니다.');
					return;
				}
				alert('사용가능한 아이디 입니다.');
				//가입버튼 활성화
				$("#btn-sign-in").attr("disabled", false);

				//id항목 읽기전용 
				$("#input-id-content").attr("readonly", true);
			},
			error : function(error) {
				alert('오류발생')
			}
		});
	}

	function send() {

		var member_name = $('#input-name-content').val().trim();
		var member_id = $('#input-id-content').val().trim();
		var member_pwd = $('#input-pwd-content').val().trim();
		var member_tel = $('#input-tel-content').val().trim();

		if (member_name == '') {
			alert('이름을 입력하세요.');
			$('#input-name-content').val('');
			$('#input-name-content').focus();
			return;
		}

		if (member_pwd == '') {
			alert('비밀번호를 입력하세요.');
			$('#input-pwd-content').val('');
			$('#input-pwd-content').focus();
			return;
		}

		if (member_id == '') {
			alert('아이디를 입력하세요.');
			$('#input-id-content').val('');
			$('#input-id-content').focus();
			return;
		}

		if (member_tel == '') {
			alert('연락처를 입력하세요.');
			$('#input-tel-content').val('');
			$('#input-tel-content').focus();
			return;
		}

		$.ajax({
			url : 'member_insert.do',
			data : {
				'member_name' : member_name,
				'member_id' : member_id,
				'member_pwd' : member_pwd,
				'member_tel' : member_tel
			},
			dataType : 'json',
			success : function(res_data) {
				if (res_data.result == false) {
					alert('회원가입에 실패하였습니다.');
					return;
				} else {
					alert('회원가입이 완료되었습니다.');
					location.href = "main.do";
				}

			},
			error : function(request, status, error) {
				alert('오류발생');
			}
		});
	}
</script>
</head>

<body>


	<!-- Header-->
	<header>
		<nav class="navbar navbar-fixed-top">
			<div class="container-fluid">
				<div class="site-nav-wrapper">
					<div class="navbar-header">

						<!-- Mobile Menu open Button -->
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
									<li><a href="${ pageContext.request.contextPath }/member/login_form.do" class="active">로그인</a></li>
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
								<li><a href="login.do">문의하기</a></li>
								<c:if test="${empty member }">
									<li><a href="${ pageContext.request.contextPath }/member/login_form.do" class="active">로그인</a></li>
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

	<div class="grandParentContaniner">
		<div class="parentContainer">
			<form>
				<div id="loginForm">
					<div id="login-title">회원가입</div>
					<div id="fill-the-blank">
						<div class="input-content">
							<input type="text" name="member_name" id="input-name-content"
								placeholder="이름">
						</div>
						<div class="input-content">
							<input type="text" name="member_id" id="input-id-content"
								placeholder="아이디">
						</div>
						<div class="input-content">
							<input type="password" name="member_pwd" id="input-pwd-content"
								placeholder="비밀번호">
						</div>
						<div class="input-content">
							<input type="text" name="member_tel" id="input-tel-content"
								placeholder="전화번호">
						</div>
					</div>
					<div class="validation text-center">

						<div id="sign-in">
							<input type="button" class="btn-general btn-sign"
								id="btn-sign-in" onclick="send()" value="회원가입">
						</div>
						<div id="sign-up">
							<input type="button" class="btn-general btn-sign"
								id="btn-sign-up" onclick="check_id()" value="중복확인">

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!--  JQuery file -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<!--  BootStrap file -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.js"></script>

	<!--  Javascript file -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/common.js"></script>



</body>


</html>