<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
   <%@page import="mybeans.DBConnector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2><b><center>Here is the Download log !!!</center></b></h2>
<br>
<hr>
<table border="2">
<tr>
<th>File Name
<th>Uploaded by
<th>Downloaded by
<th>Download Date
<th>Download Time
<th>File Type
</tr>
<%
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
Connection con;
Statement st;
ResultSet rs;
%>
<%
try{
	
DBConnector db = new DBConnector();
con=db.getDbconnection();
st=con.createStatement();
rs=st.executeQuery("select t1.usernm as n1,t2.usernm as n2,t.ubyid,t.userid,t.fname,t.ddate,t.dtime,t.ftype from downloadlog t inner join users t1 on t1.userid=t.ubyid inner join users t2 on t2.userid=t.userid;");

while(rs.next())
{
%>
<tr>
<td><%=rs.getString("fname") %>
<td><%=rs.getString("n1") %> (<%=rs.getString("ubyid") %>)
<td><%=rs.getString("n2") %> (<%=rs.getString("userid") %>)
<td><%=rs.getString("ddate") %>
<td><%=rs.getString("dtime") %>
<td><%=rs.getString("ftype") %>
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