<html>
<head>

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
<%@page import="java.util.List"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/leaflet@1.3.0/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
<script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>


<style>
#mapidS { height: 500px; }
#mapidE { height: 500px; }  

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
background-color:#D3D3D3;
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
<body>

<h1>Mappa Scuole</h1>
<div id="mapidS"></div>
<h1>-----------------------------------------------------------</h1>
<h1>Mappa Eventi</h1>
<div id="mapidE"></div>
<div class="buttonBox">
<ul>
<li><a class="btn blue" onclick='changeMap1()'>droghe/alcol</a></li>
<li><a class="btn blue" onclick='changeMap2()'>razzismo</a></li>
<li><a class="btn blue" onclick='changeMap3()'>bullismo/cyberbullismo</a></li>
<li><a class="btn blue" onclick='changeMap4()'>relazioni/emozioni</a></li>
<li><a class="btn blue" onclick='changeMap5()'>legalita</a></li>
</ul>
</div>
<h1>-----------------------------------------------------------</h1>
				
<h1>Graph1:</h1>
<canvas id="myChart"></canvas>
<div class="buttonBox">
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
<li><a class="btn blue" onclick="changeChart([<%=contRa%>, <%=contRE%>, <%=contLe%>, <%=contDA%>, <%=contBC%>])"><%=lista.get(k) %></a><%} %>
</ul>
</div>
<h1>-----------------------------------------------------------</h1>
<h1>Graph2:</h1>
<canvas id="myChart2"></canvas>
</body>
<h1>-----------------------------------------------------------</h1>
<h1>Graph3:</h1>
<div id="calendar_basic" style="width: 1000px; height: 350px;"></div>
<div class="buttonBox">
<ul>
<li><a class="btn blue" onclick='drawChart1()'>droghe/alcol</a></li>
<li><a class="btn blue" onclick='drawChart2()'>razzismo</a></li>
<li><a class="btn blue" onclick='drawChart3()'>bullismo/cyberbullismo</a></li>
<li><a class="btn blue" onclick='drawChart4()'>relazioni/emozioni</a></li>
<li><a class="btn blue" onclick='drawChart5()'>legalita</a></li>
</ul>

<h1>-----------------------------------------------------------</h1>
<h1>Cerca evento:</h1>
<% MyAdmin mAd = new MyAdmin ();
			List <Entity> listaEve = mAd.getEventData();
			ArrayList <String> titoloDd = new ArrayList <String> (); titoloDd.add("---");
			ArrayList <String> asDd = new ArrayList <String> (); asDd.add("---");
			ArrayList <String> scuolaDd = new ArrayList <String> (); scuolaDd.add("---");
			ArrayList <String> comuneDd = new ArrayList <String> (); comuneDd.add("---");
			ArrayList <String> gradoDd = new ArrayList <String> (); gradoDd.add("---");
			ArrayList <String> periododaDd = new ArrayList <String> (); periododaDd.add("---");
			ArrayList <String> periodoaDd = new ArrayList <String> (); periodoaDd.add("---");
			ArrayList <String> soggettoDd = new ArrayList <String> (); soggettoDd.add("---");
			ArrayList <String> keywordsDd = new ArrayList <String> (); keywordsDd.add("---");
			
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
    <table style="border:1px solid black">
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
	 	<td id="rComune<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("comune").toString() %> 	</td>
	 	<td id="rGrado<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("grado").toString() %> 	</td>
	 	<td id="rPeriodoDa<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("periodo_da").toString() %></td>
	 	<td id="rPeriodoA<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("periodo_a").toString() %></td>
	 	<td id="rSoggetto<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("soggetto").toString() %></td>
	 	<td id="rChiave<%=i%>" style="border:1px solid black"><%=listaEventi.get(i).getProperty("chiave").toString() %></td>
	 	</tr>
				<%
		}
		%>
	
	</table>
	
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 



 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
 
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
 }
 

 
 
 
 var mymap = L.map('mapidS').setView([44.781811, 10.854439], 14);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
	 attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
	 
 }).addTo(mymap);
 L.Control.geocoder().addTo(mymap);
 
 
 
 <%for(String i:scuoleCord.keySet()){%>
 
 
 var m=L.marker([<%=scuoleCord.get(i).get(0)%>,<%=scuoleCord.get(i).get(1)%>]).addTo(mymap);
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
			backgroundColor:['brown','pink','green','yellow','blue']
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
				var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>]).addTo(layerGroup);
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
					
					<h7><h3>Evento su:</h3>Droghe/Alcol   </h7>
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
		
<%	for(int i=0; i<chiaviCord.get(a).size();i++){
			for(int j=0; j<chiaviCord.get(a).get(i).size();j++){%>
				var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>]).addTo(layerGroup);
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
			
		<%	for(int i=0; i<chiaviCord.get(a).size();i++){
			for(int j=0; j<chiaviCord.get(a).get(i).size();j++){%>
				
			
			var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>]).addTo(layerGroup);
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
				var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>]).addTo(layerGroup);
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
	<%	if(a.equals("legalita")){
	for(int i=0; i<chiaviCord.get(a).size();i++){
	
			for(int j=0; j<chiaviCord.get(a).get(i).size();j++){
			%>
			
				var marker=L.marker([<%=chiaviCord.get(a).get(i).get(0)%>,<%=chiaviCord.get(a).get(i).get(1)%>]).addTo(layerGroup);
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
 <script>
 var ctx=document.getElementById("myChart").getContext('2d');
 var myChart1=new Chart(ctx, {
	type:'doughnut',
	data:{
		labels:['razzismo','relazioni/emozioni','legalita','droghe/alcol','bullismo/cyberbullismo'],
		datasets:[{
			data:[0,0,0,0,0],
			backgroundColor:['brown','pink','green','yellow','blue']
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
</html>
