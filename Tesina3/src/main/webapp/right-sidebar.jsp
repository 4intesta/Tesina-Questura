<!DOCTYPE HTML>
<!--
Dopetrope by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Home</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />


 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
 <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
<%@page import="Tiw.Tesina3.Generale" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@page import="Tiw.Tesina3.MyAdmin" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List" %>
<%@page import="com.google.appengine.api.datastore.Entity" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/leaflet@1.3.0/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
<script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>


<style>
#mapidS { height: 500px; }
#mapidE { height: 500px; }  
#mapidV { height: 500px; } 
.buttonBox{
max-width:500px;
}
.buttonBox ul{
display:flex;
}
.buttonBox ul li{
list-style:none;
}
.btn {
border-radius:20px;
text-decoration:none;
padding: 5px 10px;
margin-right: 5px;
background-color:#2F2F2F;
}
</style>
<% Generale g=new Generale(); 
HashMap<String,ArrayList<String>>chiaviCordfattemalino=g.chiaviCordfattemalino();
HashMap<String,ArrayList<ArrayList<String>>>chiaviCord=g.chiaviCord();
HashMap<String,ArrayList<String>>scuoleCord=g.CordScuole();
HashMap<String,ArrayList<String>>scuoleEv=g.ScuoleEv();
HashMap<String,ArrayList<ArrayList<String>>>dateEv=g.dateEv();
System.out.println(scuoleCord);
//System.out.println(scuoleEv);

%>


</head>
<body class="right-sidebar is-preload">
<div id="page-wrapper">

<!-- Header -->
<section id="header">

<!-- Logo -->
<h1><a href="home.jsp">Area Personale</a></h1>

<!-- Nav -->
<nav id="nav">
<ul>
<li><a href="home.jsp">Home</a></li>

<li><a href="left-sidebar.jsp">Mappe</a></li>
<li class="current"><a href="right-sidebar.jsp">Grafici</a></li>
<li><a href="no-sidebar.jsp">Filtro</a></li>
<li>
<a>Logout</a>
<ul>
<li>
<a>Esci da Area Personale</a>
<ul>
<li><a href="login.jsp">Torna alla pagina di Login</a></li>
<li><a href="loginAdmin.jsp">Torna alla pagina di Login Admin</a></li>

</ul>
</li>
</ul>
</li>
</ul>
</nav>

</section>

<!-- Main -->
<section id="main">
<div class="container">
<div class="row">
<div class="col-8 col-12-medium">

<!-- Content -->
<article class="box post">
<header>
<h2>Grafico a torta</h2>
<p></p>
</header>
<p>

</p>
<p>
Nella sezione sottostante è possibile selezionare una tra le sedi organizzatrici,
il grafico che verrà visualizzato mostra dinamicamente tutti gli eventi che si terranno nella sede di riferimento.


</p>

<canvas id="myChart"></canvas>
<div class="buttonBox" style="margin-top:10px">
<ul>
<%
MyAdmin myAdm = new MyAdmin ();
ArrayList <String> lista = myAdm.queryScuole();
for(int k = 0; k<lista.size(); k++){

%>
<%
int contRa=0;
int contRE=0;
int contLe=0;
int contDA=0;
int contBC=0;
for(String a:scuoleEv.keySet()){
if(a.equals(lista.get(k))){
for(int m=0; m<scuoleEv.get(a).size();m++){
if(scuoleEv.get(a).get(m).equals("razzismo"))contRa++;
if(scuoleEv.get(a).get(m).equals("relazioni/emozioni"))contRE++;
if(scuoleEv.get(a).get(m).equals("legalita"))contLe++;
if(scuoleEv.get(a).get(m).equals("bullismo/cyberbullismo"))contBC++;
if(scuoleEv.get(a).get(m).equals("droghe/alcol"))contDA++;
}
} 
}
%>
<li><a class="btn blue" onclick="changeChart([<%=contRa%>, <%=contRE%>, <%=contLe%>, <%=contDA%>, <%=contBC%>])" style="color:white"><%=lista.get(k) %></a><%} %>
</ul>
</div>
<section>
<header>
<h3>Istogramma</h3>
</header>
<p>

</p>
<p>
Nel istogramma si può controllare il numero di eventi totale organizzato per ogni macro-argomento nella totalità
delle sedi.
</p>
</section>
<canvas id="myChart2"></canvas>
</body> 


</article>

</div>
<div class="col-4 col-12-medium">

<!-- Sidebar -->
<section class="box">
<a href="#" class="image featured"><img src="images/images.jpg" alt="" /></a>
<header>
<h3>Grafici</h3>
</header>
<p>
Un grafico è una rappresentazione di dati sotto forma di diagramma, schema, mappa o formato tabulare. Questo ne potrebbe rendere sottofamiglie le altre due famiglie, geospaziale e tabelle. Li distinguiamo per aiutarti a individuare quello migliore per i tuoi dati. 
</p>

</section>
<section class="box">
<header>
<h3>Grafico a torta</h3>
</header>
<p>
Una visualizzazione comune, ma limitata, utilizzata per mostrare il confronto di alcune dimensioni con un'altra e l'insieme.
</p>
</section>
<section class="box">
<header>
<h3>Istogramma</h3>
</header>
<p>
Utilizzato per categorizzare gli elementi sulla base della dimensione. Può essere ordinato o meno, in base alla natura delle dimensioni.
</p>
</section>
</div>
</div>
</div>
</section>

<!-- Footer -->
<section id="footer">
<div class="container">
<div class="row">

<div class="col-4 col-12-medium">
<section>
<header>
<h2>QUESTURA DI REGGIO EMILIA</h2>
</header>
<ul class="social">
<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
<li><a class="icon brands fa-tumblr" href="#"><span class="label">Tumblr</span></a></li>
<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
</ul>
<ul class="contact">
<li>
<h3>Indirizzo</h3>
<p>
Via Dante Alighieri, 10<br />
42121 Reggio Emilia RE<br />
</p>
</li>
<li>
<h3>Mail</h3>
<p><a href="#">gab.quest.re@pecps.poliziadistato.it</a></p>
</li>
<li>
<h3>Telefono</h3>
<p>0522 458711</p>
</li>
</ul>
</section>
</div>
<div class="col-4 col-12-medium">
<section>
<header>
<h2>UNIVERSITÀ DI MODENA E REGGIO EMILIA</h2>

</header>
<ul class="social">
<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
<li><a class="icon brands fa-tumblr" href="#"><span class="label">Tumblr</span></a></li>
<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
</ul>
<ul class="contact">
<li>
<h3>Indirizzo</h3>
<p>
<b>Sede di Modena</b> <br />Via Università, 4
41121, Modena MO<br />
</p>
<p>
<b>Sede di Reggio Emilia</b> <br />Viale A. Allegri 9
42121, Reggio Emilia RE<br />
</p>
</li>
<li>
<h3>Mail</h3>
<p><a href="#">urp@unimore.it</a></p>
</li>
<li>
<h3>Telefono</h3>
<p><b>Sede di Modena</b> 059 2056511</p>
<p><b>Sede di Reggio Emilia</b> 0522 523041</p>
</li>
</ul>
</section>
</div>
<div class="col-4 col-12-medium">
<section>
<header>
<h2>Chi siamo?</h2>
</header>
<a href="#" class="image featured"><img src="images/unimore[2627].jpg" alt="" /></a>
<p>
Questo sito rappresenta il risultato di un progetto, commissionato dalla <strong>Questura di Reggio Emilia</strong>, che ha coinvolto cinque studenti del dipartimento di Scienze e Metodi dell'Ingegneria di <strong>Unimore</strong>.
Il progetto, coordinato dal Professor Marco Mamei, ha visto inoltre la collaborazione di alcuni studenti dell'Istituto Tecnico Scaruffi-Levi-Tricolore (RE), che hanno preso parte alla definizione della veste grafica del sito.
</p>
<footer>
<ul class="actions">
<li><a href="#" class="button">Find out more</a></li>
</ul>
</footer>
</section>
</div>



</div>
</div>
</section>
</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 



 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
 <script>
 var ctx=document.getElementById("myChart").getContext('2d');
 var myChart1=new Chart(ctx, {
type:'doughnut',
data:{
labels:['razzismo','relazioni/emozioni','legalita','droghe/alcol','bullismo/cyberbullismo'],
datasets:[{
data:[0,0,0,0,0],
backgroundColor:['#C0C0C0','#A2A2A2','#808080','#4F4F4F','#2F2F2F']
}] 
 },
 options:{
title:{
text:"Eventi Organizzati",
display:true
}
 }
 });
 
 function changeChart(data){
myChart1.data.datasets[0].data=data;
myChart1.update();
 }
 </script>
 <script>
 
 
 <%int cont=0;
 %>

 var chart2=new Chart(myChart2, {
type:'bar',
data:{
labels:['razzismo','relazioni/emozioni','legalita','droghe/alcol','bullismo/cyberbullismo'],
datasets:[
<%for(String a:scuoleEv.keySet()){
int contRa=0;
int contRE=0;
int contLe=0;
int contDA=0;
int contBC=0;
if(cont<scuoleEv.size()-1){
%>{ 
label:'<%=a%>',
<%for(int i=0; i<scuoleEv.get(a).size();i++){
if(scuoleEv.get(a).get(i).equals("razzismo"))contRa++;
if(scuoleEv.get(a).get(i).equals("relazioni/emozioni"))contRE++;
if(scuoleEv.get(a).get(i).equals("legalita"))contLe++;
if(scuoleEv.get(a).get(i).equals("bullismo/cyberbullismo"))contBC++;
if(scuoleEv.get(a).get(i).equals("droghe/alcol"))contDA++;
}%>
data:[<%=contRa%>,<%=contRE%>,<%=contLe%>,<%=contDA%>,<%=contBC%>],
backgroundColor:"#"+((1<<24)*Math.random()|0).toString(16)
}, <%}%>
<%if(cont==scuoleEv.size()-1){%>{
label:'<%=a%>',
<%for(int i=0; i<scuoleEv.get(a).size();i++){
if(scuoleEv.get(a).get(i).equals("razzismo"))contRa++;
if(scuoleEv.get(a).get(i).equals("relazioni/emozioni"))contRE++;
if(scuoleEv.get(a).get(i).equals("legalita"))contLe++;
if(scuoleEv.get(a).get(i).equals("bullismo/cyberbullismo"))contBC++;
if(scuoleEv.get(a).get(i).equals("droghe/alcol"))contDA++;
}%>
data:[<%=contRa%>,<%=contRE%>,<%=contLe%>,<%=contDA%>,<%=contBC%>],
backgroundColor:"#"+((1<<24)*Math.random()|0).toString(16)
<%}%>
<%cont++;}%>
}] 
},
options:{

scales:{
xAxes:[{
stacked:true,
}],
yAxes:[{
stacked:true,
}]
}
}

 });
 </script>
</body>
</html>