<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/styles/dist/css/simple-sidebar.css">

<!-- Custom CSS: start under menubar -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/styles/dist/css/bootstrap.min.css">
<script
	src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/styles/dist/js/rating.js"></script>

<title>messages</title>
</head>

<body>
	<jsp:include page="/WEB-INF/JSP/menu.jsp" />
	<div class="container">
		<div class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Messages</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<c:url value="/messages/continuethreads" var="url" />
		<form action="${url}" method="post">
			<c:forEach items="${messageThreads}" var="messageThread">
				<div class="col-md-6">
					<div class="well">
						<h2>${messageThread.subject}</h2>
						<p class="text-left text-muted">
							<small>by: ${messageThread.customer.firstName}
								${messageThread.customer.lastName} </small>
						<p>
							<button type="submit" name="messageThreadId"
								class="btn btn-primary btn-lg" value="${messageThread.id}">view</button>
							<sec:authorize access="hasRole('customer')">
								<c:set var="contains" value='0' />
								<c:forEach items="${messageThread.messages}" var="message">
									<c:if test="${not message.readBool && message.workerBool}">
										<c:set var="contains" value="${contains+1}" />
									</c:if>
								</c:forEach>
								<p class="text-right text-warning">${contains}unread
									messages</p>
							</sec:authorize>
							<sec:authorize access="hasRole('worker')">
								<c:set var="contains" value='0' />
								<c:forEach items="${messageThread.messages}" var="message">
									<c:if test="${not message.readBool && not message.workerBool}">
										<c:set var="contains" value="${contains+1}" />
									</c:if>
								</c:forEach>
								<p class="text-right text-warning">${contains}unread
									messages</p>
							</sec:authorize>
					</div>
				</div>
			</c:forEach>
		</form>
		<c:if test="${not empty workerId}">
			<sec:authorize access="hasRole('customer')">
				<c:url value="/messages/startthread" var="startthreadurl" />
				<form action="${startthreadurl}" method="get">
					<button type="submit" class="btn btn-warning" name="workerId"
						value="${workerId}">New subject</button>
				</form>
			</sec:authorize>
		</c:if>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
</body>
</html>