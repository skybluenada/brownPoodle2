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
		<!-- ------------------ -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				$("#mconfirm").click(function(){
					let m_nameVal = $("#m_name").val();
					let m_emailVal = $("#m_email").val();
					
					if(m_nameVal == ""){
						alert("이름을 입력하세요");
					}else if(m_emailVal == ""){
						alert("이메일을 입력하세요");
					}else{
						let url = "idAuthEmailCheck.bp";
						$.get(url,{"m_name":m_nameVal,"m_email":m_emailVal},function(data){
							var msg = $(data).find("result").text();
							alert(msg);
						});
					}
				});
				
				$("#idbtn").click(function(){
					let auth_num = $("#id_auth_num").val();
					
					if(auth_num == ""){
						alert("인증번호를 입력하세요");
					}else{
			 			$('#findId').attr({
							'action':'idAuthEmailIdFind.bp',
							'method':'POST',
							'enctype':'application/x-www-form-urlencoded'
						}).submit();
					}
				});
			});
		</script>
	</head>
	<body>
	<img src="resources/img/mainimg/아이디찾기로고.png" class="logo" alt="로고">
	
	
	<form name="findId" id="findId">
		
		
		<table class="login" style="float:left;">
		
		<!-- 타이틀 -->
		<tr><td class="idCheck" colspan="2" align="center"><img class="idCheckImg" src="resources/img/mainimg/lock.png" alt="아이디 찾기"></td></tr>
		<tr><td align="center" style="font-weight: bold;font-size: 19px; padding-bottom: 8px;">아이디 찾기</td></tr>
		<tr align="center"><td class="checkText" colspan="2">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br> 인증번호를 받을 수 있습니다.</td></tr>
		
		<!-- 이름 -->
		<tr align="center">
				<td class="name" colspan="2" style="padding-top: 21px;">
					<input type="text" class="buttonCss" name="m_name" id="m_name" placeholder="이름" style="width:233px; height: 25px;">
				</td>
		</tr>
		
		<tr align="center">
				<td class="e-mail">
					<input type="text" class="buttonCss" name="m_email" id="m_email" placeholder="이메일 주소" style="width:233px; height: 25px;">
					<span class="confirm">
					<input type="button" class="btn btn-primary btn-block" id="mconfirm" style="width: 107px; height: 31px; margin-bottom: 7px;" value="인증번호받기">
					</span>
				</td>
		</tr>
		
		<tr>
				<td class="auth_num"><input type="text" class="buttonCss" name="id_auth_num" id="id_auth_num" placeholder="인증번호 8자리 입력" style="width:233px; height: 25px;" >
					<span class="nextId">
					<input type="button" id="idbtn" class="btn btn-primary btn-block" value="다음" style="width: 107px; height: 31px; margin-bottom: 7px;"></td>
				</span>
		</tr>
				
		<tr align="center">
				
			<td class="line" colspan="2"><img src="resources/img/mainimg/로그인선.png" alt="line"><br>
			<font size="1">인증번호가 오지 않나요</font>
			<img src="resources/img/mainimg/qustion.png" title="발송해드린 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요." style="border: solid 1.5px #707070; width: 16px; height: 16px;">
			 </td>
		</tr>
		
		</table>
	</form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	</body>
</html>