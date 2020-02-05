<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
    <%@page import="java.time.LocalDateTime" %>
    <%@page import="mybeans.DBConnector" %>
    <%@page import="java.io.IOException" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2><b>WELCOME</b></h2>
<%
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
else
{
String uid,logtm,usernm;
usernm=session.getAttribute("usernm").toString();
logtm=session.getAttribute("logindtm").toString();
uid=session.getAttribute("userid").toString();

Connection con;
PreparedStatement pst;
ResultSet rs;
		
try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	
	DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss");
	DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	LocalDateTime now = LocalDateTime.now();
	
	pst=con.prepareStatement("update loginlog set date=?,time=?,counter=counter+1 where userid=?;");
	pst.setString(1,df.format(now));
	pst.setString(2,tf.format(now));
	pst.setString(3,uid);
	pst.executeUpdate();
	
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>
	
<h3>Logged in as : <%=usernm %> at : <%=logtm %></h3>
<hr>
<a href="Uploads.jsp">Upload Files</a><br>
<a href="ShowProfile.jsp">Show My Profile</a> | 
<a href="ViewDocuments.jsp">View Members Uploaded Documents</a><br>
<a href="Permissions.jsp">Permissions</a><br>
<a href="Downloadlog.jsp">Downloadlog</a><br>
<a href="ChangePass.html">ChangePassword</a><br>
<a href="Logout.jsp">Logout</a>
<%} %>
</body>
</html>