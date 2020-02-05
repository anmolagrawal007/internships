<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
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
Connection con;
Statement st;
int c;
String id;
id=request.getParameter("usid");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
st=con.createStatement();
c=st.executeUpdate("update members set status=0 where userid="+id+";");
if(c>0)
{
response.sendRedirect("MemberStatus.jsp");
}
else
{
%>
<h1><b>Error in Deactivating the Account of User Id <i><u><%=id %></u></i></b></h1>
<%
}
con.close();
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>