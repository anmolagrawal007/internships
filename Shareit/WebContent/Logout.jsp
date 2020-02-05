<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate();
%>
<h3><b><center>You are now logged out of your Account!!!</center></b></h3>
<a href="index.jsp">Go to Home Page</a>
</body>
</html>