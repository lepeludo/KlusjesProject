<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>my profile</title>
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
					<a class="navbar-brand" href="#">My profile</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a
							href="${pageContext.request.contextPath}/worker/reviews"><span
								class="glyphicon glyphicon-chevron-right"></span> My Profile</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<!-- start -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<img
								src="http://placehold.it/380x500/55C1E7/fff&text=${worker.firstName}"
								alt="profile" class="img-rounded img-responsive" />
						</div>
						<div class="col-sm-6 col-md-8">
							<h4>${worker.firstName}${worker.lastName}</h4>
							<small><cite title="WorkersPoint Customer">WorkersPoint
									Professional</cite></small>
							<p>
								<i class="glyphicon glyphicon-envelope"></i>${worker.user.email}
								<br /> <i class="glyphicon glyphicon-thumbs-up"></i>
								<c:if test="${worker.currentReviewStars>=0}">
									<c:forEach begin='1' end="${worker.currentReviewStars}"
										varStatus="counter">
										<span>&#9733</span>
									</c:forEach>
									<c:forEach begin='${worker.currentReviewStars}' end="4"
										varStatus="counter">
										<span>&#9734</span>
									</c:forEach>
								</c:if>
								<c:if test="${worker.currentReviewStars<0}">None ratings so far
													</c:if>
								<br /> <i class="glyphicon glyphicon-gift"></i>Date joined:
								${worker.dateAccount}<br /> <i
									class="glyphicon glyphicon-globe"></i><br />
								<c:forEach items="${worker.locations}" var="location">
									<span> </span>${location.municipality}, ${location.province}<br />
								</c:forEach>
								<i class="glyphicon glyphicon-briefcase"></i><br />
								<c:forEach items="${worker.jobTypes}" var="jobType">
				${jobType.jobDescription}<br />
								</c:forEach>
								<i class="glyphicon glyphicon-phone"><c:forEach
										items="${worker.phoneNumbers}" var="phoneNumber">
				${phoneNumber}<br />
									</c:forEach></i>
							</p>
							<!-- Split button -->
							<div class="btn-group">
								<button type="button" class="btn btn-primary">Options</button>
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">
									<span class="caret"></span><span class="sr-only">Social</span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="${pageContext.servletContext.contextPath}/worker/update">Update
											Your profile</a></li>
									<li><a
										href="${pageContext.servletContext.contextPath}/changepassword">Change
											password</a></li>

									<li><a
										href="${pageContext.servletContext.contextPath}/startdeactivation">Deactivate
											account</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
</body>
</html>