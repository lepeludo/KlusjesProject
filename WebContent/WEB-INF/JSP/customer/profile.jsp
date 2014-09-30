<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<li><a href="${pageContext.request.contextPath}/jobs/search"><span
								class="glyphicon glyphicon-chevron-right"></span> Lookup a
								worker</a></li>
						<li><a
							href="${pageContext.request.contextPath}/customer/profile"><span
								class="glyphicon glyphicon-chevron-right"></span> My Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath}/customer/reviews"><span
								class="glyphicon glyphicon-chevron-right"></span> My Reviews</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<img
								src="http://placehold.it/380x500/55C1E7/fff&text=${customer.firstName}"
								alt="profile" class="img-rounded img-responsive" />
						</div>
						<div class="col-sm-6 col-md-8">
							<h4>${customer.firstName}${customer.lastName}</h4>
							<small><cite title="WorkersPoint Customer">WorkersPoint
									Customer</cite></small>
							<p>
								<i class="glyphicon glyphicon-envelope"></i>${customer.user.email}
								<br /> <i class="glyphicon glyphicon-thumbs-up"></i>Reviews
								posted: ${customer.numberOfReviewsPosted} <br /> <i
									class="glyphicon glyphicon-gift"></i>Date joined:
								${customer.dateAccount}
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
										href="${pageContext.servletContext.contextPath}/customer/update">Update
											Your profile</a></li>
									<li><a
										href="${pageContext.servletContext.contextPath}/changepassword">Change
											password</a></li>
									<li><a
										href="${pageContext.servletContext.contextPath}/startdeactivation">Deactivate account</a></li>
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>