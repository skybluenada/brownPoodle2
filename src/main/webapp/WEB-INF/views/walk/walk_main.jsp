<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Walk Main</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
			button {
				border-bottom-right-radius: 5px;
				border-bottom-left-radius: 5px;
				border-top-right-radius: 5px;
				border-top-left-radius: 5px;
				border: 1px solid;
				border-collapse: collapse;
				background-color: lightpink;
			}
			button:hover {
				background-color: white;
			}
			.hh{
				    font-weight: bold; 
    				font-size: 25px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#walkR").click(function(){
					location.href = "walkBoard.bp";
				});
			});
			
		</script>
	</head>
	<body>
		<div>
		<table>

			<tr>
				<td>
					<jsp:include page="weather.jsp" flush="false"></jsp:include>
				</td>			
			</tr>
			
			<tr>
				<td>
					<jsp:include page="walkroad.jsp" flush="false"></jsp:include>
				</td>			
			</tr>
			<tr>
				<td align="center"><button id="walkR" name="walkR" style="    width: 362px;
    height: 40px;
    background-color: #ffffff;
    border-radius: 8px;
    border: solid 1px #ffffff;
    font-size: 14px;
    font-weight: bold;
    color: #615d5d;
    margin: 16px;">산책기록보기</button></td>
			</tr>
		</table>
		<!-- <table class="text_walk" style="padding-left: 482px;padding-top: 15px;padding-bottom: 178px;">
		<tr>
			<td><span class="hh">오른쪽 자 모양</span>을 사용하여
			지도에서 거리 측정이 가능합니다.<br> 왼쪽 마우스를 눌러 측정을 시작하고 오른쪽 마우스를 누르면 측정을 끝냅니다.
			<br>거리측정이 끝나면 내가 그린 <span class="hh">경로의 거리와 예상 시간</span>을 확인하실 수 있습니다. </td>
		</tr>
		<tr><td>왼쪽 마우스를 누른채로 지도를 이동하면서 주변도 살펴보세요.</td></tr>
		<tr><td>오른쪽 상단의<span class="hh">로드뷰</span>로 산책로를 간접 체험 하실 수 있습니다.</td></tr>
		<tr><td><span class="hh">나</span>와 <span class="hh">반려동물</span>의 행복한 산책을 이제 시작하세요.</td></tr> -->
		</table> -->
		</div>
	</body>
</html>
