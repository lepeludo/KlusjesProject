<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>please log in</title>
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
					<a class="navbar-brand" href="#">Log in</a>
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
	<div class="container col-md-7 col-md-offset-3 jumbotron">
		<div class="row">
				<label>Please Sign In</label>
				<c:url value="/forgotpassword" var="url"></c:url>
				<div class="alert alert-error">
					<c:if test="${param.error != null}">
						<p class="error">Login failed. Check that your username and
							password are correct.</p>
					</c:if>
				</div>
				<form name='f'
					action='${pageContext.request.contextPath}/j_spring_security_check'
					method='POST' accept-charset="UTF-8">
					<input type="text" id="username" name="j_username"
						placeholder="Username"> <input type="password"
						id="password" name="j_password"
						placeholder="Password"><br/><br/> <span><input
						type='checkbox' name='_spring_security_remember_me'
						checked="checked"> Remember Me</span>
					
					<button type="submit" name="submit" value="Login"
						class="btn btn-info btn-block">Sign in</button>
				</form>
		</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-7">
			<br/><br/>
				<form action="${url}" method="get">
					<button type="submit" class="btn btn-danger">Forgot
						password</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
