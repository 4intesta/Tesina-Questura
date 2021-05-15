
<title>Insert title here</title>
</head>
<body>
<button></button>
 <div id="mapid"></div>
 <script>
 var mymap = L.map('mapid').setView([44.781811, 10.854439], 14);
 L.tileLayer('https://api.maptiler.com/maps/toner/{z}/{x}/{y}.png?key=GYJ2vr5kpPhplU9c4Lja',{
	 attribution:'<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
	 
	 
	 
 }).addTo(mymap)
 var circle= L.circle(,).addTo(mymap);
 </script>
</body>
</html>	

		