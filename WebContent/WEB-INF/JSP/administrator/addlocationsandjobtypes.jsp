<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<title>add locations and jobtypes</title>
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
					<a class="navbar-brand" href="#">Add locations and jobtypes</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<c:url value="/administrator/addlocationsandjobtypes" var="url" />
		<div class="container">
			<h2>locations</h2>
			<c:forEach items="${allProvinces}" var='province'>
				<div class="row">
					<div class="span2">
						<h3>${province}</h3>
					</div>
					<div id="${province}" class="span10">
						<c:forEach items="${locations}" var='location'>
							<c:if test="${location.province eq province}">
								<div class="col-md-2">${location.municipality}</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="container">
			<h2>jobtypes</h2>
			<h4>click jobtype to update name</h4>
			<ul class="list-group row">
				<c:forEach items="${jobTypes}" var="jobType">
					<li class="list-group-item col-xs-4"><div class="clickable"
							id="${pageContext.servletContext.contextPath}/administrator/updatejobtypes?id=${jobType.id}">${jobType.jobDescription}</div></li>
				</c:forEach>

			</ul>
		</div>
		<div class="container">
			<sf:form action="${url}" method="post"
				commandName="locationJobTypeForm">
				<sf:label path="jobType">add a jobtype</sf:label>
				<sf:input class="form-control" path="jobType" />
				<sf:errors path="jobType"></sf:errors>
				<button type="submit" name="jobType" class="btn btn-primary">add
					jobtype</button>
			</sf:form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/checkboxes.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/clickablediv.js"></script>
</body>
</html>