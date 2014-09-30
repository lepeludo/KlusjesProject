<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>workerzone</title>
<body>
	<jsp:include page="/WEB-INF/JSP/menu.jsp" />
	<div class="container">
		<!-- Static navbar -->
		<div class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">WorkerZone</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a
							href="${pageContext.request.contextPath}/messages/workerthreads">My
								Messages(${unreadMessages})</a></li>
						<li><a
							href="${pageContext.request.contextPath}/worker/profile">My
								Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath}/worker/reviews">My
								Reviews</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<h1 class="col-md-10 col-md-offset-2">Welcome to the WorkerZone</h1>
			<h2 class="col-md-9 col-md-offset-3">Your connection you to a
				happy customer</h2>
		</div>
		<p />
		<div class="row">
			<p />
			<br />
			<div class="col-md-5 text-justify">
				<div class="row">From the top menu you can choose to read the
					messages customers have sent you. We advise you to check often so
					you don't miss any interesting offers!</div>
				<div class="row">You can also inspect and update your own
					profile and look at reviews people have written about you. If you
					find any of these messages offensive, you can alert an
					administrator and ask to have them removed.</div>
				<div class="row">Easy, isn't it?</div>
			</div>
			<div class="col-md-5 col-md-offset-2">
				<img
					src="${pageContext.servletContext.contextPath}/images/picture4.jpg"
					class="img-responsive" alt="picture4">

			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
</body>
</html>