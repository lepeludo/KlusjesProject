<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>adminzone</title>
</head>
<body>
	<jsp:include page="/WEB-INF/JSP/menu.jsp" />
	<div class="container">
		<!-- Static navbar -->
		<div class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">AdministratorZone</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a
							href="${pageContext.request.contextPath}/administrator/create">Add
								an administrator</a></li>
						<li><a
							href="${pageContext.request.contextPath}/administrator/searchcustomers">Customer
								search</a></li>
						<li><a
							href="${pageContext.request.contextPath}/administrator/searchworkerslocationtype">Worker
								search</a></li>
						<li><a
							href="${pageContext.request.contextPath}/administrator/reviews">Read
								reported reviews</a></li>
								<li><a
							href="${pageContext.request.contextPath}/administratormessages/administrator">Read your messages</a></li>
						<li><a
							href="${pageContext.request.contextPath}/administrator/addlocationsandjobtypes">Add
								locations and jobtypes</a></li>
								<li><a
							href="${pageContext.request.contextPath}/administrator/visitors">Show visitors</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
</body>
</html>