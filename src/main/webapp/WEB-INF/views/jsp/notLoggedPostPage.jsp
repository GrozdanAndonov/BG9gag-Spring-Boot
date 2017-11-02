<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><c:out value="${ postPostPage.description }"></c:out></title>
</head>
<body>

		<jsp:include page="headerNotLogged.jsp"></jsp:include>
		
			<div>
		<h1><c:out value="${  sessionScope.postPostPage.description }"></c:out></h1><br>
		<c:forEach items="${  sessionScope.postPostPage.tags}" var="tag" >
						<a href=""> #<c:out value="${ tag.tagName }"></c:out></a>
		</c:forEach>
		<br>
		<img src="/MyProject/postpic?pictureUrl=${sessionScope.postPostPage.postUrl}&userName=${sessionScope.userPostPage.username}" width="50%" height="auto">
		<br>
		<span>Points:<c:out value="${ sessionScope.postPostPage.points }"></c:out></span>
		<!--<button id="likeButton" value="Like" style="background-color: green" onclick="handleLike()">Like</button>-->
		<p style="display: none;"><c:out value="${ sessionScope.postPostPage.postId }"></c:out></p>
		<p style="display: none;"><c:out value="${ sessionScope.userPostPage.id }"></c:out></p>
		<h3>Comments:</h3>
	<script type="text/javascript">
		function handleLike(){
			let button = document.getElementById("likeButton");
			if(button.innerHTML=="Like"){
				likePost();
			}else{
				unlikePost();
			}
			
		}
			function likePost() {
				let request =new XMLHttpRequest();
				request.onreadystatechange = function() {			
					if(this.readyState == 4 && this.status == 200){
						let button = document.getElementById("likeButton");
						button.innerHTML="Dislike";
						button.style.backgroundColor  = "red";						
					}
				
				}
				request.open("post","/MyProject/like",true);
				request.send();				
				  }
				  function unlikePost() {
						let request =new XMLHttpRequest();	
						request.onreadystatechange = function() {
							if(this.readyState == 4 && this.status == 200){
								let button = document.getElementById("likeButton");
								button.innerHTML="Like";
								button.style.backgroundColor  = "green";
							}
						
						}
						request.open("post","/MyProject/unlike",true);
						request.send();
						  }
				 
						  
				
	</script>
		<c:if test="${  sessionScope.postPostPage.comments.size()>0 }">
		<c:forEach items="${  sessionScope.postPostPage.comments }" var="comment" >
			<div>
				<h3><c:out value="${ comment.user.username }"></c:out>
				:DATE:<c:out value="${ comment.dateTime }"></c:out>
				:POINTS:<c:out value="${ comment.points }"></c:out></h3>
				<h2><c:out value="${ comment.comment }"></c:out></h2>
				</div>
				<c:forEach items="${comment.childComments}" var="childComment">
							<div>							
								<h5><c:out value="${ childComment.user.username }"></c:out>
								:DATE:<c:out value="${ childComment.dateTime }"></c:out>
								:POINTS:<c:out value="${ childComment.points }"></c:out></h5>
								<h5><c:out value="${ childComment.comment }"></c:out></h5>
							</div>							
				</c:forEach>
				
		</c:forEach>
		</c:if>
		<c:if test="${  sessionScope.postPostPage.comments.size()==0 }">
		<h2>No comments yet...</h2>
		</c:if>
		</div>
		
</body>
</html>