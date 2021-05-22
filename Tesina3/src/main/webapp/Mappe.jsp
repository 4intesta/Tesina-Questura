
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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
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
HashMap<String,ArrayList<String>>chiaviCord=g.chiaviCord();
HashMap<String,ArrayList<String>>scuoleCord=g.CordScuole();
HashMap<String,ArrayList<String>>scuoleEv=g.ScuoleEv();




%>



</head>
<body>

<h1>Mappa Scuole</h1>
<div id="mapidS"></div>
<h1>-----------------------------------------------------------</h1>
<h1>Mappa Eventi</h1>
<div id="mapidE"></div>
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
				if(scuoleEv.get(a).get(m).equals("legalità"))contLe++;
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 

 <script>
 
 var mymap = L.map('mapidS').setView([44.781811, 10.854439], 14);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
	 attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
	 
 }).addTo(mymap);

 <%for(String i:scuoleCord.keySet()){%>

var marker= L.marker([<%= scuoleCord.get(i).get(0)%>,<%= scuoleCord.get(i).get(1)%>]).addTo(mymap);

<%}%>
</script>
<script>
 var mymap2 = L.map('mapidE').setView([44.781811, 10.854439], 14);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
	 attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
	 
 }).addTo(mymap2);

 <%for(String i:chiaviCord.keySet()){
		String[]f=i.split("ç");
	if(f[1].equals("legalità")){%>
	var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
		color:'green',
		fillColor:'#00FF00',
		radius:100
		}).addTo(mymap2);	
<%}%>
<%if(f[1].equals("razzismo")){%>
var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
	color:'brown',
	fillColor:'#CD853F',
	radius:200
	}).addTo(mymap2);	
<%}%>
<%if(f[1].equals("relazioni/emozioni")){%>
var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
	color:'pink',
	fillColor:'#ffb6c1',
	radius:300
	}).addTo(mymap2);	
<%}%>
<%if(f[1].equals("droghe/alcol")){%>
var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
	color:'yellow',
	fillColor:'#FFFF99',
	radius:500
	}).addTo(mymap2);	
<%}%>
<%if(f[1].equals("bullismo/cyberbullismo")){%>
var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
	color:'blue',
	fillColor:'#696969',
	radius:600
	}).addTo(mymap2);	
<%}%>
<%}%>
 </script>
 <script>
 var ctx=document.getElementById("myChart").getContext('2d');
 var myChart1=new Chart(ctx, {
	type:'doughnut',
	data:{
		labels:['razzismo','relazioni/emozioni','legalita','droghe/alcol','bullismo/cyberbullismo'],
		datasets:[{
			data:[1,1,2,1,1],
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
					if(scuoleEv.get(a).get(i).equals("legalità"))contLe++;
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
				if(scuoleEv.get(a).get(i).equals("legalità"))contLe++;
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

