<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>message to administrator</title>
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
					<a class="navbar-brand" href="#">Message to administrator</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

					</ul>
					<ul class="nav navbar-nav navbar-right">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-3 text-justify">
			You're sending a message to an administrator.<br /> Try to be as
			clear as possible describing the subject of the conversation <br />Be
			nice!
		</div>
		<div class="col-md-7 col-md-offset-2">
			<c:url value="/administratormessages" var="url" />
			<sf:form action="${url}" method="post"
				commandName="administratorMessageForm">
				<sf:label path="subject">Subject</sf:label>
				<sf:input path="subject" />
				<sf:errors path="subject" />

				<br />
				<p />
				<sf:label path="text">Message</sf:label>
				<br />
				<sf:textarea cols="60" rows="20" path="text" />
				<sf:errors path="text" />
				<br />
				<input type="submit" value="submit" />
			</sf:form>
		</div>
	</div>
</body>
</html>