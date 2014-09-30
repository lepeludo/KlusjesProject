<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>reviews</title>
</head>
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
				<a class="navbar-brand" href="#">My Reviews</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/customer/profile"><span
							class="glyphicon glyphicon-chevron-right"></span> My Profile</a></li>
				</ul>
			</div>

		</div>

	</div>
</div>
<!-- start message -->
<div class="container">
	<div class="row">
		<h1 class="col-md-10 col-md-offset-2">Welcome to the reviews</h1>
		<h2 class="col-md-9 col-md-offset-3">What you wrote about the
			professionals you worked with</h2>
	</div>
	<div class="row">
		<div class="jumbotron">
			<c:forEach items="${reviews}" var="review" varStatus="counter">
				<div class="row">
					<div class="col-md-3 text-justify">
						<h3 class="text-center">Review ${counter.count}</h3>
						<h5>
							<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
								value="${review.date}" />
						</h5>
						<h5>about ${review.worker.firstName}
							${review.worker.lastName}</h5>
					</div>
					<div class="col-md-8 col-md-offset-1">
						<br /> <br />${review.text}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- end message -->
</body>
</html>