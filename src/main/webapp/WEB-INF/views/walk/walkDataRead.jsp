<%@page import="com.brownpoodle.walk.vo.WalkVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>산책기록 : 갈색푸들</title>
	</head>
	<body>
	<% 
		Object objLat = request.getAttribute("latitude");
		Object objLon = request.getAttribute("longitude");
	
		
		double[] lat = (double[])objLat;
		double[] lon = (double[])objLon;
		
		double latitude = lat[0];
		double longitude = lon[0];

	%>
	
	
	<div id="map" style="width:800px;height:800px;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35dc1ea9dbe217002c536d1dfbd58cf0"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>), // 지도의 중심좌표
	        level: 4, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var kakaomaps = [];
		<%
			for(int i = 0; i < lat.length; i++){
				latitude = lat[i];
				longitude = lon[i];
		%>
				var kakaomap = new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>);
				kakaomaps.push(kakaomap);
		<%
			}
		%>
		
		// 지도에 선을 표시한다 
		var polyline = new kakao.maps.Polyline({
			map: map, // 선을 표시할 지도 객체 
			path: kakaomaps, // 선을 구성하는 좌표 배열
			strokeWeight: 5, // 선의 두께
			strokeColor: '#db4040', // 선 색
			strokeOpacity: 0.9, // 선 투명도
			strokeStyle: 'solid' // 선 스타일
		});	
		map.relayout();
	</script>
	</body>
</html>