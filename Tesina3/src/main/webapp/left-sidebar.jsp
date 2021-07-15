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
max-width:900px;
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
<% 
Generale g=new Generale(); 
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

<li class="current"><a href="left-sidebar.jsp">Mappe</a></li>
<li><a href="right-sidebar.jsp">Grafici</a></li>
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
<h2>Selezionare un luogo</h2>

</header>
<div id="mapidS"></div>
<p></p>
<p>Su questa mappa è possibile visualizzare una serie di scuole, istituti e luoghi in cui è stato organizzato un evento. Cliccando su di essi è possibile esplorare un pie chart che mostra i diversi macro-argomenti trattati evidenziandone una corrrelazione nella loro frequenza.. 
</p>

<section>
<header>
<h3>Filtro Eventi</h3>
</header>
<div id="mapidE"></div>
<div class="buttonBox" style="margin-top:10px;color:white">
<ul>
<li><a class="btn blue" onclick='changeMap1()'style="color:white">droghe/alcol</a></li>
<li><a class="btn blue" onclick='changeMap2()'style="color:white">razzismo</a></li>
<li><a class="btn blue" onclick='changeMap3()'style="color:white">bullismo/cyberbullismo</a></li>
<li><a class="btn blue" onclick='changeMap4()'style="color:white">relazioni/emozioni</a></li>
<li><a class="btn blue" onclick='changeMap5()'style="color:white">legalita</a></li>
</ul>
</div>
<p>
</p>
<p>
Utilizzando i selettori presenti ai piedi della mappa è possibile eliminare da essa tutti i luoghi nei quali non sono organizzati eventi ad essi inerenti. 
I marker rimanenti indicano i luoghi nei quali sono in programma accadimenti futuri.
</p>
</section>

</article>

</div>
<div class="col-4 col-12-medium">

<!-- Sidebar -->
<section class="box">
<a href="#" class="image featured"><img src="images/mondo.jpg" alt="" /></a>
<header>
<h3>Geolocalizzazione</h3>
</header>
<p>
Individuazione geografica del luogo in cui si trova un oggetto attraverso apparecchiature in grado di trasmettere segnali a un satellite.
</p>
<footer>

</footer>
</section>
<section class="box">
<header>
<h3>Utilizzazione</h3>
</header>
<p>
I servizi di geolocalizzazione tramite reti cellulari vengono sempre più spesso utilizzati a posteriori dalle forze dell'ordine e giudiziarie nelle loro attività investigative[1] in casi criminosi grazie alle capacità di memorizzazione dei dati degli utenti (es. aggancio ad una cella) da parte del sistema oppure in casi di pubblica sicurezza o ricerca di persone scomparse.
</p>

<footer>
<a href="#" class="button alt">Refresh</a>
</footer>
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
 
 var redIcon = new L.Icon({
iconUrl: 'images/marker-icon-2x-red.png',
shadowUrl: 'images/marker-shadow.png',
iconSize: [25, 41],
iconAnchor: [12, 41],
popupAnchor: [1, -34],
shadowSize: [41, 41]
});
 
 
 </script>
 <script>
 
 var mymap = L.map('mapidS').setView([41.0000, 12.854439], 10);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'

 }).addTo(mymap);
 
 
 
 <%for(String i:scuoleCord.keySet()){%>
 
 

 var m=L.marker([<%=scuoleCord.get(i).get(0)%>,<%=scuoleCord.get(i).get(1)%>],{icon:redIcon}).addTo(mymap);
 <%
int contRa=0;
int contRE=0;
int contLe=0;
int contDA=0;
int contBC=0;
for(String a:scuoleEv.keySet()){
if(a.equals(i)){
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

var div_chart = $('<canvas id="myChartpop<%=i%>" width="1200" height="1200" ></canvas>');
var div_text = $('<div style="text-align: center"><h1><%=i%><h1></div>');
var div_main = $('<div></div>');
div_main.append(div_text);
div_main.append(div_chart);

m.bindPopup(div_main[0]);
m.openPopup();

var ctx=document.getElementById("myChartpop<%=i%>").getContext('2d');
var myChartpop=new Chart(ctx, {
type:'doughnut',
data:{
labels:['razzismo','relazioni/emozioni','legalita','droghe/alcol','bullismo/cyberbullismo'],
datasets:[{
data:[<%=contRa%>,<%=contRE%>,<%=contLe%>,<%=contDA%>,<%=contBC%>],
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

<%}%>




 </script>


<script>
var mymap2 = L.map('mapidE').setView([44.781811, 10.854439], 14);
L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'

}).addTo(mymap2)
var layerGroup=L.layerGroup().addTo(mymap2)

function changeMap1(){
layerGroup.clearLayers();
<%for(String a:chiaviCord.keySet()){
if(a.equals("droghe/alcol")){%>

<%for(int i=0; i<chiaviCord.get(a).size();i++){
for(int j=0; j<chiaviCord.get(a).get(i).size();j++){

%>
var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>],{icon:redIcon}).addTo(layerGroup);
<%for(String b:scuoleCord.keySet()){
if(scuoleCord.get(b).get(0).equals(chiaviCord.get(a).get(i).get(0))&&scuoleCord.get(b).get(1).equals(chiaviCord.get(a).get(i).get(1))){%>

var template=`
<div style="text-align: center">
<h1><%=b%></h1> 
<%
String name=b.replace(" ", "").replace(".","");
File file = new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+name+".png"); 
if(file.exists()){
String path="/Immagini/"+name+".png";

%>

<img width="150px" height="150px" src=<%=path%> />
<%}%>
</div>

                    <div style="text-align: center">

<h7><h6>Evento su:</h6>Droghe/Alcol   </h7>
<img width="40px" height="40px"src="https://img.icons8.com/ios-filled/50/000000/no-drugs.png"/>
</div>
`
marker.bindPopup(template);

<% 
}}}}
}
}%>
}
function changeMap2(){
layerGroup.clearLayers();
<%for(String a:chiaviCord.keySet()){
if(a.equals("razzismo")){%>

<% for(int i=0; i<chiaviCord.get(a).size();i++){
for(int j=0; j<chiaviCord.get(a).get(i).size();j++){%>
var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>],{icon:redIcon}).addTo(layerGroup);
<%for(String b:scuoleCord.keySet()){
if(scuoleCord.get(b).get(0).equals(chiaviCord.get(a).get(i).get(0))&&scuoleCord.get(b).get(1).equals(chiaviCord.get(a).get(i).get(1))){%>

var template=`
<div style="text-align: center">
<h1><%=b%></h1> 

<%
String name=b.replace(" ", "").replace(".","");
File file = new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+name+".png"); 
if(file.exists()){
String path="/Immagini/"+name+".png";

%>

<img width="150px" height="150px" src=<%=path%> />
<%}%>
</div>
<div style="text-align: center">

<h7><h3>Evento su:</h3>Razzismo   </h7>
<img width="40px" height="40px"src="https://img.icons8.com/ios-filled/64/000000/racism.png"/>
</div>
`
marker.bindPopup(template);
<% 
}}}}
}
}%>
}
function changeMap3(){
layerGroup.clearLayers();
<%for(String a:chiaviCord.keySet()){
if(a.equals("bullismo/cyberbullismo")){%>

<% for(int i=0; i<chiaviCord.get(a).size();i++){
for(int j=0; j<chiaviCord.get(a).get(i).size();j++){%>


var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>],{icon:redIcon}).addTo(layerGroup);
<%for(String b:scuoleCord.keySet()){
if(scuoleCord.get(b).get(0).equals(chiaviCord.get(a).get(i).get(0))&&scuoleCord.get(b).get(1).equals(chiaviCord.get(a).get(i).get(1))){%>
var template=`
<div style="text-align: center">
<h1><%=b%></h1> 
<%
String name=b.replace(" ", "").replace(".","");
File file = new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+name+".png"); 
if(file.exists()){
String path="/Immagini/"+name+".png";

%>

<img width="150px" height="150px" src=<%=path%> />
<%}%>
</div>
<div style="text-align: center">

<h7><h3>Evento su:</h3>Bullismo/CyberBullismo   </h7>

<img width="40px" height="40px"src="https://img.icons8.com/ios-filled/50/000000/pickpocket.png"/>
</div>
`
marker.bindPopup(template);
<% 
}}}}
}
}%>
}
function changeMap4(){
layerGroup.clearLayers();
<%for(String a:chiaviCord.keySet()){

if(a.equals("relazioni/emozioni")){%>
<%for(int i=0; i<chiaviCord.get(a).size();i++){
for(int j=0; j<chiaviCord.get(a).get(i).size();j++){
%>
var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>],{icon:redIcon}).addTo(layerGroup);
<%for(String b:scuoleCord.keySet()){
if(scuoleCord.get(b).get(0).equals(chiaviCord.get(a).get(i).get(0))&&scuoleCord.get(b).get(1).equals(chiaviCord.get(a).get(i).get(1))){%>

var template=`
<div style="text-align: center">
<h1><%=b%></h1> 
<%
String name=b.replace(" ", "").replace(".","");
File file = new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+name+".png"); 
if(file.exists()){
String path="/Immagini/"+name+".png";

%>

<img width="150px" height="150px" src=<%=path%> />
<%}%>
</div>
<div style="text-align: center">

<h7><h3>Evento su:</h3>Relazioni   </h7>

<img width="40px" height="40px"src="https://img.icons8.com/pastel-glyph/64/000000/trust--v2.png"/>
</div>
`
marker.bindPopup(template);
<% 
}}}}
}
}%>
}
function changeMap5(){
layerGroup.clearLayers();
<%
for(String a:chiaviCord.keySet()){

%> 
<% if(a.equals("legalita")){
for(int i=0; i<chiaviCord.get(a).size();i++){

for(int j=0; j<chiaviCord.get(a).get(i).size();j++){
%>

var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>],{icon:redIcon}).addTo(layerGroup);
<%
for(String b:scuoleCord.keySet()){
if(scuoleCord.get(b).get(0).equals(chiaviCord.get(a).get(i).get(0))&&scuoleCord.get(b).get(1).equals(chiaviCord.get(a).get(i).get(1))){
   %>
var template=`
<div style="text-align: center">
<h1><%=b%></h1> 
<%
String name=b.replace(" ", "").replace(".","");
File file = new File("/Users/darioferrari/git/Tesina-Questura4/Tesina3/src/main/webapp/Immagini/"+name+".png"); 
if(file.exists()){
String path="/Immagini/"+name+".png";

%>

<img width="150px" height="150px" src=<%=path%> />
<%}%>
</div>
<div style="text-align: center">

<h7><h3>Evento su:</h3>Legalità   </h7>

<img width="40px" height="40px"src="https://img.icons8.com/cotton/64/000000/courthouse.png"/>
</div>
`
marker.bindPopup(template);
<% 
}}}}
}
}%>
}
 </script>

</body>
</html>

