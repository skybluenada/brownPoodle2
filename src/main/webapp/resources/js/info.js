      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('서울 금천구 가산디지털2로 123',function(result, status) {
         // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
   
            var coords = new kakao.maps.LatLng(result[0].y,
                  result[0].x);
   
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
               map : map,
               position : coords
            });
   
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow(
                  {
                     content : '<div style="width:150px;text-align:center;padding:6px 0;">한국소프트웨어인재개발원</div>'
                  });
            infowindow.open(map, marker);
   
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
         }
      });
      
      function button_click(s) {

         // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
         var infowindow = new kakao.maps.InfoWindow({
            zIndex : 1,
            removable : true
         });
   
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level : 5
         // 지도의 확대 레벨
         };
   
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption);
   
         // 장소 검색 객체를 생성합니다
         var ps = new kakao.maps.services.Places();
         var searchPlace = '강남구' + ' ' + s;
         // 키워드로 장소를 검색합니다
         ps.keywordSearch(searchPlace, placesSearchCB);
   
         // 키워드 검색 완료 시 호출되는 콜백함수 입니다
         function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
   
               // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
               // LatLngBounds 객체에 좌표를 추가합니다
               var bounds = new kakao.maps.LatLngBounds();
   
               for (var i = 0; i < data.length; i++) {
                  displayMarker(data[i],s);
                  bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
               }
   
               // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
               map.setBounds(bounds);
               map.setLevel(6);
            }
         }
   
         // 지도에 마커를 표시하는 함수입니다
         function displayMarker(place,s) {
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
   if(s== "애견카페"){
      imageSrc = "resources/img/info/카페.png";
   }
   if(s == "애견미용"){
      imageSrc = "resources/img/info/미용.png";
   }
   if(s == "동물병원"){
      imageSrc = "resources/img/info/병원.png";
   }
   if(s == "동물약국"){
      imageSrc = "resources/img/info/약국.png";
            }
   if(s == "애견용품"){
      imageSrc = "resources/img/info/용품.png";
   }
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize);
            
            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
               map : map,
               position : new kakao.maps.LatLng(place.y, place.x),
               image : markerImage
            });
            var link = 'https://map.naver.com/v5/search/' + place.place_name
            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
               // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
               infowindow
                     .setContent('<div style="padding:5px;font-size:12px;">'
                           + place.place_name + '<br>'
                           + place.address_name + '<br>' + place.phone
                           + '<br><a href="' + link + '">링크 </a><br>'
                           + '</div>');
               infowindow.open(map, marker);
            });
         }
      }
 