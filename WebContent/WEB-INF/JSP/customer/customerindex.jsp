<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>customerzone</title>
</head>
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
					<a class="navbar-brand" href="#">CustomerZone</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/jobs/search"><span
								class="glyphicon glyphicon-chevron-right"></span> Lookup a
								worker</a></li>
						<li><a
							href="${pageContext.request.contextPath}/customer/profile"><span
								class="glyphicon glyphicon-chevron-right"></span> My Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath}/customer/reviews"><span
								class="glyphicon glyphicon-chevron-right"></span> My Reviews</a></li>
						<li><a
							href="${pageContext.request.contextPath}/messages/customerthreads"><span
								class="glyphicon glyphicon-chevron-right"></span> My
								Messages(${unreadMessages})</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<div class="container" id="cont">
		<div class="row">
			<h1 class="col-md-10 col-md-offset-2">Welcome to the
				CustomerZone</h1>
			<h2 class="col-md-9 col-md-offset-3">Find the worker suiting
				your needs</h2>
		</div>
		<p />
		<div class="row">
			<p />
			<br />
			<div class="col-md-5 text-justify">
				<div class="row">From the top menu you can look up a
					professional by name or speciality and location. You can leave a
					message or get her or his contact information.</div>
				<div class="row">You can also inspect and update your own
					profile and look at reviews you've written about professionals
					you've been in contact with.</div>
				<div class="row">Easy, isn't it?</div>
			</div>
			<div class="col-md-5 col-md-offset-2">
				<img
					src="${pageContext.servletContext.contextPath}/images/picture3.jpg"
					class="img-responsive" alt="picture3">
			</div>
		</div>
	</div>
</body>
</html>