
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

<% Generale g=new Generale(); 
ArrayList<String>longi = g.longScuole();
ArrayList<String>lati = g.latScuole();


System.out.println(lati);
System.out.println(longi);

%>

   <style>
   #mapid { height: 1000px; }
   </style>

</head>
<body>
 <div id="mapid"></div>

</body>
 <script>


 var mymap = L.map('mapid').setView([44.781811, 10.854439], 14);
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
</html>

