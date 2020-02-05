<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <link rel="stylesheet" href="Style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shareit</title>
</head>
<body>
<h2 class="color">Login Form</h2>
<form name="frm" method="post" action="Check">
 <div class="imgcontainer">
    <img src="images/user.png" alt="Avatar" class="avatar">
  </div>
  <div class="container">
 <table>

<tr><td><b class="color">UserId</b>
<td><input type="text" name="uid">
</tr>

<tr>
<td><b class="color">Password</b>
<td><input type="password" name="psw">
</tr>
<% 
Calendar cal=Calendar.getInstance();
String dt=cal.getTime().toString();
%>
<tr><td><input type="hidden" name="logdt" value="<%=dt%>">
<td><button type="submit" value="Submit">Submit</button>
</tr>

</table>
</div>
 </form>
 <center>
<a href="Forgotpass.jsp">Forgot password</a> | <a href="NewUser.jsp">New Member Registration</a>
</center>









</body>
</html>