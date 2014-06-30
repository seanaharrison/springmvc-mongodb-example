<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${postList}" var="post" varStatus="p">

	<script>
		$(document).ready(
				function() {
					$('#replyButton${p.index}').click(function(e) {
						$('#reply${p.index}').toggle();
					});

					$("#refreshButton${p.index}").click(
							function() {
								$('#posts').load(
										'/springmvc-mongodb-example/posts')
										.hide().fadeIn(400);
							});
				});
	</script>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>${post.user}</strong> -
				<fmt:formatDate value="${post.date}" pattern="HH:mm" />
				<fmt:formatDate type="date" value="${post.date}" />
				<span id="refreshButton${p.index}"
					class="btn btn-sm btn-info pull-right refreshIcon glyphicon glyphicon-refresh"></span>
			</h3>
		</div>
		<div class="panel-body">${post.text}
			<a id="replyButton${p.index}" type="button"
				class="btn btn-sm btn-info pull-right">Reply</a> <br> <br>
			<div id="reply${p.index}" hidden="true" class="well">
				<c:url
					value="${pageContext.request.contextPath}/../reply?id=${post.id}"
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

			<c:forEach items="${post.posts}" var="posts" varStatus="ps">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>${posts.user}</strong> -
							<fmt:formatDate value="${posts.date}" pattern="HH:mm" />
							<fmt:formatDate type="date" value="${posts.date}" />
						</h3>
					</div>
					<div class="panel-body">${posts.text}</div>
				</div>
			</c:forEach>

		</div>
	</div>
</c:forEach>

