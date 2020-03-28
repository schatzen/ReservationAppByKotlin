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
	href="${ pageContext.request.contextPath }/resources/css/style-login_form.css">

<!-- Css Responsive link-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/reponsive-login.css">


<script type="text/javascript">


	//현재html이 로드가 완료되면
	window.onload = function(){
		setTimeout(init, 100) 
	};

	function init() {
		// login_form.do?reason=fail_id
		if("${param.reason eq 'fail_id'}"=="true"){
			alert('아이디가 틀립니다');	
		}
		// login_form.do?reason=fail_pwd
		if("${param.reason eq 'fail_pwd'}"=="true"){
			alert('비밀번호가 틀립니다');	
		}
	}
	
	function send(f) {
		
		var member_id = $("#input-id-content").val().trim();
		var member_pwd = $("#input-pwd-content").val().trim();
		
		if(member_id==''){
			alert('아이디를 입력하세요');
			$("#input-id-content").val('');
			$("#input-id-content").focus();
			return;
		}
		
		if(member_pwd==''){
			alert('비밀번호를 입력하세요');
			$("#input-pwd-content").val('');
			$("#input-pwd-content").focus();
			return;
		}

		f.submit();
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

<!-- Login Body -->
   <div class="grandParentContaniner">
        <div class="parentContainer">
            <form action="login.do">
                <div id="loginForm">
                    <div id="login-title">
                        Login to your account
                    </div>
                    <div id="input-login">
                        <div id="input-id">
                            <i class="fas fa-user-alt"></i>
                            <input type="text" name="member_id" id="input-id-content" placeholder="Username">
                        </div>
                        <div id="input-pwd">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="member_pwd" id="input-pwd-content" placeholder="Password">
                        </div>
                    </div>
                    <div id="forgot_password" class="text-right">
                            <a href="#">아이디 / 비밀번호를 잊으셨습니까?</a>
                        </div>
                    <div class="validation text-center">
                        
                        <div id="sign-in">
                        <input type="button" class="btn-general btn-sign"  id="btn-sign-in" onclick="send(this.form); return false;" value="로그인">
                           <!--  <a class="btn-general btn-sign" href="javascript:void()" id="btn-sign-in" onclick="send(this.form); return false;">로그인</a> -->
                        </div>
                        <div id="sign-up">
                         <input type="button" class="btn-general btn-sign"  id="btn-sign-up" onclick="location.href='member_insert_form.do'" value="회원가입">
                          <!--   <a class="btn-general btn-sign" href="member_insert_form.do" id="btn-sign-up">회원가입</a> -->
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
					<%-- <div id="kakao-login-api">
						<c:if test="${userId eq null}">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=f954226ba7cc55a7d5f6e20bce3547b7&redirect_uri=http://localhost:8080/reserv/reserv/kakao&response_type=code">
								<img
								src="${ pageContext.request.contextPath }/resources/img/kakao/kakao_login.png">
							</a>
						</c:if>
						<c:if test="${userId ne null}">
							<h1>로그인 성공입니다</h1>
						</c:if>
					</div> --%>

	
	<!-- Login Body End -->


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