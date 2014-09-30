<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>create administrator</title>
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
					<a class="navbar-brand" href="#">New Administrator</a>
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
		<div class="row">
			<p />
			<br />
			<div class="col-md-6 col-md-offset-1">
				<c:url value="/administrator/docreate" var="succesurl" />
				<sf:form action="${succesurl}" method="post"
					commandName="administratorForm">
					<sf:label path="name">name:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="name" />
					<sf:errors path="name" />
					<br />
					<sf:label path="email">E-Mail:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="email" />
					<sf:errors path="email" />
					<br />
					<sf:label path="username">username:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="username" />
					<sf:errors path="username" />
					<br />
					<sf:label path="password">password:</sf:label>
					<br />
					<sf:input class="form-control" type="text" path="password" />
					<sf:errors path="password" />
					<br />
					<input type="submit" class="btn btn-primary" value="submit" />
				</sf:form>
			</div>
		</div>
		<div class="col-md-5 text-justify">
			<h4>Make your own account right now.</h4>
			<br />
			<H5>You'll receive an e-mail to complete your registration</H5>
		</div>
	</div>
</body>
</html>