<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>change profile</title>
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
					<a class="navbar-brand" href="#">Change Profile</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<c:url value="doupdate" var="updateurl" />
		<sf:form action="${updateurl}" method="post"
			commandName="updateCustomerForm">
			<sf:label path="firstName">first name:</sf:label>
			<br />
			<sf:input type="text" path="firstName" />
			<sf:errors path="firstName" />
			<br />
			<sf:label path="lastName">last name:</sf:label>
			<br />
			<sf:input type="text" path="lastName" />
			<sf:errors path="lastName" />
			<br />
			<sf:label path="email">E-Mail:</sf:label>
			<br />
			<sf:input type="text" path="email" />
			<sf:errors path="email" />
			<br />
			<input type="submit" class="btn btn-primary" value="submit" />
		</sf:form>
	</div>
</body>
</html>