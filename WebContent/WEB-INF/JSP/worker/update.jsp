<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<title>update profile</title>
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
					<a class="navbar-brand" href="#">Update ${worker.name}</a>
				</div>
				<div class="navbar-collapse collapse"></div>

			</div>

		</div>
	</div>
	<div class="container">
		<c:url value="doupdate" var="updateurl" />
		<sf:form action="${updateurl}" method="post"
			commandName="updateWorkerForm">
			<sf:label path="firstName">first name:</sf:label>
			<br />
			<sf:input type="text" path="firstName" />
			<sf:errors path="firstName" />
			<br />
			<sf:label path="lastName">last name:</sf:label>
			<br />
			<sf:input type="text" path="lastName" />
			<sf:errors path="lastName" />
			<br />
			<sf:label path="email">E-Mail:</sf:label>
			<br />
			<sf:input type="text" path="email" />
			<sf:errors path="email" />
			<br />
			<sf:label path="phoneNumbers">Phonenumber:</sf:label>
			<br />
			<sf:errors path="phoneNumbers" />
			<c:forEach items="${updateWorkerForm.phoneNumbers}"
				varStatus="status">
				<sf:input path="phoneNumbers[${status.index}]" />
				<sf:errors path="phoneNumbers[${status.index}]" />
			</c:forEach>
			<input type="submit" value="Add a phonenumber" name="addanumber" />
			<input type="submit" value="Remove phonenumbers" name="removenumbers" />
			<br />

			<sf:label path="extraInformation">extra information:</sf:label>
			<br />
			<sf:textarea rows="10" cols="80" path="extraInformation" />
			<sf:errors path="extraInformation" />
			<br />
			<p />
			<div class="container">
				<h3>Select the jobtypes you perform</h3>
				<sf:errors path="jobTypes" id="inputError1" />
				<c:forEach items="${jobTypes}" var='jobtype'>
					<div class="col-md-3">
						<span class="button-checkbox">
							<button type="button" class="btn" data-color="primary">
								<sf:label path="jobTypes">${jobtype.jobDescription}</sf:label>
							</button> <sf:checkbox path="jobTypes" value="${jobtype.id}"
								class="hidden" />
						</span>
					</div>
				</c:forEach>
			</div>
			<p />
			<div class="container">
				<h3>Select the communities you service</h3>

				<p />
				<c:forEach items="${allProvinces}" var='province'>

					<span class="button-checkbox">
						<button type="button" class="btn" data-color="warning"
							onclick="toggle_visibility('${province}')">${province}</button> <input
						type="checkbox" value="${province}" class="hidden" />
					</span>
				</c:forEach>
				<c:forEach items="${allProvinces}" var='province'>
					<div id="${province}" style='display: none' class="offset4">
						<c:forEach items="${locations}" var='location'>
							<c:if test="${location.province eq province}">
								<div class="col-md-3">
									<span class="button-checkbox">
										<button type="button" class="btn" data-color="primary">
											<sf:label path="locations">${location.province}, ${location.municipality}</sf:label>
										</button> <sf:checkbox path="locations" value="${location.id}"
											class="hidden" />
									</span>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<input type="submit" value="update my profile"
				class="btn btn-primary" />
		</sf:form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/styles/dist/js/checkboxes.js"></script>
</body>
</html>