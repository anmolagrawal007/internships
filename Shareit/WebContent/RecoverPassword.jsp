<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="mybeans.*" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id,sq,an,np,mo,res;
id=request.getParameter("uid");
sq=request.getParameter("ques");
an=request.getParameter("ans");
Recoverpasswd rp=new Recoverpasswd();
rp.setId(id);
rp.setSq(sq);
rp.setAn(an);

res=rp.getStatus();
%>
<%= res %>





</body>
</html>






