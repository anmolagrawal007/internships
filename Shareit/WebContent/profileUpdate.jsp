<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mybeans.*" %>
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
String email,mob,usernm,re;
int age;
usernm=request.getParameter("usernm");
mob=request.getParameter("mob");
email=request.getParameter("email");
age=Integer.parseInt(request.getParameter("age"));
String uid=session.getAttribute("userid").toString(); 
ProfileUpdater pu=new ProfileUpdater();

pu.setUid(uid);
pu.setUsernm(usernm);
pu.setEmail(email);
pu.setMob(mob);
pu.setAge(age);

re=pu.getStatus();
%>
<%= re %>
<a href="members.jsp">Home</a>
</body>
</html>