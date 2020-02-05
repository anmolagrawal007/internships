<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="mybeans.Jdbc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Manage Profile</h2>
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

<form name="frm" method="post" action="profileUpdate.jsp">

<table>
<tr>
<td>Update Username
<td><input type="text" name="usernm" value=<%=nm %>>
</tr>
<tr>
<td>Update Age
<td><input type="text" name="age" value=<%= ag %>>
</tr>
<tr>
<td>Update Mobile no
<td><input type="text" name="mob" value=<%= mo %>>
</tr>
<tr>
<td>Update EmailId
<td><input type="text" name="email" value=<%= em %>>
</tr>
<tr>
<td>
<td><input type="submit" value="submit">
<%} %>
</table>
</form>
</body>
</html>