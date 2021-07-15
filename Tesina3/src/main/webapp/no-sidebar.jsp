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
max-width:400px;
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
          <body class="no-sidebar is-preload">
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
                                                                                <li><a href="right-sidebar.jsp">Grafici</a></li>
                                                                                <li class="current"><a href="no-sidebar.jsp">Filtro</a></li>
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
 
                                                            <!-- Content -->
                                                                      <article class="box post">
                                                                                <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                                                                                <header>
                                                                                          <h2>Cerca evento:</h2>
                                                                                          <p>Filtra il pool di eventi secondo le specifiche sotto riportate</p>
                                                                                </header>
                                                                               
<% MyAdmin mAd = new MyAdmin ();
                              List <Entity> listaEve = mAd.getEventData();
                              ArrayList <String> titoloDd = new ArrayList <String> ();
                              ArrayList <String> asDd = new ArrayList <String> ();
                              ArrayList <String> scuolaDd = new ArrayList <String> ();
                              ArrayList <String> comuneDd = new ArrayList <String> ();
                              ArrayList <String> gradoDd = new ArrayList <String> ();
                              ArrayList <String> periododaDd = new ArrayList <String> ();
                              ArrayList <String> periodoaDd = new ArrayList <String> ();
                              ArrayList <String> soggettoDd = new ArrayList <String> ();
                              ArrayList <String> keywordsDd = new ArrayList <String> ();
                             
                              for(int i = 0; i<listaEve.size(); i++){
                                        if(titoloDd.contains(listaEve.get(i).getProperty("titolo").toString())){       
                                        }else{titoloDd.add(listaEve.get(i).getProperty("titolo").toString());}
        
                                        if(asDd.contains(listaEve.get(i).getProperty("as").toString())){
                                        }else{asDd.add(listaEve.get(i).getProperty("as").toString());}
                                      
                                        if(scuolaDd.contains(listaEve.get(i).getProperty("scuola").toString())){
                                        }else{scuolaDd.add(listaEve.get(i).getProperty("scuola").toString());}
                                      
                                        if(comuneDd.contains(listaEve.get(i).getProperty("comune").toString())){
                                        }else{comuneDd.add(listaEve.get(i).getProperty("comune").toString());}
                                      
                                        if(gradoDd.contains(listaEve.get(i).getProperty("grado").toString())){
                                        }else{gradoDd.add(listaEve.get(i).getProperty("grado").toString());}
                                      
                                        if(periododaDd.contains(listaEve.get(i).getProperty("periodo_da").toString())){
                                        }else{periododaDd.add(listaEve.get(i).getProperty("periodo_da").toString());}
                                      
                                        if(periodoaDd.contains(listaEve.get(i).getProperty("periodo_a").toString())){
                                        }else{periodoaDd.add(listaEve.get(i).getProperty("periodo_a").toString());}
                                      
                                        if(soggettoDd.contains(listaEve.get(i).getProperty("soggetto").toString())){
                                        }else{soggettoDd.add(listaEve.get(i).getProperty("soggetto").toString());}
                                      
                                        if(keywordsDd.contains(listaEve.get(i).getProperty("chiave").toString())){
                                        }else{keywordsDd.add(listaEve.get(i).getProperty("chiave").toString());}
                              }
                            
                             
%>
 
                    <p>
                       <label for="date">Titolo</label>
                              <select id="fTitolo">
                              <%
                              Collections.sort(titoloDd); titoloDd.add(0,"---");
                              for(int i = 0; i<titoloDd.size(); i++){
                              %>
                              <option value="<%=titoloDd.get(i)%>"><%=titoloDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                       <label for="date">Anno Scolastico</label>
                              <select id="fAs">
                              <%
                              Collections.sort(asDd); asDd.add(0,"---");
                              for(int i = 0; i<asDd.size(); i++){
                              %>
                              <option value="<%=asDd.get(i)%>"><%=asDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                       <label for="date">Scuola</label>
                              <select id="fScuola">
                              <%
                              Collections.sort(scuolaDd); scuolaDd.add(0,"---");
                              for(int i = 0; i<scuolaDd.size(); i++){
                              %>
                              <option value="<%=scuolaDd.get(i)%>"><%=scuolaDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                       <label for="date">Comune</label>
                              <select id="fComune">
                              <%
                              Collections.sort(comuneDd); comuneDd.add(0,"---");
                              for(int i = 0; i<comuneDd.size(); i++){
                              %>
                              <option value="<%=comuneDd.get(i)%>"><%=comuneDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                       <label for="date">Grado</label>
                              <select id="fGrado">
                              <%
                              Collections.sort(gradoDd); gradoDd.add(0,"---");
                              for(int i = 0; i<gradoDd.size(); i++){
                              %>
                              <option value="<%=gradoDd.get(i)%>"><%=gradoDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                       <label for="date">Periodo da</label>
                              <select id="fPeriodoDa">
                              <%
                              Collections.sort(periododaDd); periododaDd.add(0,"---");
                              for(int i = 0; i<periododaDd.size(); i++){
                              %>
                              <option value="<%=periododaDd.get(i)%>"><%=periododaDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                   
                    <p>
                      <label for="date">Periodo a</label>
                              <select id="fPeriodoA">
                              <%
                              Collections.sort(periodoaDd); periodoaDd.add(0,"---");
                              for(int i = 0; i<periodoaDd.size(); i++){
                              %>
                              <option value="<%=periodoaDd.get(i)%>"><%=periodoaDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                  
                    <p>
                       <label for="date">Soggetto</label>
                              <select id="fSoggetto">
                              <%
                              Collections.sort(soggettoDd); soggettoDd.add(0,"---");
                              for(int i = 0; i<soggettoDd.size(); i++){
                              %>
                              <option value="<%=soggettoDd.get(i)%>"><%=soggettoDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                  
                    <p>
                       <label for="date">Keywords</label>
                              <select id="fChiave">
                              <%
                              Collections.sort(keywordsDd); keywordsDd.add(0,"---");
                              for(int i = 0; i<keywordsDd.size(); i++){
                              %>
                              <option value="<%=keywordsDd.get(i)%>"><%=keywordsDd.get(i)%></option>
                              <%
                              }
                              %>
                              </select>
                    </p>
                  
 
    
     <button onclick="Nascondi()">Filtra!</button>
          <button onClick="window.location.reload();">Reset filtro</button>
    <h3>Risultati filtro:</h3>
    <table style="border:1px solid black" id="mytable">
    <tr>
          <th>Titolo</th>
          <th>Anno Scolastico</th>
          <th>Scuola</th>
          <th>Comune</th>
          <th>Grado</th>
          <th>Periodo da</th>
          <th>Periodo a</th>
          <th>Soggetto</th>
          <th>Keywords</th>
    </tr>
  
                    <% MyAdmin mA = new MyAdmin ();
                              List <Entity> listaEventi = mA.getEventData();
                              for(int i = 0; i<listaEventi.size(); i++){
                                        %>
                    <tr id="<%=i%>" style="block; border:1px solid black">           
                    <td id="rTitolo<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("titolo").toString() %></td>
                   <td id="rAs<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("as").toString() %></td>
                   <td id="rScuola<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("scuola").toString() %></td>
                   <td id="rComune<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("comune").toString() %></td>
                  <td id="rGrado<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("grado").toString() %></td>
                   <td id="rPeriodoDa<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("periodo_da").toString() %></td>
                   <td id="rPeriodoA<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("periodo_a").toString() %></td>
                   <td id="rSoggetto<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("soggetto").toString() %></td>
                   <td id="rChiave<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("chiave").toString() %></td>
                   </tr>
                                        <%
                    }
                    %>
        
          </table>
                                                                               
                                                                                <p>
                                                                                          La tabella mostra tutti gli eventi presenti nel databaase, utilizzando i menù a tendina è possiile filtrare i risultati
                                                                                          in tutti le categorie e gli aspetti possibili.
                                                                                          </p>
                                                                                <section>
                                                                                          <header>
                                                                                                    <h3>Correlazione tabella-mappa</h3>
                                                                                          </header>
                                                                                          <p>
                                                                                          Attraverso i filtri presenti ad inizio pagina è possibile modificare, oltre alla tabella, anche la mappa in modo tale da
                                                                                          mostrare su di essa solamente le località nelle quali sono presenti gli eventi corretti.
                                                                                                    </p>
                                                                                          <p>
                                                                                                   
                                                                                          </p>
                                                                                          <div id="mapidV"></div>
                                                                                </section>
                                                                               
                                                                      </article>
 
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
 
<script>
function Nascondi() {
    if(document.getElementById("fTitolo").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rTitolo"+i).innerHTML == document.getElementById("fTitolo").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fAs").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rAs"+i).innerHTML == document.getElementById("fAs").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fScuola").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rScuola"+i).innerHTML == document.getElementById("fScuola").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fComune").value != "---"){
             for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rComune"+i).innerHTML == document.getElementById("fComune").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fGrado").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rGrado"+i).innerHTML == document.getElementById("fGrado").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fPeriodoDa").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rPeriodoDa"+i).innerHTML == document.getElementById("fPeriodoDa").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fPeriodoA").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rPeriodoA"+i).innerHTML == document.getElementById("fPeriodoA").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fSoggetto").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rSoggetto"+i).innerHTML == document.getElementById("fSoggetto").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
    if(document.getElementById("fChiave").value != "---"){
              for(let i = 0; i<<%=listaEventi.size()%>; i++){
                        if(document.getElementById("rChiave"+i).innerHTML == document.getElementById("fChiave").value){
                        }else{document.getElementById(i).style.display = "none";}
              }
    }
   
    
    var array = [];
    var NomLatLonS = [];
   
   for(let i = 0; i<<%=listaEventi.size()%>;i++){
          if(document.getElementById(i).style.display != "none"){
                    <%System.out.println("cacca");%>
                    array.push(document.getElementById("rScuola"+i).innerHTML);
          }
   }
         
         
          var arrayScuoleSel = [];
          for(let i = 0; i<array.length; i++){
                    if(!arrayScuoleSel.includes(array[i])){   
                              arrayScuoleSel.push (array[i]);
                    }
          }
         
         
                              <%for(String j:scuoleCord.keySet()){%>
                                        NomLatLonS.push([["<%=j%>"],[<%=scuoleCord.get(j).get(0)%>],[<%=scuoleCord.get(j).get(1)%>]]);
                              <%}%>
                   
          console.log(NomLatLonS);
         
           
 
         
                    for(let j=0; j<NomLatLonS.length;j++){
                              for(let i = 0; i<arrayScuoleSel.length; i++){
                              if(arrayScuoleSel[i]==NomLatLonS[j][0]){
                                        console.log(NomLatLonS[j][1]);
                    var m=L.marker([ parseFloat(NomLatLonS[j][1]), parseFloat(NomLatLonS[j][2])],{icon:redIcon}).addTo(mymapV);
                        m.bindPopup(arrayScuoleSel[i]);
                              }
          }
          }
}
</script>
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
var mymapV = L.map('mapidV').setView([44.781811, 10.854439], 14);
L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
          attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
         
 }).addTo(mymapV);
 
</script>
          </body>
</html>