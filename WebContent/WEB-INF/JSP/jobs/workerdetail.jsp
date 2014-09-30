<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Make Account</title>
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
					<a class="navbar-brand" href="#">Worker details</a>
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

		<div class="jumbotron">
			<h1>${worker.name}</h1>
			<h2>
				<span class="glyphicon glyphicon-envelope"></span>
				${worker.user.email}
			</h2>
			<c:forEach items="${worker.phoneNumbers}" var="phoneNumber">
				<p>
					<span class="glyphicon glyphicon-phone-alt"></span> ${phoneNumber}
				</p>

			</c:forEach>
			<p>
				<span class="glyphicon glyphicon-tag"></span>
				${worker.extraInformation}
			</p>
			<p>
				<span class="glyphicon glyphicon-briefcase"></span>
				<c:forEach items="${worker.jobTypes}" var="jobType">
				${jobType.jobDescription}<br />
				</c:forEach>
				</p>
				 <p><span class="glyphicon glyphicon-globe"></span><br />
								<c:forEach items="${worker.locations}" var="location">
									<span> </span>${location.municipality}, ${location.province}<br />
								</c:forEach>
								</p>
		</div>
	</div>
</body>