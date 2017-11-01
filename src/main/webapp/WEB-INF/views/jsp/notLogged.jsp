<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>9gag logged</title>
	<style type="text/css">
		#parent{  width: 900px; height: 20px;}
		#child{width: 350px; float: right; }
		#namePoints{background-color: red; display: inline-flex; margin-top: 0px; padding-top: 0px; }
		.points{margin-right: 5px;}
		#tags{display: inline-flex;}

	</style>
</head>
	<body>
	
		<jsp:include page="headerNotLogged.jsp"></jsp:include>
		<jsp:include page="posts.jsp"></jsp:include>
	
	</body>
</html>