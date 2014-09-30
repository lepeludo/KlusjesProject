<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
					<a class="navbar-brand" href="#">Password Changed!</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<h1>Your password has been changed!</h1>
			<p>Next time you login, you should use your new password</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="${pageContext.servletContext.contextPath}/" role="button">Home
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>
