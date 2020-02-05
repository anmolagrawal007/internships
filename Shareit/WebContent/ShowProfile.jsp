<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="mybeans.Jdbc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
else
{
String id=session.getAttribute("userid").toString();
String nm,ag,mo,em;
Jdbc obj=new Jdbc();
obj.setId(id);
nm=obj.getNm();
ag=obj.getAg();
mo=obj.getMo();
em=obj.getEm();
%>
<h2>User Profile for <%=id %></h2>
<hr>
<img src="images/<%=id %>.jpg" style="border-radius:50%">
<br><br>
<table width="450px" cellspacing="0" border="1" bordercolor="skyblue">
<tr>
<td width="100px">Name 
<td><%=nm %>
</tr>

<tr>
<td>Age
<td><%=ag %>
</tr>

<tr>
<td>Mobile
<td><%=mo %>
</tr>

<tr>
<td>EmailID
<td><%=em %>
</tr>
<%} %>
</table>
<br><br>
<a href="ManageProfile.jsp">manage profile</a> |
<a href="members.jsp">Home</a>
</body>
</html>