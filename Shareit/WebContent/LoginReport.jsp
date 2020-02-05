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
<h2><b><center>Members Login Log Report</center></b></h2>

<table>
<tr>
<th>User Id
<th>User Name
<th>Last Login Date
<th>Last Login Time
<th>Login Counter
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
			rs=st.executeQuery("select users.userid,users.usernm,loginlog.date,loginlog.time,loginlog.counter from users inner join loginlog on users.userid=loginlog.userid;");
			while(rs.next())
			{
%>
<tr>
<td><%=rs.getString("userid") %>
<td><%=rs.getString("usernm") %>
<td><%=rs.getString("date") %>
<td><%=rs.getString("time") %>
<td><%=rs.getInt("counter") %>
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