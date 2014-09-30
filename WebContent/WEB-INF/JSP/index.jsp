<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Index page</title>
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
					<a class="navbar-brand" href="#">Home</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<sec:authorize access="not isAuthenticated()">
							<li><a
								href="${pageContext.request.contextPath}/customer/create"><span
									class="glyphicon glyphicon-chevron-right"></span> I'm a new
									customer</a></li>
							<li><a
								href="${pageContext.request.contextPath}/worker/create"><span
									class="glyphicon glyphicon-chevron-right"></span> I'm a new
									worker</a></li>
						</sec:authorize>
						<li><sec:authorize access="hasRole('customer')">
								<a href="${pageContext.request.contextPath}/customer/">CustomerZone</a>
							</sec:authorize> <sec:authorize access="hasRole('worker')">
								<a href="${pageContext.request.contextPath}/worker/">WorkerZone</a>
							</sec:authorize> <sec:authorize access="hasRole('admin')">
								<a href="${pageContext.request.contextPath}/admin/">AdminZone</a>
							</sec:authorize></li>
						<li><sec:authorize access="hasRole('worker')">
								<a
									href="${pageContext.request.contextPath}/messages/workerthreads">
									<c:if test="${sessionScope.unreadMessages>0}">${sessionScope.unreadMessages} messages</c:if>
								</a>
							</sec:authorize> <sec:authorize access="hasRole('customer')">
								<a
									href="${pageContext.request.contextPath}/messages/customerthreads">
									<c:if test="${sessionScope.unreadMessages>0}">${sessionScope.unreadMessages} messages</c:if>
								</a>
							</sec:authorize></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<div class="container" id="cont">
		<div class="row">
			<h1 class="col-md-10 col-md-offset-2">Welcome to WorkersPoint</h1>
			<h2 class="col-md-9 col-md-offset-3">Finding home services made
				easy...</h2>
		</div>
		<p />
		<div class="row">
			<p />
			<br />
			<div class="col-md-5 text-justify">
				Easy to register, easy to find the right people for the right job,
				WorkersPoint is the premier tool for bringing customers and domestic
				helpers together.
				<h4>Make your own account and start searching.</h4>
				<h3>It's free ;-)</h3><br/>
				<h4><strong>Disclaimer</strong><br/>This is a demonstration website. Not intended to solicit business.</h4>
			</div>		
			<div class="col-md-2 col-md-offset-2">
				<img
					src="${pageContext.servletContext.contextPath}/images/picture1.jpg"
					class="img-responsive" alt="picture1"> <img
					src="${pageContext.servletContext.contextPath}/images/picture2.jpg"
					class="img-responsive" alt="picture2">
			</div>
		</div>
	</div>
</body>
</html>