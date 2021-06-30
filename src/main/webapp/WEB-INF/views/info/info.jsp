<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List" %>
<%@ page import="com.brownpoodle.board.vo.BoardVO" %>
<%@ page import="com.brownpoodle.common.CommonUtil" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/info.css" type="text/css">
<link rel="stylesheet" href="resources/css/bootstrapinfo.css">

<!-- ------------ -->
<% request.setCharacterEncoding("UTF-8");%>
<%
	// session 로그인상태 가져오기 
	HttpSession bpSession = request.getSession(false);

	String addr = "";	
	String mnum = "";
	String nick = "";
	String m_id = "";
	
	if(bpSession != null){
		addr = String.valueOf(bpSession.getAttribute("m_addr"));
		nick = String.valueOf(bpSession.getAttribute("m_nick"));
		mnum = String.valueOf(bpSession.getAttribute("m_num"));
		m_id = String.valueOf(bpSession.getAttribute("m_id"));
		
		System.out.println("boardSelectAll jsp page nick: " + nick);
		System.out.println("boardSelectAll jsp page m_id: " + m_id);
		System.out.println("addr >>> : " + addr);		
	}
	
%>
</head>
<body style="background-color:#EEEEEE;">

<!-- 상단 -->
<table class="logot">
	<tr class="logotr">
		<td class="logotd">
			<div class="logotdh">
			<img alt="logo" src="resources/img/mainimg/로고집.png" link="">
			</div>
		</td>
		
		<td class="logotd">
			<div class="logotdtext">
			<a href="index.jsp">
			<img alt="logoname" src="resources/img/mainimg/로고네임.png">
			</a>
			</div>
		</td>
		
		<!-- 상단 아이콘 -->
		<td class="logotd">
			<div class="logotdicon1">
			<img alt="icon1" src="resources/img/mainimg/상단1.png">
			</div>
		</td>
		<td class="logotd">
			<div class="logotdicon2">
			<img alt="icon2" src="resources/img/mainimg/상단2.png">
			</div>
		</td>
		<td class="logotd">
			<div class="logotdicon3">
			<img alt="icon3" src="resources/img/mainimg/상단3.png">
			</div>
		</td>
		
		<!-- 로그인 -->
		
<%
			if(m_id != "null"){
		%>		
				<td class="logotd"><div class="logotdlogin"><a href="logout">로그아웃</a></div></td>
		<% 		
			}else {
		%>
		
		<td class="logotd"><div class="logotdlogin"><a href="login">로그인</a></div></td>
		<% 
			}
		%> 
		<!-- <td class="logotd"><div class="logotdlogin"><a href="login">로그인</a></div></td> -->
		<td class="logotd">
		<div class="logotdloginp"><img alt="login" src="resources/img/mainimg/상단로그인.png"></div>
		</td>
	</tr>
</table>


<!-- 왼쪽사이드 -->
<table class="leftside" style="float:left;">
	<tr>
		<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/글쓰기.png"></td><td class="leftsidetext"><a href="boardInsertForm">글쓰기</a></td>
	</tr>

	<tr>
		<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/다이어리.png"></td><td class="leftsidetext"><a href="calendar">펫 다이어리</td>
	</tr>
	<tr>
		<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/산책.png"></td><td class="leftsidetext"><a href="walkMain">산책 하기</td>
	</tr>
	<tr>
		<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/업체정보.png"></td><td class="leftsidetext"><a href="info.bp">업체 정보</a></td>
	</tr>
	<tr>
		<td colspan="2" class="leftsidetd"><img alt="write" src="resources/img/mainimg/사이드줄.png"></td>
	</tr>
</table>

	
<!-- 업체 정보 -->
<table class="info">
	<tr>
		<td class="shelterimg"><img class="shelter" src="resources/img/mainimg/shelter.png" alt="shelter"></td>
		<td colspan="4"><span class="infotitle">업체정보</span><br><span class="infotitlesurv">우리동네의 다양한 애견업체들을 확인해보세요!</span></td>
	</tr>
	<tr>
		<td class="maptd" colspan="5"> <div class="map" id="map" style="width: 710px; height: 412px;"></div></td>
	</tr>
	<tr>
		<td colspan="5" class="button1" style="width: 0;"><input type="button" class="btn btn-warning" id="button1" onclick="button_click('애견카페');"value="애견카페" style="margin-right: 12px;" />
		<input type="button" class="btn btn-danger" id="button2" onclick="button_click('애견미용');"value="미용업체" style="margin-right: 12px;" />
		<input type="button" class="btn btn-primary" id="button2" onclick="button_click('동물병원');"value="동물병원" style="margin-right: 12px;" />
		<input type="button" class="btn btn-info" id="button2" onclick="button_click('동물약국');"value="동물약국" style="margin-right: 12px;" />
		<input type="button" class="btn btn-success" id="button2" onclick="button_click('애견용품');"value="애견용품" style="margin-right: 12px;" /></td>
	</tr>


</table>





	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35dc1ea9dbe217002c536d1dfbd58cf0&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
 <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35dc1ea9dbe217002c536d1dfbd58cf0&libraries=services"></script>	
	<!-- 자바스크립트 -->
	<script src=../resources/js/info.js></script>
</body>
</html>