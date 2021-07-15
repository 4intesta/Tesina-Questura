<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Tiw.Tesina3.HelloAppEngine" %>
<%@page import="Tiw.Tesina3.MyAdmin" %>
<%@page import="Tiw.Tesina3.MyAdminCreAcc" %>
<%@page import="Tiw.Tesina3.MyAdminUpload" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.google.appengine.api.datastore.Entity" %>

<html>
<head>
	<meta charset="ISO-8859-1">
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <title>Funzioni Admin</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="index.html">Funzioni Amministratore</a></h1>


	 <!-- Nav -->
                                                            <nav id="nav">
                                                                      <ul>
                                                                                <li class="current"><a href="index.jsp">Area Admin</a></li>
                                                                               
                                                                                <li><a href="loginAdmin.jsp">LogOut</a></li>
                                                                               
                                                            </nav>



				</section>

	<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<!-- Portfolio -->
									<section>
										<header class="major">
											<h2>CREA SCUOLA</h2>
										</header>


<form action="/myadmincreatescu">

	<label for="date" style ="margin-bottom:10px">Nome Scuola:</label>
	<input type="text" name="nome" style ="margin-bottom:10px"/>
	<label for="date">Tipo di Scuola:</label>
	<select name="tipo" style ="margin-bottom:10px">
		  <option value="Scuola Media">Scuola Media</option>
		  <option value="Liceo">Liceo</option>
		  <option value="Istituto Tecnico">Istituto Tecnico</option>
		  <option value="Istituto Professionale">Istituto Professionale</option>
	</select>
	<label for="date" style ="margin-bottom:10px">Latitudine:</label>
	<input type="text" name="latitudine"  />
	<label for="date">Longitudine:</label>
	<input type="text" name="longitudine" style ="margin-bottom:20px"/>
    <button id=generator type="submit" style ="margin-bottom:10px">CREA SCUOLA</button>
</form>

</section>
</div>
</div>



<div class="row" style="margin-top:0px">
<div class="col-12" style="padding-top:50px">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>CREA ACCOUNT</h2>
			</header>

<form action="/myadmincreate">
<label for="date">Numero studenti:</label>
	<input type="number" name ="accDaGenerare" placeholder="0" 
		style ="margin-bottom:10px;
		-webkit-appearance: none;
		display: block;
		border: 0;
		padding: 0.75em 1em;
		font-size: 1em;
		border-radius: 5px;
		border: solid 1px #dddddd;
		background: #fff;
		width: 100%;" > 
		
<label for="date">Scuola:</label>
	<select name="scuola" style ="margin-bottom:20px">
	<% MyAdmin myAdm = new MyAdmin ();
		ArrayList <String> lista = myAdm.queryScuole();
		for(int i = 0; i<lista.size(); i++){
	%>
		  <option value="<%=lista.get(i)%>"><%=lista.get(i)%></option>
		  
	 <%} %>
	</select>
	
    <button type="submit" style ="margin-bottom:10px">CREA ACCOUNT</button>
</form>
</section>
</div>
</div>



<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>CARICA CSV EVENTI</h2>
			</header>

<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" multiple/>
    <input type="submit" style ="margin-bottom:10px" />
</form>

</section>
</div>

</div>


<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>CARICA foto su MAPPA</h2>
			</header>
<form action="/uploadimg" method="post" enctype="multipart/form-data">
    <input type="file" name="file" accept="image/*"multiple/>
    <input type="submit" style ="margin-bottom:10px"/>
</form>

</section>
</div>
</div>



<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>ELIMINA ACCOUNT</h2>
			</header>

<form action="/deleteAcc" method="get" enctype="multipart/form-data">
	<label for="date">username</label>
	<input type="text" name="username" style ="margin-bottom:10px"/>
	
    <input type="submit" style ="margin-bottom:10px" />
    
</form>
</section>
</div>
</div>


<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>ELIMINA SCUOLA E RELATIVI ACCOUNT</h2>
			</header>

<form action="/deleteScu" method="get" enctype="multipart/form-data" >
	<select name="scuola" style ="margin-bottom:10px">
    <% 
		ArrayList <String> listaScu = myAdm.queryScuole();
		for(int i = 0; i<listaScu.size(); i++){
	%>
		  <option value="<%=listaScu.get(i)%>"><%=listaScu.get(i)%></option>
	
	 <%} %>	
	</select>
    <input type="submit" style ="margin-bottom:10px"/>
    
</form>
</section>
</div>
</div>



<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>ELIMINA EVENTI</h2>
			</header>

<form action="/deleteEve" method="get" enctype="multipart/form-data">
		
		
	<select name="evento" style ="margin-bottom:10px">
    <% 
		ArrayList <String> listaEve = myAdm.queryEventi();
		for(int i = 0; i<listaEve.size(); i++){
	%>
		  <option value="<%=listaEve.get(i)%>"><%=listaEve.get(i)%></option>
	
	 <%} %>	
	</select>
    <input type="submit" style ="margin-bottom:10px"/>
    
</form>
</section>
</div>
</div>


<div class="row" style="margin-top:0px">
<div class="col-12">

	<!-- Portfolio -->
		<section>
			<header class="major">
				<h2>MODIFICA EVENTI</h2>
			</header>

<form>
	<select id="listaEvento" name="evento" style ="margin-bottom:10px">
    <% 
		ArrayList <String> listaEve2 = myAdm.queryEventi();
		for(int i = 0; i<listaEve2.size(); i++){
	%>
		  <option id="<%=i%>" value="<%=listaEve2.get(i)%>"><%=listaEve2.get(i)%></option>
	 
	 <%} %>	
	</select>
	
</form>	 

    <button onclick="myFunction()" style ="margin-bottom:60px">Click me</button>
    
    
    <form action="/modifyEve">
    <div class="row" style="margin-bottom:60px">
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
		    <label for="date">Titolo:</label>
			<input id="el1" type="text" name="titolo" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Anno Scolastico:</label>
			<input id="el2" type="text" name="as" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Scuola:</label>
			<input id="el3" type="text" name="scuola" disabled/>
		</div>
		</div>
	<div class="row" style="margin-bottom:60px">
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Comune:</label>
			<input id="el4" type="text" name="comune" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">	
		    <label for="date">Via:</label>
			<input id="el5" type="text" name="via" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">	
			<label for="date">Grado:</label>
			<input id="el6" type="text" name="grado" disabled/>
		</div>
	</div>
	<div class="row" style="margin-bottom:60px">
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Periodo da:</label>
			<input id="el7" type="text" name="periodo_da" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Periodo a:</label>
			<input id="el8" type="text" name="periodo_a" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
		    <label for="date">Soggetto:</label>
			<input id="el9" type="text" name="soggetto" disabled/>
		</div>
	</div>
	<div class="row" style="margin-bottom:60px">
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">N ore:</label>
			<input id="el10" type="text" name="n_ore" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
		    <label for="date">N studenti:</label>
			<input id="el11" type="text" name="n_studenti" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
			<label for="date">Eta da:</label>
			<input id="el12" type="text" name="eta_da" disabled/>
		</div>
	</div>
	<div class="row" style="margin-bottom:10px">
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
		    <label for="date">Eta a:</label>
			<input id="el13" type="text" name="eta_a" disabled/>
		</div>
		<div class="col-4 col-6-medium col-12-small" style ="padding-top:0px">
		    <label for="date">Keywords:</label>
			<input id="el14" type="text" name="keywords" disabled/>
		</div>
	</div>
		<input type="submit" value="Modifica Evento">
    </form>
 
 </section>
 </div>
 </div>
 
 </div>
 </section>
 
 
    <script>
     
    function myFunction() {
    	 // document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
    	document.getElementById("el1").disabled = false;
    	document.getElementById("el2").disabled = false;
	    document.getElementById("el3").disabled = false;
	    document.getElementById("el4").disabled = false;
	    document.getElementById("el5").disabled = false;
	    document.getElementById("el6").disabled = false;
	    document.getElementById("el7").disabled = false;
	    document.getElementById("el8").disabled = false;
	    document.getElementById("el9").disabled = false;
	    document.getElementById("el10").disabled = false;
	    document.getElementById("el11").disabled = false;
	    document.getElementById("el12").disabled = false;
	    document.getElementById("el13").disabled = false;
	    document.getElementById("el14").disabled = false;
    	 
	    
	  	var e = document.getElementById("listaEvento");
	    var strEven = e.value;
	    console.log(strEven);  
    	var titolo = strEven.substr(0,strEven.lastIndexOf("(")-1).trim();
	    console.log(titolo);
	   	var as = strEven.substr(strEven.lastIndexOf("(")+1).trim();
	   	as = as.slice(0, -1);
	   	console.log(as);
    	
    	<% List<Entity> eventi = myAdm.getEventData();
    	System.out.println(eventi);
	    %>
	 
	    <%for (int i = 0; i<eventi.size(); i++){ %>
	    		if((titolo == "<%=eventi.get(i).getProperty("titolo").toString().trim()%>")
	    			&& (as =="<%=eventi.get(i).getProperty("as").toString().trim()%>")) {
	    			console.log("TROVATO");
	    			document.getElementById("el1").value = "<%=eventi.get(i).getProperty("titolo").toString()%>";
	    			document.getElementById("el2").value = "<%=eventi.get(i).getProperty("as").toString()%>";
	    		    document.getElementById("el3").value = "<%=eventi.get(i).getProperty("scuola").toString()%>";
	    		    document.getElementById("el4").value = "<%=eventi.get(i).getProperty("comune").toString()%>";
	    		    document.getElementById("el5").value = "<%=eventi.get(i).getProperty("via").toString()%>";
	    		    document.getElementById("el6").value = "<%=eventi.get(i).getProperty("grado").toString()%>";
	    		    document.getElementById("el7").value = "<%=eventi.get(i).getProperty("periodo_da").toString()%>";
	    		    document.getElementById("el8").value = "<%=eventi.get(i).getProperty("periodo_a").toString()%>";
	    		    document.getElementById("el9").value = "<%=eventi.get(i).getProperty("soggetto").toString()%>";
	    		    document.getElementById("el10").value = "<%=eventi.get(i).getProperty("n_ore").toString()%>";
	    		    document.getElementById("el11").value = "<%=eventi.get(i).getProperty("n_studenti").toString()%>";
	    		    document.getElementById("el12").value = "<%=eventi.get(i).getProperty("eta_da").toString()%>";
	    		    document.getElementById("el13").value = "<%=eventi.get(i).getProperty("eta_a").toString()%>";
	    		    document.getElementById("el14").value = "<%=eventi.get(i).getProperty("chiave").toString()%>";
	    		}
	    <%}%>
    }
	</script>
    
    </div>
    
    
</body>
</html>
