<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/guest/guest.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="resources/img/favicon.ico">
<link href="resources/css/fontawesome.min.css" rel="stylesheet">
<script type="text/javascript">
 $(window).on('load', function () {
      $("#load").hide();
 });
</script>
<style type="text/css">
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 1;/* 투명도 */
	background: white;
	z-index: 99;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
	z-index: 100;
}

.nav-hoho{
	box-shadow:5px 5px 20px 0px rgba(0,0,0,0.1);
}
.nav-imma{
	margin-left: 100px;
	
}
.nav-item{
	padding: 8px 15px;
}
.search_f {
	width:480px!important;
	border-radius: 24px;
    border: 1px solid #f6f6f6;
    background-color: #ffffff;
    color: #333;
    box-shadow:5px 5px 20px 0px rgba(0,0,0,0.1);
}
.spacingNavGuest{
	padding: 1rem;
}

</style>

<div id="load">
<!--  아래 줄에 상대경로 또는 절대경로로 로딩 이미지 경로를 적어준다.
 예를 들면 http://xxxx.xx.xx/img/loading.gif로 기록한다. -->
	<img src="resources/img/loading45.gif"  alt="loading">
</div>
	<!-- Example Code -->
</head>
<script src="https://kit.fontawesome.com/37537966ae.js" crossorigin="anonymous"></script>
<body class="p-3 m-0 border-0 bd-example">
<div class="spacingNavGuest">
	
</div>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white">
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light nav-hoho">
		<a class="navbar-brand" href="guest_main.do" style="font-size:30px;"><i class="fa-solid fa-rocket"></i>  Space Platform</a>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll nav-imma" style="max-height: 100px">
	
				<li class="nav-item">
					<a class="nav-link" href="guest_main.do">게스트홈</a> 
				</li>
				<li class="nav-item">
					<a class="nav-link" href="guest_my_info.do">마이페이지</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="host_home.do">호스트홈</a>
				</li>
				
				<li class="nav-item">
				<form class="d-flex" action="search.do?sc=q" role="search" method="POST">
					<c:if test="${empty search}">
						<c:set var="q" value="검색">
						</c:set>
					</c:if>
					<c:if test="${not empty search}">
						<c:set var="q" value="${search}">
						</c:set>
					</c:if>
					<button class="btn" type="submit"><i class="fa-solid fa-search" style="color:#7C7C7D;"></i></button>
					<input class="form-control me-2 search_f" name="searchString" type="search"
						placeholder="${q}" aria-label="Search">
				</form>
				</li>
			</ul>

			<c:if test="${not empty memberdto}">
				<a class="btn btn-outline-dark" href="guest_logout.do" style="color:#7C7C7D;">logout</a>
			</c:if>
			<c:if test="${empty memberdto}">
				<a class="btn btn-outline-dark" href="guestLogin.do">login</a>
			</c:if>
		</div>
	</nav>
</div>



</body>
</html>