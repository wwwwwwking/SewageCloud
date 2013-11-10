<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="com.es.sewage.status.model.SiteModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>监控站点</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false">
	
</script>

<%
	List<SiteModel> list = (List<SiteModel>) session.getAttribute("MONITORDATA");
%>

<script type="text/javascript">
	var map;
	function initialize() {
		var myLatlng = new google.maps.LatLng(31.4830000, 120.2670000);
		var mapOptions = {
			zoom : 12,
			center : myLatlng,
			mapTypeControl : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);

		var image_red = "http://www.google.cn/intl/en_us/mapfiles/ms/micons/red-dot.png";
		var image_blue = "http://www.google.cn/intl/en_us/mapfiles/ms/micons/blue-dot.png";
		
		<% 
		if (list != null) {
			for (int i = 0; i < list.size(); ++i) {
				SiteModel model = list.get(i);
		%>
			var latLng = new google.maps.LatLng(
				<%=model.getLat() %>,
				<%=model.getLng() %>,
				true
			);
			// placeMarker(latLng);
			var marker = new google.maps.Marker({
				position : latLng,
				map : map,
				icon : (<%=model.getAlarm() %> != 0 ? image_red : image_blue),
				title : '<%=model.getName() %>',
			});

			var info = '<div style="font-size:12px;">';
			info += '站点ID: <%=model.getId() %><br />';
			info += '站点名称：<%=model.getName() %><br />';
			<%
				for (int j = 0; j < model.getValues().size(); ++j) {
					if (model.getValues().get(j).key.toString() == "LS") {
			%>
					info += '<span style="color:#FF0000"><%=model.getValues().get(j).key.toString() %>: <%=model.getValues().get(j).value.toString() %> </span> <br />';
			<%
					} else {
			%>
					info += '<%=model.getValues().get(j).key.toString() %>: <%=model.getValues().get(j).value.toString() %> <br />';
			<%
					}
				}
			%>
			
			info += '</div>';
			attachMessage(marker, info);
			// attachSecretMessage(marker, i-1);
			// map.setCenter(location);
		<%
			}
		}
		%>
		
		/*
		google.maps.event.addListener(map, 'click', function(event) {
			placeMarker(event.latLng);
		});
		*/

		
		var homeControlDiv = document.createElement('div');
		var homeControl = new HomeControl(homeControlDiv, map);
		homeControlDiv.index = 1;
		map.controls[google.maps.ControlPosition.TOP_RIGHT]
				.push(homeControlDiv);
	}

	var i = 0;
	// var infowindow;
	function placeMarker(location) {
		var image_red = "http://www.google.cn/intl/en_us/mapfiles/ms/micons/red-dot.png";
		var image_blue = "http://www.google.cn/intl/en_us/mapfiles/ms/micons/blue-dot.png";
		var marker = new google.maps.Marker({
			position : location,
			map : map,
			icon : (i % 2 == 0 ? image_red : image_blue),
			title : '监控站点: 00' + i++,
			zIndex : i + 1000,
		});

		// attachSecretMessage(marker, i-1);
		map.setCenter(location);
	}

	function attachMessage(marker, info) {
		var infowindow = new google.maps.InfoWindow({
			size : new google.maps.Size(50, 50),
		});
		infowindow.setContent(info);

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}
	
	
	function attachSecretMessage(marker, number) {
		var message = [ "This", "is", "the", "secret", "message" ];		
		var infowindow = new google.maps.InfoWindow({
			size : new google.maps.Size(50, 50),
		});
		infowindow.setContent(marker.getPosition().lat() + "," + marker.getPosition().lng());

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}

	function HomeControl(controlDiv, map) {
		controlDiv.style.padding = '5px';

		var controlUI = document.createElement('div');
		controlUI.style.backgroundColor = 'red';
		controlUI.style.borderStyle = 'none';
		controlUI.style.borderWidth = '2px';
		controlUI.style.cursor = 'pointer';
		controlUI.style.textAlign = 'center';
		controlUI.title = '点击控件刷新状态';
		controlDiv.appendChild(controlUI);

		var controlText = document.createElement('div');
		controlText.style.fontFamily = 'Arial,sans-serif';
		controlText.style.fontSize = '15px';
		controlText.style.color = 'white';
		controlText.style.padding = '8px';
		controlText.style.paddingLeft = '20px';
		controlText.style.paddingRight = '20px';
		controlText.innerHTML = '<strong>监控数据：存在异常</strong>';
		controlUI.appendChild(controlText);

		google.maps.event.addDomListener(controlUI, 'click', function() {
			window.location.href = "spotmap.jsp";
		});
	};

	/*
	var map;
	var markersArray = [];

	function HomeControl(controlDiv, map) {
		controlDiv.style.padding = '5px';

		var controlUI = document.createElement('div');
		controlUI.style.backgroundColor = 'red';
		controlUI.style.borderStyle = 'none';
		controlUI.style.borderWidth = '2px';
		controlUI.style.cursor = 'pointer';
		controlUI.style.textAlign = 'center';
		controlUI.title = '点击控件刷新状态';
		controlDiv.appendChild(controlUI);

		var controlText = document.createElement('div');
		controlText.style.fontFamily = 'Arial,sans-serif';
		controlText.style.fontSize = '15px';
		controlText.style.color = 'white';
		controlText.style.padding = '8px';
		controlText.style.paddingLeft = '20px';
		controlText.style.paddingRight = '20px';
		controlText.innerHTML = '<strong>监控数据：存在异常</strong>';
		controlUI.appendChild(controlText);

		google.maps.event.addDomListener(controlUI, 'click', function() {
			window.location.href = "spotmap.jsp";
		});
	};

	function initialize() {
		var myLatLng = new google.maps.LatLng(-25.363882, 131.044922);
		var mapOptions = {
			zoom : 4,
			center : myLatLng,
			mapTypeControl : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);


		// 叠加层数据
		google.maps.event.addListener(map, 'click', function(event) {
			placeMarker(event.latLng);
		});

		// 监控状态数据
		var homeControlDiv = document.createElement('div');
		var homeControl = new HomeControl(homeControlDiv, map);
		homeControlDiv.index = 1;
		map.controls[google.maps.ControlPosition.TOP_RIGHT]
				.push(homeControlDiv);
	};

	function placeMarker(location) {
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});

		map.setCenter(location);
	}
	
	 */
</script>
</head>
<body onload="initialize()">
	<div id="map_canvas" style="margin-bottom: 0px; display: block;">
	</div>
</body>
</html>