
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
<% Generale g=new Generale(); 
ArrayList<String>longi = g.longScuole();
ArrayList<String>lati = g.latScuole();
HashMap<String,ArrayList<String>>chiaviCord=g.chiaviCord();
for(String i:chiaviCord.keySet()){
	String[]f=i.split("ç");
	System.out.println(f[1]);
if(f[1].equals("legalità")){
	System.out.println("ok");
}
}


%>

   <style>
   #mapidS { height: 500px; }
   #mapidE { height: 500px; }   
   </style>

</head>
<body>
 <div id="mapidS"></div>
 <div id="mapidE"></div>

</body>
 <script>
 var mymap = L.map('mapidS').setView([44.781811, 10.854439], 14);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
	 attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
	 
 }).addTo(mymap);

<%for(int k=0; k<lati.size();k++){%>

var circle= L.circle([<%= lati.get(k)%>,<%= longi.get(k)%>],{
color:'red',
fillColor:'#f03',
radius:1000
}).addTo(mymap);
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
<%if(f[1].equals("relazioni/emozioni")){%>
var circle= L.circle([<%= chiaviCord.get(i).get(0)%>,<%= chiaviCord.get(i).get(1)%>],{
	color:'blue',
	fillColor:'#ADD8E6',
	radius:400
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
	color:'black',
	fillColor:'#696969',
	radius:600
	}).addTo(mymap2);	
<%}%>
<%}%>
 
 </script>
</html>

