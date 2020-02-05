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
else
{
String uid,gp;
uid=session.getAttribute("userid").toString();

String srno=request.getParameter("srno");
srno='|'+srno+'|';

Connection con;
PreparedStatement pst1,pst2;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
	pst1=con.prepareStatement("select givep from permissionslog where userid=?;");
	pst1.setString(1,uid);
	rs=pst1.executeQuery();
	rs.next();
	gp=rs.getString("givep");
	gp=gp.replace(srno,"|");
	pst2=con.prepareStatement("update permissionslog set givep=? where userid=?;");
	pst2.setString(1,gp);
	pst2.setString(2,uid);
	int v=pst2.executeUpdate();
	
	if(v>0)
	{
		response.sendRedirect("Permissions.jsp");
	}
	else
	{
%>
	<h2><b>Error in Permitting the Member!!!</b></h2>
<%
	}
	
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
}
%>	
</body>
</html>