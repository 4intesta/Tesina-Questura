<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Tiw.Tesina3.HelloAppEngine" %>
<%@page import="Tiw.Tesina3.MyAdmin" %>
<%@page import="Tiw.Tesina3.MyAdminCreAcc" %>
<%@page import="Tiw.Tesina3.MyAdminUpload" %>
<%@page import="java.util.ArrayList" %>

<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <title>Hello App Engine Standard Java 8</title>
</head>
<body>

<form action="/myadmincreatescu">
	<label for="date">Nome Scuola</label>
	<input type="text" name="nome" />
	<label for="date">Tipo di Scuola</label>
	<select name="tipo">
		  <option value="Scuola Media">Scuola Media</option>
		  <option value="Liceo">Liceo</option>
		  <option value="Istituto Tecnico">Istituto Tecnico</option>
		  <option value="Istituto Professionale">Istituto Professionale</option>
	</select>
	<label for="date">Latitudine:</label>
	<input type="text" name="latitudine" />
	<label for="date">Longitudine:</label>
	<input type="text" name="longitudine" />
    <button id=generator type="submit">CREA SCUOLA</button>
</form>

<h1>------------------------------------------------------------</h1>

<form action="/myadmincreate">
	<input type="number" name ="accDaGenerare" placeholder="0"> 
	<select name="scuola">
	<% MyAdmin myAdm = new MyAdmin ();
		ArrayList <String> lista = myAdm.queryScuole();
		for(int i = 0; i<lista.size(); i++){
	%>
		  <option value="<%=lista.get(i)%>"><%=lista.get(i)%></option>
		  
	 <%} %>
	</select>
	
    <button id=generator type="submit">CREA ACCOUNT</button>
</form>

<h1>------------------------------------------------------------</h1>


<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="text" name="description" />
    <input type="file" name="file" />
    <input type="submit" />
</form>


</body>
</html>
