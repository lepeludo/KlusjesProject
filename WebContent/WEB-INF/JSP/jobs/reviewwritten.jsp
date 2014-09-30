<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>review written</title>
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
					<a class="navbar-brand" href="#">Review written</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<h1>Your have written a review</h1>
			<h2>
				<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
					value="${review.date}" />
			</h2>
			<p>${review.text}</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="${pageContext.servletContext.contextPath}/" role="button">Home
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>