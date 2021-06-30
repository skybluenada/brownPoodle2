<%@page import="com.brownpoodle.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 : 갈색푸들</title>
		
		<!-- css -->
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		<link rel="stylesheet" href="resources/css/login.css" type="text/css">
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
		<!---------------->
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
					$("#loginBtn").click(function(){
						location.href = "login.bp";
					});
					
					$("#pwFind").click(function(){
						if($("#m_id").is(":checked")){
							$("#idFindOK").attr({
								'action':'pwFind.bp',
								'method':'GET',
								'enctype':'application/x-www-form-urlencoded'
							}).submit();
						}else{
							location.href = "idFindPw.bp";
						}
					});
			});
		</script>
	</head>
	<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("iList");
		if(obj == null) return;
		
		ArrayList<MemberVO> iList = (ArrayList)obj;
		MemberVO mvo = iList.get(0);
		
		String m_id = mvo.getM_id();
		String m_insertdate = mvo.getM_insertdate();
	%>
	
	<img src="resources/img/mainimg/아이디찾기로고.png" class="logo" alt="로고">
	
	<form name="idFindOK" id="idFindOK">
	<table class="login" style="float:left;">
	
		<!-- 타이틀 -->
		<tr><td class="idCheck" colspan="2" align="center"><img class="idCheckImg" src="resources/img/mainimg/lock.png" alt="아이디 찾기"></td></tr>
		<tr><td align="center" style="font-weight: bold;font-size: 19px; padding-bottom: 13px;">아이디 찾기</td></tr>
		
		<tr align="center">
			<td>
				<div class="checkBox">
				<input type="checkbox" name="m_id" id="m_id" value="<%= m_id%>"> <font size="4"><%= m_id%></font><br>
				<font size="2px" color="#575757">최초가입일 : <%= m_insertdate %></font>
				</div>
			</td> 
		</tr>
		
		<tr align="center">
			<td class="button2">
				<input type="button" id="loginBtn" name="loginBtn" class="btn btn-primary btn-block" value="로그인" style="width: 130px; height: 31px">
				<input type="button" id="pwFind" name="pwFind" class="btn btn-primary btn-block" value="비밀번호 찾기" style="width: 130px; height: 31px">	
			</td>
		</tr>
		
		
	</table>
	</form>
	</body>
</html>