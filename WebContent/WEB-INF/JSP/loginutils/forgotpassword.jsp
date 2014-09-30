<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>forgot password</title>
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
					<a class="navbar-brand" href="#">Forgot Password</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<c:url value="/forgotpassword" var="url" />
		<sf:form action="${url}" method="post"
			commandName="forgotPasswordForm">
			<sf:label path="email">Your email</sf:label>
			<sf:input path="email" />
			<<sf:errors path="email" />
			<input type="submit" value="submit" />
		</sf:form>
	</div>
</body>
</html>
