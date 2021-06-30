<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main Page</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
		table{
			font-size: 12px;
		}
		#tempc,#temp1,#temp2,#temp3,#temp4,#temp5{
			font-size: 15px;
			font-style: oblique;
		}
		</style>
	</head>
	<body>
	<!-- 출력 테이블 form(1*5) -->
		<table width="100%">
			<tr>
				<td colspan="3" align="center">
				<div>
					<span id="tempc"></span><br>
					<span id="iconc"></span><br>
					<span id="descc"></span><br>
					<span id="timec"></span><br>
				</div>
				</td>
				<td colspan="2" align="center">
				<div>
					체감:<span id="fill_tempc"></span><br>
					습도:<span id="humidity"></span><br>
					UV지수:<span id="uvic"></span><br>
					<span id="description"></span>
				</div>
				</td>
			</tr>
			<tr>
	<%
			for(int i = 1; i < 6; i++){
	%>
				<td width="20%" align="center">
				<div>
					<span id="temp<%=i%>"></span><br>
					<span id="icon<%=i%>"></span><br>
					<span id="desc<%=i%>"></span><br>
					UV지수 : <span id="uvi<%=i%>"></span><br>
					체감 : <span id="fill_temp<%=i%>"></span><br>
					<span id="time<%=i%>"></span>
				</div>
				</td>
	<%
			}
	%>
			</tr>
		</table>
		<!-- 스크립트가 아래에 있어야 작동함! -->
		<script type="text/javascript">
		    $(document).ready(function(){
		    	
		    	let weater_icon = {
		    		'01' : 'http://www.weather.go.kr/images/icon/NW/NB01.png',	//맑음    			
		    		'02' : 'http://www.weather.go.kr/images/icon/NW/NB02.png',  //구름조금
		    		'03' : 'http://www.weather.go.kr/images/icon/NW/NB03.png',  //구름
		    		'04' : 'http://www.weather.go.kr/images/icon/NW/NB03.png',  //구름
		    		'09' : 'http://www.weather.go.kr/images/icon/NW/NB20.png',	//비조금
		    		'10' : 'http://www.weather.go.kr/images/icon/NW/NB08.png',	//비
		    		'11' : 'http://www.weather.go.kr/images/icon/NW/NB14.png',	//뇌우
		    		'13' : 'http://www.weather.go.kr/images/icon/NW/NB11.png',	//눈
		    		'50' : 'http://www.weather.go.kr/images/icon/NW/NB15.png' 	//안개
		    	};
		    	
		    	
			    $.ajax({
			    	url:"https://api.openweathermap.org/data/2.5/onecall?lat=37.48348&lon=126.87509&exclude=daily&lang=kr&units=metric&appid=98cd05d2b75d3fddaf2dab718820d6fb",
			    	type:"GET",
			    	dataType:"json",
			    	success:function(data){
			    		//오늘 날씨
			    		//시간
		    			let timec = document.querySelector('#timec');
		    			let udtc = data.current.dt;
		    			timec.innerText = unix_timestamp_curr(udtc);
			    		
		    			let tempc = document.querySelector('#tempc');
		    			tempc.innerText = (data.current.temp).toFixed(1) + "°C";
		    			
		    			let fill_tempc = document.querySelector('#fill_tempc');
		    			fill_tempc.innerText = (data.current.feels_like).toFixed(1) + "°C";
		    			
		    			let descc = document.querySelector('#descc');
		    			descc.innerText = data.current.weather[0].main;
		    			
		    			let iconc = document.querySelector('#iconc');
		    			let iconselect = (data.current.weather[0].icon).substr(0,2);
		    			iconc.innerHTML = '<img src='+ weater_icon[iconselect] +' width="50px" height="50px">';
		    			
		    			let humidity = document.querySelector('#humidity');
		    			humidity.innerText = data.current.humidity + "%";
		    			
		    			let description = document.querySelector('#description');
		    			description.innerText = data.current.weather[0].description;
		    			
		    			let uvic = document.querySelector('#uvic');
		    			let uvindexc = data.current.uvi;
		    			if(uvindexc <= 2){
			    			uvic.innerText = "낮음"; 
		    			}else if(uvindexc <= 5){
			    			uvic.innerText = "보통"; 
		    			}else if(uvindexc <= 7){
			    			uvic.innerText = "높음"; 
		    			}else if(uvindexc <= 10){
			    			uvic.innerText = "매우높음"; 
		    			}else if(uvindexc > 10){
			    			uvic.innerText = "위험"; 
		    			}
		    			
			    		//시간별 날씨
			    		for(var i = 1; i < 6; i++){
			    			//기온
			    			let temp = document.querySelector('#temp'+i+'');
			    			temp.innerText = (data.hourly[i].temp).toFixed(1) + "°C";
			    			
			    			//체감
			    			let fill_temp = document.querySelector('#fill_temp'+i+'');
			    			fill_temp.innerText = (data.hourly[i].feels_like).toFixed(1) + "°C"; 
			    			
			    			//아이콘
			    			let icon = document.querySelector('#icon'+i+'');
			    			let iconselect = (data.hourly[i].weather[0].icon).substr(0,2);
			    			icon.innerHTML = '<img src='+ weater_icon[iconselect] +' width="50px" height="50px">';
			    			
			    			//날씨설명
			    			let desc = document.querySelector('#desc'+i+'');
			    			desc.innerText = data.hourly[i].weather[0].main; 
			    			
			    			//UV지수
			    			let uvi = document.querySelector('#uvi'+i+'');
			    			let uvindex = data.hourly[i].uvi;
			    			if(uvindex < 3){
				    			uvi.innerText = "낮음"; 
			    			}else if(uvindex < 6){
				    			uvi.innerText = "보통"; 
			    			}else if(uvindex < 8){
				    			uvi.innerText = "높음"; 
			    			}else if(uvindex < 11){
				    			uvi.innerText = "매우높음"; 
			    			}else if(uvindex > 10){
				    			uvi.innerText = "위험"; 
			    			}
			    			
			    			//시간
			    			let time = document.querySelector('#time'+i+'');
			    			let udt = data.hourly[i].dt;
			    			time.innerText = unix_timestamp(udt);
			    		}//for문 end
			    	}// success end
			    	
			    }); //ajax end
		    });	//jquery end
		    
		    //unix 시간 변경 - 현재시간
			function unix_timestamp_curr(t){
				var date = new Date(t*1000);
				//var year = date.getFullYear()
				var month = date.getMonth()+1;
				var day = date.getDate()
				var hour = date.getHours();
				//var minute = "0" + date.getMinutes();
				//var second = "0" + date.getSeconds();
				return month + "월 " + day + "일 " + hour + "시";
			}
		    
		    //unix 시간 변경
			function unix_timestamp(t){
				var date = new Date(t*1000);
				//var year = date.getFullYear()
				//var month = date.getMonth()+1;
				//var day = date.getDate()
				var hour = date.getHours();
				//var minute = "0" + date.getMinutes();
				//var second = "0" + date.getSeconds();
				return hour + "시";
			}
	    </script>
		
	</body>

</html>