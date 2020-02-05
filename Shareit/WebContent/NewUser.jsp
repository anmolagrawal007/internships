<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script language="Javascript" type="text/javascript">
<!--

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest() {
    id=document.frm.uid.value;
    http.open('get', 'Available.jsp?uid=' + id);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('mess').innerHTML = response;
    }
}

-->
</script>


</head>
<body>
<h2>New User Registration</h2>
<hr>

<form name="frm" method="post" action="Register">
<table>
<tr>
<td>UserID
<td><input type="text" name="uid">
<input type="button" value="Check" onclick="makeGetRequest()">
<br>
<div id="mess"></div>
</tr>
<tr>
<td>Password
<td><input type="password" name="psw">
</tr>
<tr>
<td>UserName
<td><input type="text" name="unm">
</tr>
<tr>
<td>Age
<td><input type="text" name="age">
</tr>
<tr>
<td>Gender
<td><input type="radio" name="gender" value="male"> Male
<input type="radio" name="gender" value="female" checked> Female
</tr>

<tr>
<td>Mobile
<td><input type="text" name="mob">
</tr>

<tr>
<td>EmailID
<td><input type="text" name="email">
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
<td><input type="submit" value="Register">
<td>
</tr>
</table>
</form>

</body>
</html>








