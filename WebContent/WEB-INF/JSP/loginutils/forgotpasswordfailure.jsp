<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>link expired</title>
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
					<a class="navbar-brand" href="#">Link expired</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<h1>We're sorry</h1>
			<p>The time you had to reset your password through that link has
				expired</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="${pageContext.servletContext.contextPath}/" role="button">Home
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>