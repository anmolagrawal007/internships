<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Password recovery form</h2>
<hr>
<form name="frm" method="post" action="RecoverPassword.jsp">
<table>
<tr>
<td>UserID
<td><input type="text" name="uid">
</tr>

<tr>
<td>Security Question
<td>
<select name="ques">
<option value="What is your birth place?">What is your birth place?
<option value="Who is your favorite filmstar?">Who is your favorite filmstar?
<option value="Which color do you like the most?">Which color do you like the most?
<option value="Which is your favorite tourist destination?">Which is your favorite tourist destination?
</select>
</tr>

<tr>
<td>Answer
<td><input type="text" name="ans">
</tr>

<tr>
<td><input type="submit" value="Submit">
<td>
</tr>

</table>
</form>
</body>
</html>