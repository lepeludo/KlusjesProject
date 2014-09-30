<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Latest compiled and minified CSS -->
<meta charset="utf-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/dist/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link
	href="${pageContext.servletContext.contextPath}/styles/dist/css/navbar-static-top.css"
	rel="stylesheet">
<script
	src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
<header class="navbar navbar-static-top bs-docs-nav" id="top"
	role="banner">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/checkboxes.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/rating.js"></script>
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">WorkersPoint</a>
		</div>
		<nav class="collapse navbar-collapse bs-navbar-collapse"
			role="navigation">
			<ul class="nav navbar-nav">
				<li><sec:authorize access="isAuthenticated()">
						<a href="<c:url value='/j_spring_security_logout' />"> Logout</a>
					</sec:authorize></li>
				<li><sec:authorize access="isAuthenticated()">
						<a href="<c:url value='/administratormessages' />"> Contact
							administrator</a>
					</sec:authorize></li>
				<li><sec:authorize access="hasRole('customer')">
						<a href="${pageContext.request.contextPath}/customer/">CustomerZone</a>
					</sec:authorize> <sec:authorize access="hasRole('worker')">
						<a href="${pageContext.request.contextPath}/worker/">WorkerZone</a>
					</sec:authorize> <sec:authorize access="hasRole('administrator')">
						<a href="${pageContext.request.contextPath}/administrator/">AdminZone</a>
					</sec:authorize> <sec:authorize access="not isAuthenticated()">
						<a href="${pageContext.request.contextPath}/login">Log in</a>
					</sec:authorize></li>
				<li><a href="${pageContext.servletContext.contextPath}/">Home</a></li>
			</ul>
		</nav>
	</div>
</header>
