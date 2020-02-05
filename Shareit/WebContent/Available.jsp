<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("uid");
UserFinder uf=new UserFinder();
uf.setUserid(id);

if(uf.getStatus().equals("failed"))
{
%>
<span style="color:red">Sorry userid <%=id %> NOT available</span>
<%
}
else
{
%>
<span style="color:green">Congrats userid <%=id %> is available</span>
<%
}
%>
</body>
</html>