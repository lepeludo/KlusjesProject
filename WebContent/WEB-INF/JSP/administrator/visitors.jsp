<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>visitors</title>
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
					<a class="navbar-brand" href="#">Visitors</a>
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
		<div class="jumbotron">
			<table class="table">
				<tr>
					<td>id</td>
					<td>date</td>
					<td>IPaddress</td>
					<td>useragent</td>
				</tr>
				<c:forEach items="${visitors}" var="visitor" varStatus="counter">
					<tr>
						<td>${visitor.id}</td>
						<td>${visitor.date}</td>
						<td>${visitor.ipAddress}</td>
						<td>${visitor.userAgent}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${fromRow != 0}">
				<c:url value="/administrator/visitors" var="{lastPageUrl}">
				</c:url>
				<a href='<c:out value="${lastPageUrl}?fromRow=${fromRow-numberOfRow}"></c:out>'>last page</a>
			</c:if>
			<c:if test="${empty lastPage}">
				<c:url value="/administrator/visitors" var="{nextPageUrl}">
				</c:url>
				<a href='<c:out value="${nextPageUrl}?fromRow=${fromRow+numberOfRow}"></c:out>'>next page</a>
			</c:if>
		</div>
	</div>
</body>
</html>