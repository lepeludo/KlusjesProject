<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
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
<title>new worker</title>
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
					<a class="navbar-brand" href="#">New Worker</a>
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

		<c:url value="/worker/docreate" var="succesurl" />
		<sf:form action="${succesurl}" method="post" commandName="workerForm">
			<div class="row">
				<div class="col-md-6 col-md-offset-1">
					<sf:label path="firstName">first name:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="firstName" />
					<sf:errors path="firstName" />
					<br />
					<sf:label path="lastName">last name:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="lastName" />
					<sf:errors path="lastName" />
					<br />
					<sf:label path="email">e-Mail:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="email" />
					<sf:errors path="email" />
					<br />
					<sf:label path="phoneNumbers">phonenumber:</sf:label>
					<br />
					<sf:errors path="phoneNumbers" />
					<c:forEach items="${workerForm.phoneNumbers}" varStatus="status">

						<sf:input path="phoneNumbers[${status.index}]" />
						<sf:errors path="phoneNumbers[${status.index}]" />

					</c:forEach>
					<div class="row" class="col-md-10 col-md-offset-1">
						<br /> <input type="submit" value="Add a phonenumber"
							name="addanumber" /> <input type="submit"
							value="Remove phonenumbers" name="removenumbers" />
					</div>
					<br />
					<sf:label path="username">username:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="username" />
					<sf:errors path="username" />
					<br />
					<sf:label path="password">password:</sf:label>
					<br />
					<sf:input class="form-control" type="password" path="password" />
					<sf:errors path="password" />
					<br />
					<sf:label path="extraInformation">extra information:</sf:label>
					<br /> <br />
					<sf:textarea rows="10" cols="80" path="extraInformation" />
					<sf:errors path="extraInformation" />
					<br />
				</div>
				<div class="col-md-5 text-justify">
					<h4>Make your own account right now.</h4>
					<br />
					<H5>You'll receive an e-mail to complete your registration</H5>
				</div>
			</div>
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
				<h3>Select the communities you service</h3>
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
						<br /> <input type="submit" value="create worker"
							class="btn btn-primary" />
					</div>
				</div>
				<div class="col-md-10">
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
</body>
</html>