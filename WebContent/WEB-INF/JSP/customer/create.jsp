<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<title>new customer</title>
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
					<a class="navbar-brand" href="#">New customer</a>
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
	<div class="row">
		<p />
		<br />
		<div class="col-md-6 col-md-offset-1">
			<c:url value="/customer/docreate" var="succesurl" />
			<sf:form action="${succesurl}" method="post"
				commandName="customerForm">
				<div class="form-group">
					<sf:label path="firstName">first name:</sf:label>
					<div class="controls">
						<sf:input type="text" class="form-control" path="firstName" />
						<sf:errors path="firstName" />
					</div>
				</div>
				<div class="form-group">
					<sf:label path="lastName">last name:</sf:label>
					<div class="controls">
						<sf:input type="text" class="form-control" path="lastName" />
						<sf:errors path="lastName" />
					</div>
				</div>
				<div class="form-group">
					<sf:label path="email">E-Mail<small>(not visible
							to others)</small>
					</sf:label>
					<div class="controls">
						<sf:input type="text" class="form-control" path="email" />
						<sf:errors path="email" />
					</div>
				</div>
				<div class="form-group">
					<sf:label path="username">username</sf:label>
					<div class="controls">
						<sf:input type="text" class="form-control" path="username" />
						<sf:errors path="username" />
					</div>
				</div>
				<div class="form-group">
					<sf:label path="password">password:</sf:label>
					<div class="controls">
						<sf:input type="password" class="form-control" path="password" />
						<sf:errors path="password" />
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Create</button>
			</sf:form>
		</div>
		<div class="col-md-5 text-justify">
			<h4>Make your own account right now.</h4>
			<br/>
			<H5>You'll receive an e-mail to complete your registration</H5>
		</div>
	</div>
</body>
</html>
