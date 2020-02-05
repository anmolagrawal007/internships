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
<h3><b><center>Here is the List of Members with there Status</center></b></h3>


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
	String id;
	try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shareit?user=root&password=volkswagen");
			st=con.createStatement();
			rs=st.executeQuery("select users.userid,users.usernm,members.status from users inner join members on users.userid=members.userid;");
			while(rs.next())
			{
				id=rs.getString("userid");
%>

<tr>
<td><%=rs.getString("userid") %>
<td><%=rs.getString("usernm") %>
<%
		if(rs.getInt("status")==1)
		{
%>
	<td><a href="Deactivate.jsp?usid=<%=id%>">Deactivate</a>
<% 
		}
		else
		{
%>
	<td><a href="Activate.jsp?usid=<%=id%>">Activate</a>
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