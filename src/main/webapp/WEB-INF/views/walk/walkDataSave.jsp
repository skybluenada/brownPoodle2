<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.brownpoodle.walk.vo.WalkVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책경로 : 갈색푸들</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		alert("ready >>> 클릭 이벤트 ");		
			$("#btn").click(function(){
				alert("btn >>> 클릭 이벤트");
				console.log("btn >>> 클릭 이벤트");
				
				let m_id = $("#m_id").val();
				let longitude_str = $("#longitude_str").val();
				let latitude_str = $("#latitude_str").val();
				let walk_time = $("#walk_time").val();
				
				let url = "walkDataRead.bp";
				alert("latitude_str >>> latitude_str");
				console.log("latitude_str >>> " + latitude_str);
				
				$.ajax({
					"url" : url 
				   ,"type" : "POST" 
				   ,"data" : {	
					   			"m_id" : m_id, 
					   			"longitude_str" : longitude_str, 
					   			"latitude_str" : latitude_str,
					   			"walk_time" : walk_time
					   		  } 
				   ,"success" : function(data){
					   			alert(data);
								alert("통신 성공");
								location.href="walkDataRead.bp";
				   } 
				   ,"error":function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   } 
				});
			});
	});

</script>
</head>
<body>

m_id <input type="text" name="m_id" id="m_id" style="width: 200px; height: 25px;"><br>
longitude_str <input type="text" name="longitude_str" id="longitude_str" style="width: 200px; height: 25px;"><br>
latitude_str <input type="text" name="latitude_str" id="latitude_str" style="width: 200px; height: 25px;"><br>
walk_time <input type="text" name="walk_time" id="walk_time" style="width: 200px; height: 25px;"><br>
<button type="button" value="데이터 전송" name="btn" id="btn"></button>

</body>
</html>