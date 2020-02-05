<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mybeans.DBConnector" %>
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
String fnm=request.getParameter("fnm");
Connection con;
PreparedStatement pst;
ResultSet rs;
String type="";

try
{
	DBConnector dbc=new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select ftype from uploads where fname=?;");
	pst.setString(1,fnm);
	rs=pst.executeQuery();
	rs.next();
	type=rs.getString("ftype");
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
	
	if(type.equals("png")||type.equals("jpg"))
	{
%>
 		<img src="uploadedfiles/<%=fnm%>" width="500" height="333">
<%
	}
	if(type.equals("mp4"))
	{
%>
		<video width="320" height="240" controls>
		<source src="uploadedfiles/<%=fnm%>" type="video/mp4">
		Your browser does not support the video tag.
		</video>
		
<%
	}

	if(type.equals("pdf"))
	{
%>
		<embed src="uploadedfiles/<%=fnm%>" type="application/<%=type%>" width="100%" height="600px" />
<%
	}
%>

</body>
</html>