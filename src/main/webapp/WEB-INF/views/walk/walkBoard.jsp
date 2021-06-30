<%@page import="java.util.List"%>
<%@page import="com.brownpoodle.walk.vo.WalkVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>산책기록 : 갈색푸들</title>
		<link rel="stylesheet" href="resources/css/main.css" type="text/css">
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		<style type="text/css">
		/* table{
			border: 1px solid;
			border-collapse: collapse;
		}
		tr:nth-child(2n+0){background-color: #fce4ec;}
		th{
			background-color: #ffb584ff;
			
		} */
		</style>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			
			function mapPopup(data) {
				$("#walk_seq").val(data);
				window.open("","pop", "width=800, height=800");
				$("#popupForm").attr("action","walkDataRead.bp");
				$("#popupForm").attr("target","pop");
				$("#popupForm").submit();
			}

		</script>
	</head>
	<body>
	<form id="popupForm" name="popupForm" method="POST">
		<input type="hidden" id="walk_seq" name="walk_seq">
	</form>
	<table width="680px" align="center" class="board_walk">
		<tr align="center"> 
			<th style="    padding-top: 10px;
    padding-bottom: 10px;">번호</th>
			<th style="    padding-top: 10px;
    padding-bottom: 10px;">기록날짜</th>
			<th style="    padding-top: 10px;
    padding-bottom: 10px;">산책시간</th>
			<th style="    padding-top: 10px;
    padding-bottom: 10px;">지도보기</th>
		</tr>
	<%
		Object obj = request.getAttribute("wList");
		List<WalkVO> wList = (List<WalkVO>)obj;
		int wCnt = wList.size();
		
		for(int i = 0; i < wCnt; i++){
			WalkVO wvo = wList.get(i);
	%>
		<tr align="center">
			<td style="color: #757575;"><%= wvo.getWalk_seq() %></td>
			<td style="color: #757575;"><%= wvo.getWalk_date() %></td>
			<td style="color: #757575;"><%= wvo.getWalk_time() %></td>
			<td>
				<!--  <input type="button" value="지도" id="selectMap" name="selectMap" onclick="mapPopup('<%= wvo.getWalk_seq()%>')">-->
				
				<input type="button" value="지도" id="selectMap" name="selectMap" onclick="mapPopup('<%= wvo.getWalk_seq()%>')" style="    width: 50px;
    height: 40px;
    background-color: #ffffff;
    border-radius: 8px;
    border: solid 1px #cec3c3;
    font-size: 14px;
    font-weight: bold;
    color: #615d5d;
    margin: 16px;">
			</td>
		</tr>
	<%
		}
	%>
	</table>
	</body>
</html>