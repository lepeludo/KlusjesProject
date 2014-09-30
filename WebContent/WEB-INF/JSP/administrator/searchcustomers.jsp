<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>search customers</title>
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
					<a class="navbar-brand" href="#">Search customers</a>
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
		<c:url value="/administrator/searchcustomers" var="url" />
		<form action="${url}" method="get">
			<input class="form-control" type="text" name="keyword"> <input
				type="submit" value="search">
		</form>
		<c:url value="/administrator/enablecustomers" var="enableurl" />
		<c:if test="${not empty customers}">
			<div class="jumbotron">
				<form action="${enableurl}" method="post">
					<table class="table">
						<tr>
							<td>nr</td>
							<td>first name</td>
							<td>last name</td>
							<td>E-mail
							<td>Date account</td>
							<td>Last logged in</td>
							<td>x logged in</td>
							<td>enabled</td>
						</tr>
						<c:forEach items="${customers}" var="customer" varStatus="counter">
							<tr>
								<td>${counter.count}</td>
								<td>${customer.firstName}</td>
								<td>${customer.lastName}</td>
								<td>${customer.user.email}</td>
								<td>${customer.dateAccount}</td>
								<td>${customer.dateLastLogin}</td>
								<td>${customer.numberOfLogins}</td>
								<td><input type="hidden" name="allCustomerIds"
									value="${customer.id}"> <input type="checkbox"
									name="customerIds" value="${customer.id}"
									<c:if test="${customer.user.enabled}">checked="checked"</c:if>></td>
								<td><a
									href="${pageContext.request.contextPath}/administrator/email/?email=${customer.user.email}">Send
										E-mail</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${fromRow != 0}">
						<c:url value="/administrator/searchcustomers" var="{lastPageUrl}">
						</c:url>
						<a
							href='<c:out value="${lastPageUrl}?keyword=${keyword}&?fromRow=${fromRow-numberOfRow}"></c:out>'>last
							page</a>
					</c:if>
					<c:if test="${empty lastPage}">
						<c:url value="/administrator/searchcustomers" var="{nextPageUrl}">
						</c:url>
						<a
							href='<c:out value="${nextPageUrl}?keyword=${keyword}&?fromRow=${fromRow+numberOfRow}"></c:out>'>next
							page</a>
					</c:if>
					<input type="submit" class="btn btn-danger"
						value="enable/disable users">
				</form>
			</div>
		</c:if>
	</div>
</body>
</html>