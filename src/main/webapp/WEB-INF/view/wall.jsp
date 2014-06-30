<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<jsp:include page="res/import.jsp" />
<title>SpringMVC MongoDB Exmaple</title>
</head>
<body>

	<jsp:include page="res/header.jsp" />

	<div class="container">
		<br>

		<div class="well">
			<c:url value="${pageContext.request.contextPath}/../post"
				var="postURL" />
			<form:form method="POST" commandName="postForm" action="${postURL}">
				<div class="form-group">
					<form:label path="text">What's Happening: </form:label>
					<form:textarea class="form-control" rows="3" path="text"
						placeholder="Max 140 Characters!" maxlength="140" required="true" />
					<form:input class="form-control" path="user" placeholder="Name"
						required="true" />
				</div>
				<div class="form-group">
					<input id="user_form" type="submit" value="Send!"
						class="btn btn-sm btn-info btn-block" />
				</div>
			</form:form>
		</div>

		<div id="posts"></div>

	</div>

</body>
</html>
