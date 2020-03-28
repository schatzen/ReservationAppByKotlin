/* =========================
        Login
==========================*/

function login_form() {

	// 로그인폼으로 이동
	location.href = "login_form.do?";
			/*+ encodeURIComponent(location.href);*/
	return;
}

/*
 * ========================= Logout ==========================
 */

function logout() {

	if (confirm("로그아웃 하시겠습니까?") == false)
		return;

	// 로그아웃 하기
	location.href = "../user/logout.do?url="
			+ encodeURIComponent(location.href);

}

/*
 * ========================= Navigation ==========================
 */

/* Show & Hide White Navogation */
$(function() {

	// Show / hide nav on page load
	showHideNav();

	$(window).scroll(function() {
		showHideNav();

	});

	function showHideNav() {
		if ($(window).scrollTop() > 50) {

			// Show white nav
			$("nav").addClass("white-nav-top");

			// Show dark Logo
			$(".navbar-brand img").attr("src", "img/logo/logo-dark.png")

		} else {

			// Hide white nav
			$("nav").removeClass("white-nav-top");

			// Show logo
			$(".navbar-brand img").attr("src", "img/logo/logo.png")
		}

	}
});

/*
 * ========================= Plus ==========================
 */

$(function() {
	$("#plus-slider").owlCarousel({
		items : 1,
		autoplay : true,
		autoplaySpeed : 3000,
		smartSpeed : 700,
		loop : true,
		autoplayHoverPause : true,
		dots : false
	});

});

/*
 * ========================= Navigation Menu ==========================
 */

$(function() {
	// Show mobile nav
	$("#mobile-nav-open-btn").click(function() {
		$("#mobile-nav").css("height", "100%");
	});

	// Hide mobile nav
	$("#mobile-nav-close-btn, #mobile-nav a").click(function() {
		$("#mobile-nav").css("height", "0%");
	});

});
