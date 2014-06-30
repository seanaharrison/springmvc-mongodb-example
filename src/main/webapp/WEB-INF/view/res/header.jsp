<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div class="blog-masthead">
	<div class="container">
		<nav class="blog-nav">
			<img alt="header" src="img/header.png"> <a
				class="blog-nav-item active"
				href="<c:url value="${pageContext.request.contextPath}/../"/>">Your
				Messages</a>
		</nav>
	</div>
</div>