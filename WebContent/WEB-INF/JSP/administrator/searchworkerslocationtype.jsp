<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>search workers</title>
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
					<a class="navbar-brand" href="#">search workers</a>
				</div>
				<div class="navbar-collapse collapse"></div>
			</div>
		</div>
	</div>
	<c:url value="/administrator/searchworkerslocationtype" var="url" />
	<div class="container">
		<h2>Find a worker by name</h2>
		<h4>Leave the field empty to display ALL workers</h4>
		<form action="${url}" method="get">
			<p>
				<input class="form-control" type="text" name="keyword">
			</p>
			<p>
				<input type="submit" value="search by name" class="btn btn-primary" />
			</p>

		</form>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-3">
				<h1 class="col-md-6 col-md-offset-6">or</h1>
			</div>
		</div>
	</div>
	<div class="container">

		<h2>Find a worker by location and jobtype</h2>

		<sf:form action="${url}" method="post" commandName="workersForm">
			<div class="row">
				<h3>Select the jobtypes you perform</h3>
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
			<div class="row">
				<h3>Select the communities</h3>
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
						<br /> <input type="submit" value="search by location and jobtype"
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
				<h2>These workers matched your criteria:</h2>
				<form action="${enabledisableurl}" method="POST">
					<table class="table">
						<tr>
							<td>nr</td>
							<td>first name</td>
							<td>last name</td>
							<td>E-mail</td>
							<td>Date account</td>
							<td>Last logged in</td>
							<td>x logged in</td>
							<td>n ratings</td>
							<td>avg of ratings</td>
							<td>enabled</td>
						</tr>
						<c:forEach items="${workers}" var='worker' varStatus="counter">
							<tr>
								<td>${counter.count}</td>
								<td>${worker.firstName}</td>
								<td>${worker.lastName}</td>
								<td>${worker.user.email}</td>
								<td>${worker.dateAccount}</td>
								<td>${worker.dateLastLogin}</td>
								<td>${worker.numberOfLogins}</td>
								<td>${worker.reviewStars.size()}</td>
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
								<td><input type="checkbox" name="workerIds"
									value="${worker.id}"
									<c:if test="${worker.user.enabled}">checked="checked"</c:if>></td>
								<td><a
									href="${pageContext.request.contextPath}/jobs/detail?id=${worker.id}">Details</a></td>
								<td><a
									href="${pageContext.request.contextPath}/jobs/reviews?id=${worker.id}">Reviews</a></td>
								<td><a
									href="${pageContext.request.contextPath}/administrator/email/?email=${worker.user.email}">Send
										E-mail</a></td>

							</tr>
							<input type="hidden" name="allWorkerIds" value="${worker.id}">
						</c:forEach>
					</table>
					<input type="submit" class="btn btn-danger"
						value="disable/enable workers">
				</form>
			</div>
		</c:if>
	</div>
</html>