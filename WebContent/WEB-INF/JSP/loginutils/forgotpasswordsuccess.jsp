<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>password changed</title>
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
					<a class="navbar-brand" href="#">Password changed!</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<h1>You're back on track!</h1>
			<p>An email has been send to you</p>
			<p>so check your inbox</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="${pageContext.servletContext.contextPath}/" role="button">Home
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>