<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>e-mail doesn't exist</title>
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
					<a class="navbar-brand" href="#">E-mail doesn't exist</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<h1>We're sorry</h1>
			<p>We did not find that e-mail address in our database</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="${pageContext.servletContext.contextPath}/" role="button">Home
					&raquo;</a>
			</p>
		</div>
	</div>
</body>
</html>
