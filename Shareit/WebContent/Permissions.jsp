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
<h2><b><center>Permissions</center></b></h2>

<table>
<tr>
<th>User Id
<th>User Name
<th>Permission
</tr>

<% 
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
else
{
String uid,logtm,usernm,s,t;
uid=session.getAttribute("userid").toString();
	Connection con;
	PreparedStatement pst1,pst2;
	ResultSet rs1,rs2;
	try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
			pst1=con.prepareStatement("select users.userid,users.usernm,permissionslog.srno from users inner join permissionslog on users.userid=permissionslog.userid where users.userid not in(?);");
			pst1.setString(1,uid);
			rs1=pst1.executeQuery();
			pst2=con.prepareStatement("select givep from permissionslog where userid=?;");
			pst2.setString(1,uid);
			rs2=pst2.executeQuery();
			rs2.next();
			s=rs2.getString("givep");
			while(rs1.next())
			{
%>
<tr>
<td><%=rs1.getString("userid") %>
<td><%=rs1.getString("usernm") %>

<%
t='|'+rs1.getString("srno")+'|';
if(s.contains(t))
{
t=rs1.getString("srno");
%>
<td><a href="Remove.jsp?srno=<%=t%>">Remove</a>
<%
}
else
{
t=rs1.getString("srno");
%>
<td><a href="Give.jsp?srno=<%=t%>">Give</a>
<%
}
%>
</tr>
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
</table>
</body>
</html>