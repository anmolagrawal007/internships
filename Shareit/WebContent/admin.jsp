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
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<h2><b>This is the admin page!!!</b></h2>
<a href="MemberStatus.jsp">Activate/Deactivate</a><br>
<a href="LoginReport.jsp">Members Login Log Report</a><br>
<a href="ListOfMembers.jsp">List Of Members</a><br>
<a href="Logout.jsp">Logout</a>
</body>
</html>