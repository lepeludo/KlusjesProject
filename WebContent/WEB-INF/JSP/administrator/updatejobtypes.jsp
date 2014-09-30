<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>update jobtype</title>
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
					<a class="navbar-brand" href="#">Update jobtype</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</div>
	</div>
	<div class="container">
		<h1>Update the jobtype's name</h1>
		<h4>Warning: this will change the name of the jobtype for all
			users, future and past</h4>
		<p />
		<h5>current name:</h5>
		<h5>${jobType.jobDescription}</h5>
		<c:url value="/administrator/updatejobtypes" var="url">
			<c:param name="id">${jobType.id}</c:param>
		</c:url>
		<sf:form action="${url}" method="POST"
			commandName="locationJobTypeForm">
			<sf:input path="jobType" />
			<sf:errors path="jobType" />
			<button type="submit" class="button btn-warning">Update name</button>
		</sf:form>
	</div>
</body>
</html>