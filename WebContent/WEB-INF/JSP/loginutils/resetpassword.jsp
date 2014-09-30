<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>change password</title>
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
					<a class="navbar-brand" href="#">Change Password</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<c:url value="/resetpassword" var="url">
			<c:param name="confirm" value="${confirm}"></c:param>
			<c:param name="username" value="${username}"></c:param>
		</c:url>
		<sf:form action="${url}" method="post"
			commandName="changePasswordForm">
			<sf:label path="password">New password:</sf:label>
			<sf:input type="password" path="password" />
			<sf:errors path="password" />
			<br />
			<input type="submit" value="submit" />
		</sf:form>
	</div>
</body>
</html>