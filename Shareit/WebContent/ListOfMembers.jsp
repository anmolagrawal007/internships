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
<h2><b><center>List Of Members</center></b></h2>

<table>
<tr>
<th>User Id
<th>User Name
<th>Status
</tr>

<% 
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
	Connection con;
	Statement st;
	ResultSet rs;
	try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
			st=con.createStatement();
			rs=st.executeQuery("select users.userid,users.usernm,members.status from users inner join members on users.userid=members.userid;");
			while(rs.next())
			{
%>
<tr>
<td><%=rs.getString("userid") %>
<td><%=rs.getString("usernm") %>

<%
if(rs.getInt("status")==1)
{
%>
<td>Active
<%
}
else
{
%>
<td>Deactive
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
%>
</table>
</body>
</html>