<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.servletContext.contextPath}/styles/dist/js/rating.js"></script>

<title>write a review</title>
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
					<a class="navbar-brand" href="#">Write a review</a>
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

		<c:url value="/jobs/reviews" var="succesurl" />
		<sf:form action="${succesurl}" method="post" commandName="reviewForm">
			<label>Give a score </label>
			<input type="number" id="rating" class="rating" name="rating"
				data-clearable="remove" />
			<sf:label path="text">Write Your review:</sf:label>
			<br />
			<sf:textarea cols="60" rows="20" path="text" />
			<sf:errors path="text" />
			<br />
			<sf:hidden path="workerId" value="${worker.id}" />
			<input class="btn btn-primary" type="submit" value="submit" />
		</sf:form>
	</div>
</body>
</html>