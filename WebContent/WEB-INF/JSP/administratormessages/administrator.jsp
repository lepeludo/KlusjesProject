<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>message to administrator</title>
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
					<a class="navbar-brand" href="#">Message to administrator</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h1 class="col-md-10 col-md-offset-2">Welcome to your messages</h1>
		</div>
		<div class="row">
			<div class="jumbotron">
				<c:forEach items="${messages}" var="message" varStatus="counter">
					<div class="row">
						<div class="col-md-3 text-justify">
							<h3 class="text-center">Message ${counter.count}</h3>
							<h3>${message.subject}</h3>
							<h5>
								<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
									value="${message.date}" />
							</h5>
							<h5>by ${message.user.username}</h5>
							<h5>
								<a
									href="${pageContext.request.contextPath}/administrator/email/?email=${message.user.email}">Send
									E-mail</a>
							</h5>
						</div>
						<div class="col-md-8 col-md-offset-1">
							<br /> <br />${message.text}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
</body>
</html>