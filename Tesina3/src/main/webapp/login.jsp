<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="assets/css/main.css" />
<title>Login utente</title>

</head>
<body>

		<!-- Header -->
				<section style="margin:0px" id="header">

					<!-- Logo -->
						<h1><a href="Mappe.jsp">Login</a></h1>
						
				</section>		
				
				<section id="main">
						<div class="container">
<div class="col-12">
		<form action="/getin">
			
			
				Username <input style ="margin-bottom:10px" type="text" name="username"/>
		
				Password <input style ="margin-bottom:20px" type="password" name="password"/>
			
				<input style ="margin-bottom:10px" class="button primary" type="submit" value="Login"/>
			
			
		</form>
		</div>
		<a href="loginAdmin.jsp">Accedi come amministratore</a>
 	</div>
		</section>
			
		
		
</body>
</html>

