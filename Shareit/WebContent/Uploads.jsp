<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Upload file to server</h2>
<hr>
<%
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
else
{
String uid,logtm,usernm;
uid=session.getAttribute("userid").toString();
%>
Select a file to upload: <br />
<form method="post" action="FileUploads.jsp" enctype="multipart/form-data">
<input type="file" name="file"/>
<br />
<input type="hidden" name="usid" value="<%=uid%>">
<br />
<input type="submit" value="Upload" />
</form>
<%}%>
</body>
</html>