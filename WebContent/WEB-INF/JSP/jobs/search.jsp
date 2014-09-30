<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>search a worker</title>
</head>
<body>
	<script type="text/javascript">
	<!--
		function toggle_visibility(id) {
			var e = document.getElementById(id);
			if (e.style.display == 'block')
				e.style.display = 'none';
			else
				e.style.display = 'block';
		}
	//-->
	</script>
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
					<a class="navbar-brand" href="#">Search a worker</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<h2>Find a worker by name</h2>
		<h4>Leave the field empty to display ALL workers</h4>
		<c:url value="/jobs/dosearch" var="url" />
		<form action="${url}" method="post">
			<p>
				<input type="text" name="keyword">
			</p>
			<p>
				<input type="submit" value="search by name" class="btn btn-primary" />
			</p>

		</form>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3 .col-md-offset-3">
				<h1 class="col-md-6 .col-md-offset-6">or</h1>
			</div>
		</div>
	</div>
	<div class="container">

		<h2>Find a worker by location and jobtype</h2>
		<h4>Check the municipality you need help in and the type of help
			you need</h4>

		<sf:form action="${url}" method="post" commandName="workersForm">
			<div class="row">
				<h3>Select the jobtypes you want to see completed</h3>
				<sf:errors path="jobTypes" id="inputError1" />
				<c:forEach items="${jobTypes}" var='jobtype'>
					<div class="col-md-3">
						<span class="button-checkbox">
							<button type="button" class="btn btn-block text-left"
								data-color="primary">
								<sf:label path="jobTypes"> ${jobtype.jobDescription}</sf:label>
							</button> <sf:checkbox path="jobTypes" value="${jobtype.id}"
								class="hidden" />
						</span>
					</div>
				</c:forEach>
			</div>
			<p />
			<div class="row">
				<h3>Select the communities you need help in</h3>
			</div>
			<div class="row">
				<div class="col-md-2 text-justify">
					<div class="btn-group-vertical">
						<c:forEach items="${allProvinces}" var='province'>
							<span class="button-checkbox">
								<button type="button" class="btn btn-block" data-color="warning"
									onclick="toggle_visibility('${province}')">${province}</button>
								<br /> <input type="checkbox" value="${province}"
								class="hidden" />
							</span>
						</c:forEach>
						<br /><input type="submit" value="search by location and jobtype"
					class="btn btn-primary" name="locationtype" />
					</div>
				</div>
				<div class="col-md-9 col-md-offset-1">
					<c:forEach items="${allProvinces}" var='province'>
						<div id="${province}" style='display: none' class="offset4">
							<c:forEach items="${locations}" var='location'>
								<c:if test="${location.province eq province}">
									<div class="col-md-3">
										<span class="button-checkbox">
											<button type="button" class="btn btn-block"
												data-color="primary">
												<sf:label path="locations">
													<small>${location.municipality}</small>
												</sf:label>
											</button> <sf:checkbox path="locations" value="${location.id}"
												class="hidden" />
										</span>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
		</sf:form>
	</div>
	<div class="container">
		<c:if test="${not empty workers}">
			<div class="jumbotron">
				<table class="table">
					<tr>
						<td>nr.</td>
						<td>first name</td>
						<td>last name</td>
						<td>rating</td>
					</tr>
					<c:forEach items="${workers}" var='worker' varStatus="counter">
						<c:if test="${worker.user.enabled}">
							<tr>
								<td>${counter.count}</td>
								<td>${worker.firstName}</td>
								<td>${worker.lastName}</td>
								<td class="rating"><c:if
										test="${worker.currentReviewStars>=0}">
										<c:forEach begin='1' end="${worker.currentReviewStars}"
											varStatus="counter">
											<span>&#9733</span>
										</c:forEach>
										<c:forEach begin='${worker.currentReviewStars}' end="4"
											varStatus="counter">
											<span>&#9734</span>
										</c:forEach>
									</c:if></td>
								<td><a
									href="${pageContext.request.contextPath}/jobs/detail?id=${worker.id}">Details</a></td>
								<td><a
									href="${pageContext.request.contextPath}/jobs/reviews?id=${worker.id}">Reviews</a></td>
								<td><a
									href="${pageContext.request.contextPath}/messages/checkthreads?workerId=${worker.id}">Send
										a message</a></td>
								<td><a
									href="${pageContext.request.contextPath}/jobs/writereview?id=${worker.id}">Write
										a review</a></td>
							<tr />
						</c:if>
					</c:forEach>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>