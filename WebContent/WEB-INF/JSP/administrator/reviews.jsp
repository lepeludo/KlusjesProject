<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>reviews</title>
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
					<a class="navbar-brand" href="#">reviews</a>
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
		<div class="row">
			<h1 class="col-md-10 col-md-offset-2">Reviews marked for
				deletions</h1>
			<h2 class="col-md-9 col-md-offset-3">Reviews marked by workers</h2>
		</div>
		<div class="row">
			<div class="jumbotron">
				<c:url value="reviews" var="url" />
				<form action="${url}" method="POST">
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
								<h5>by ${review.customer.firstName}
									${review.customer.lastName}</h5>
								<h5>
									<input type="checkbox" name="deletes" value="${review.id}">Delete
									review
								</h5>
								<h5>
									<input type="checkbox" name="readByAdmins" value="${review.id}">Do
									not delete and ignore review
								</h5>
							</div>
							<div class="col-md-8 col-md-offset-1">
								<br /> <br />${review.text}</div>
						</div>
					</c:forEach>
					<input type="submit" class="btn btn-dangervalue"
						value="Accept changes">
				</form>
			</div>
		</div>
	</div>
</body>
</html>