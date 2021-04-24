<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="Tiw.Tesina3.MyAdmin" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.google.appengine.api.users.*" %>

<%@ page import= "com.google.appengine.api.users.UserService"%>
<%@ page import= "com.google.appengine.api.users.UserServiceFactory"%>



<h2>ciao</h2>


<% UserService a = UserServiceFactory.getUserService();
if(a.isUserLoggedIn()){%>

<h1>LOGGATO</h1>

<% }else{%>

<h1>NON LOGGATO</h1>

<%} %>