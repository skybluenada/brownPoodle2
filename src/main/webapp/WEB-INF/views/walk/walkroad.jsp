<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>산책하기 : 갈색푸들</title>
    <style>
    /* 버튼 : 지도, 스카이뷰, 확대, 축소  */
	html, body {width:100%;height:100%;margin:0;padding:0;} 
	.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_typecontrol {position:absolute;top:10px;right:9px;overflow:hidden;width:149px;height:32px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6); width:82px; height:33px; font-size:12px;}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
	.custom_zoomcontrol span img {width:16px;height:39px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}  
	/* 로드뷰 */
	#container {overflow:hidden;height:600px;position:relative; width:1031px; margin-left:469px;}
	#mapWrapper {width:100%;height:100%;z-index:1;}
	#rvWrapper {width:50%;height:100%;top:0;right:0;position:absolute;z-index:0;}
	#container.view_roadview #mapWrapper {width: 50%;}
	#roadviewControl {position:absolute;top:5px;left:5px;width:42px;height:42px;z-index: 1;cursor: pointer; background: url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png) 0 -450px no-repeat;}
	#roadviewControl.active {background-position:0 -350px;}
	#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
	#close .img {display: block;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}
	/* 오버레이 */
	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #F2385A;background: #F2385A url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	/* 선 거리 계산 */
	.ruler_btn {position:absolute;top:200px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.ruler_btn {position:absolute;top:150px;right:10px;width:36px;height:36px;background-color:#f5f5f5;} 
	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	.distanceInfo .label {display:inline-block;width:50px;}
	.distanceInfo:after {content:none;}
	
</style>
</head>
<body>


<!-- 오늘의 날씨 -->
	<table style="float:top;     margin-left: 343px;
    margin-bottom: 32px;
    margin-top: 95px;">
		<tr>
			<td colspan="2" style="padding-left: 208px; padding-top: 68px; padding-bottom: 21px"><img src="resources/img/mainimg/dog.png" width=56px;><span class="todayw">산책하기</span></td>
		</tr>
		<tr>
			<td style="padding-left: 219px;"><img src="resources/img/mainimg/ddaum48.png" alt="icon" style="font-size: 16px; padding-bottom: 91px; padding-right: 15px; width: 38px;"></td>
			<td style="font-size: 19px; font-weight: 800;">가까운거리의 추천경로를,<br>산책해보세요!</td>
			<td><img src="resources/img/mainimg/ddaum48rigt.png" alt="icon" style="padding-top: 38px; padding-left: 15px; width: 38px;"></td>
		</tr>
	</table>
	
	
<!-- <table style="padding-left: 625px; padding-bottom:30px; width: 38px;">
<tr>
			<td colspan="2" style="padding-left: 744px; padding-top: 68px; padding-bottom: 21px"><img src="resources/img/mainimg/sun.png" width=56px;" style="float:right"><span class="todayw" style="float:right">산책</span></td>
		</tr>
		<tr>
			<td style="padding-left: 536px; width: 38px;"><img src="resources/img/mainimg/ddaum48.png" alt="icon" style="font-size: 48px; padding-bottom: 91px; padding-right: 15px; width: 38px;"></td>
			<td style="font-size: 19px; font-weight: 800;">가까운거리의 추천경로를,<br>산책해보세요!<span><img src="resources/img/mainimg/ddaum48rigt.png" alt="icon" style="padding-bottom: 38px; padding-left: 15px; width: 38px;"></span></td>
		</tr>


</table> -->

<div id="container" class="map_wrap">
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
    </div>
    <div class="ruler_btn">
		<span onclick="rulerCall(flag)"><img src="resources/img/walkimg/walkRul.png" alt="거리측정" style="width:36px;height:36px;"/></span>
	</div>
    <!-- 지도타입 컨트롤 div 입니다 -->
	<div class="custom_typecontrol radius_border">
	    <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
	    <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
	</div>
	<div class="custom_zoomcontrol radius_border"> 
	    <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
	    <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a063b24459910cab7117061ba52ce148&libraries=drawing"></script>
<script>
	var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
	    container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
	    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
	    mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
	    rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
	
    var Hardness = 37.478415;
	var Latitude = 126.875852;
	var mapCenter = new kakao.maps.LatLng(Hardness , Latitude), // 지도의 중심좌표
	    mapOption = {
	        center: mapCenter, // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// -- 뷰 버튼 함수 ----------------------------------------------------
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}
	
	// -- 지도 확대 축소 ----------------------------------------------
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}
	
	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	//
	var imageSrc = 'resources/img/walkimg/marker_pink.png', // 마커이미지의 주소입니다    
	//https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png (40, 42) // 파란색
	//https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png (24, 35) // 노란별
    imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	var	position = new kakao.maps.LatLng(Hardness , Latitude); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: position,
	  image: markerImage // 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  

	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var content = '<div class="customoverlay">' +
	    '  <a href="https://map.kakao.com/link/map/23937833" target="_blank">' +
	    '    <span class="title">안양천로 산책길 A <br>총거리 1.91km 도보 28분</span>' +
	    '  </a>' +
	    '</div>';

	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    map: map,
	    position: position,
	    content: content,
	    yAnchor: 1 
	});
	
	// -- 로드뷰 ---------------------------------------------------
	// 로드뷰 객체를 생성합니다 
	var rv = new kakao.maps.Roadview(rvContainer); 
	
	// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
	var rvClient = new kakao.maps.RoadviewClient(); 
	
	// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
	kakao.maps.event.addListener(rv, 'position_changed', function() {
	
	    // 현재 로드뷰의 위치 좌표를 얻어옵니다 
	    var rvPosition = rv.getPosition();
	
	    // 지도의 중심을 현재 로드뷰의 위치로 설정합니다
	    map.setCenter(rvPosition);
	
	    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
	    if(overlayOn) {
	        // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
	        marker.setPosition(rvPosition);
	    }
	});
	
	// 마커 이미지를 생성합니다
	var markImage = new kakao.maps.MarkerImage(
		'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
	    new kakao.maps.Size(26, 46),
	    {
	        // 스프라이트 이미지를 사용합니다.
	        // 스프라이트 이미지 전체의 크기를 지정하고
	        spriteSize: new kakao.maps.Size(1666, 168),
	        // 사용하고 싶은 영역의 좌상단 좌표를 입력합니다.
	        // background-position으로 지정하는 값이며 부호는 반대입니다.
	        spriteOrigin: new kakao.maps.Point(705, 114),
	        offset: new kakao.maps.Point(13, 46)
	    }
	);
	
	// 드래그가 가능한 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    image : markImage,
	    position: mapCenter,
	    draggable: true
	});
	
	// 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
	
	    // 현재 마커가 놓인 자리의 좌표입니다 
	    var position = marker.getPosition();
	
	    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
	    toggleRoadview(position);
	});
	
	//지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent){
	    
	    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
	    if(!overlayOn) {
	        return;
	    }
	
	    // 클릭한 위치의 좌표입니다 
	    var position = mouseEvent.latLng;
	
	    // 마커를 클릭한 위치로 옮깁니다
	    marker.setPosition(position);
	
	    // 클락한 위치를 기준으로 로드뷰를 설정합니다
	    toggleRoadview(position);
	});
	
	// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
	// 로드뷰를 설정하는 함수입니다
	function toggleRoadview(position){
	    rvClient.getNearestPanoId(position, 50, function(panoId) {
	        // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
	        if (panoId === null) {
	            toggleMapWrapper(true, position);
	        } else {
	         toggleMapWrapper(false, position);
	
	            // panoId로 로드뷰를 설정합니다
	            rv.setPanoId(panoId, position);
	        }
	    });
	}
	
	// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
	function toggleMapWrapper(active, position) {
	    if (active) {
	
	        // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
	        container.className = '';
	
	        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
	        map.relayout();
	
	        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
	        map.setCenter(position);
	    } else {
	
	        // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
	        // 로드뷰가 함께 표시되게 합니다
	        if (container.className.indexOf('view_roadview') === -1) {
	            container.className = 'view_roadview';
	
	            // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
	            map.relayout();
	
	            // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
	            map.setCenter(position);
	        }
	    }
	}
	
	// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
	function toggleOverlay(active) {
	    if (active) {
	        overlayOn = true;
	
	        // 지도 위에 로드뷰 도로 오버레이를 추가합니다
	        map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
	
	        // 지도 위에 마커를 표시합니다
	        marker.setMap(map);
	
	        // 마커의 위치를 지도 중심으로 설정합니다 
	        marker.setPosition(map.getCenter());
	
	        // 로드뷰의 위치를 지도 중심으로 설정합니다
	        toggleRoadview(map.getCenter());
	    } else {
	        overlayOn = false;
	
	        // 지도 위의 로드뷰 도로 오버레이를 제거합니다
	        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
	
	        // 지도 위의 마커를 제거합니다
	        marker.setMap(null);
	    }
	}
	
	// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
	function setRoadviewRoad() {
	    var control = document.getElementById('roadviewControl');
	
	    // 버튼이 눌린 상태가 아니면
	    if (control.className.indexOf('active') === -1) {
	        control.className = 'active';
	
	        // 로드뷰 도로 오버레이가 보이게 합니다
	        toggleOverlay(true);
	    } else {
	        control.className = '';
	
	        // 로드뷰 도로 오버레이를 제거합니다
	        toggleOverlay(false);
	    }
	}
	
	// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
	function closeRoadview() {
	    var position = marker.getPosition();
	    toggleMapWrapper(true, position);
	}
	
	// 경로 그리기 -------------------------------------------------------------
	var polyline = new kakao.maps.Polyline({
		map: map, 		// 선을 표시할 지도 객체
		path:[			// 선을 구성하는 좌표 배열
			new kakao.maps.LatLng(Hardness , Latitude),          
			new kakao.maps.LatLng(37.480194, 126.874988),
			new kakao.maps.LatLng(37.485021, 126.872911), // 광명교 첫
			new kakao.maps.LatLng(37.484877, 126.871566),
			new kakao.maps.LatLng(37.481264, 126.872942),
			new kakao.maps.LatLng(37.481204, 126.872714),
			new kakao.maps.LatLng(37.478134, 126.874186),
			new kakao.maps.LatLng(37.477974, 126.874420),
			new kakao.maps.LatLng(37.477863, 126.874656),
			new kakao.maps.LatLng(37.478246, 126.875944),
			new kakao.maps.LatLng(Hardness , Latitude)
		],
		strokeWeight: 7,		 // 선의 두께
		strokeColor: '#F2385A',  // 선 색
		strokeOpacity: 0.5, 	 // 선 투명도
		strokeStyle: 'solid' // 선 스타일
	});
	
	// 선 거리 계산 -------------------------------------------------------------
	var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
	var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	var flag = false;
		
	function rulerCall(flag){
		if(flag != true) flag = true;
		else flag = false;
		
		rulerMeasuring(flag);
	};
	function rulerMeasuring(flag){
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	
		    // 마우스로 클릭한 위치입니다 
		    var clickPosition = mouseEvent.latLng;
	
		    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
		    if (!drawingFlag) {
	
		        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
		        drawingFlag = true;
		        
		        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		        deleteClickLine();
		        
		        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		        deleteDistnce();
	
		        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		        deleteCircleDot();
		    
		        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		        clickLine = new kakao.maps.Polyline({
		            map: map, // 선을 표시할 지도입니다 
		            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        
		        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
		        moveLine = new kakao.maps.Polyline({
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다    
		        });
		    
		        // 클릭한 지점에 대한 정보를 지도에 표시합니다
		        displayCircleDot(clickPosition, 0);
	
		            
		    } else { // 선이 그려지고 있는 상태이면
	
		        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
	
		        // 좌표 배열에 클릭한 위치를 추가합니다
		        path.push(clickPosition);
		        
		        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		        clickLine.setPath(path);
	
		        var distance = Math.round(clickLine.getLength());
		        displayCircleDot(clickPosition, distance);
		    }
		});
		    
		// 지도에 마우스무브 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	
		    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag){
		        
		        // 마우스 커서의 현재 위치를 얻어옵니다 
		        var mousePosition = mouseEvent.latLng; 
	
		        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		        
		        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
		        var movepath = [path[path.length-1], mousePosition];
		        moveLine.setPath(movepath);    
		        moveLine.setMap(map);
		        
		        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
		            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
		        
		        // 거리정보를 지도에 표시합니다
		        showDistance(content, mousePosition);   
		    }             
		});                 
	
		// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
		    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag) {
		        
		        // 마우스무브로 그려진 선은 지도에서 제거합니다
		        moveLine.setMap(null);
		        moveLine = null;  
		        
		        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		    
		        // 선을 구성하는 좌표의 개수가 2개 이상이면
		        if (path.length > 1) {
	
		            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
		            if (dots[dots.length-1].distance) {
		                dots[dots.length-1].distance.setMap(null);
		                dots[dots.length-1].distance = null;    
		            }
	
		            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
		                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
		                
		            // 그려진 선의 거리정보를 지도에 표시합니다
		            showDistance(content, path[path.length-1]);  
		             
		        } else {
	
		            // 선을 구성하는 좌표의 개수가 1개 이하이면 
		            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
		            deleteClickLine();
		            deleteCircleDot(); 
		            deleteDistnce();
	
		        }
		        
		        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
		        drawingFlag = false;          
		    }  
		});    
	
		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
		    if (clickLine) {
		        clickLine.setMap(null);    
		        clickLine = null;        
		    }
		}
	
		// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
		// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
		function showDistance(content, position) {
		    
		    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
		        
		        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
		        distanceOverlay.setPosition(position);
		        distanceOverlay.setContent(content);
		        
		    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
		        
		        // 커스텀 오버레이를 생성하고 지도에 표시합니다
		        distanceOverlay = new kakao.maps.CustomOverlay({
		            map: map, // 커스텀오버레이를 표시할 지도입니다
		            content: content,  // 커스텀오버레이에 표시할 내용입니다
		            position: position, // 커스텀오버레이를 표시할 위치입니다.
		            xAnchor: 0,
		            yAnchor: 0,
		            zIndex: 3  
		        });      
		    }
		}
	
		// 그려지고 있는 선의 총거리 정보와 
		// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
		function deleteDistnce () {
		    if (distanceOverlay) {
		        distanceOverlay.setMap(null);
		        distanceOverlay = null;
		    }
		}
	
		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {
	
		    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		    var circleOverlay = new kakao.maps.CustomOverlay({
		        content: '<span class="dot"></span>',
		        position: position,
		        zIndex: 1
		    });
	
		    // 지도에 표시합니다
		    circleOverlay.setMap(map);
	
		    if (distance > 0) {
		        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
		        var distanceOverlay = new kakao.maps.CustomOverlay({
		            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
		            position: position,
		            yAnchor: 1,
		            zIndex: 2
		        });
	
		        // 지도에 표시합니다
		        distanceOverlay.setMap(map);
		    }
	
		    // 배열에 추가합니다
		    dots.push({circle:circleOverlay, distance: distanceOverlay});
		}
	
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
		function deleteCircleDot() {
		    var i;
	
		    for ( i = 0; i < dots.length; i++ ){
		        if (dots[i].circle) { 
		            dots[i].circle.setMap(null);
		        }
	
		        if (dots[i].distance) {
		            dots[i].distance.setMap(null);
		        }
		    }
	
		    dots = [];
		}
	
		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {
	
		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';
	
		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		    var bycicleTime = distance / 227 | 0;
		    var bycicleHour = '', bycicleMin = '';
	
		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		    if (bycicleTime > 60) {
		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
		    }
		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
	
		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		    var content = '<ul class="dotOverlay distanceInfo">';
		    content += '    <li>';
		    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
		    content += '    </li>';
		    content += '</ul>'
	
		    return content;
		}
	}
</script>
</body>
</html>