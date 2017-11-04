<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<style type="text/css">
			.error{color: red;}
		</style>
	</head>
	<body>
	<jsp:include page="headerNotLogged.jsp"></jsp:include>
		
		<f:form commandName="user">
			<p>username</p>
			<f:input path="username"/><br>
			<f:errors class="error" path="username"/>
			
			<p>email</p>
			<f:input path="email"/><br>
			<f:errors class="error" path="email"/>
			
			<p>password</p>
			<f:password id="password" path="password"/><br>
			<f:errors class="error" path="password"/><br>
			
			<input type="submit" value="Register">
		</f:form>	
	</body>
</html>