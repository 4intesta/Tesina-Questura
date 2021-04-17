<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Tiw.Tesina3.HelloAppEngine" %>
<%@page import="Tiw.Tesina3.MyAdmin" %>
<%@page import="Tiw.Tesina3.MyAdminCreAcc" %>
<%@page import="Tiw.Tesina3.MyAdminUpload" %>

<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <title>Hello App Engine Standard Java 8</title>
</head>
<body>


<form action="/myadmincreate">
    <button id=generator type="submit">CREA ACCOUNT</button>
</form>

<h1>------------------------------------------------------------</h1>

<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="text" name="description" />
    <input type="file" name="file" />
    <input type="submit" />
</form>


kjggfdg

</body>
</html>
