<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 : 갈색푸들</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/login.css" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- -------------- -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//alert("ready >>> 클릭 이벤트 ");
		
			$("#emailbtn").click(function(){
				//alert("emailbtn >>> 클릭 이벤트");
				console.log("emailbtn >>> 클릭 이벤트");
				
				let midVal = $("#m_id").val();
				let memailVal = $("#m_email").val();
				let url = "pwEmailCheck.bp";
				console.log("midVal >>> " + midVal);
				console.log("memailVal >>> " + memailVal);
				
				if(midVal == ""){
					alert("아이디를 입력하세요");	
				}else if(memailVal == ""){
					alert("이메일을 입력하세요");
				}else{
					
					$.ajax({
						"url" : url 
					   ,"type" : "GET" 
					   ,"data" : {"m_id" : midVal, "m_email" : memailVal} 
					   ,"success" : function(data){
						   			//alert(data);
									//alert("통신 성공");
									var msg = $(data).find("result").text();
									//alert(msg);
					   } 
					   ,"error":function(request,status,error){
						        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   } 
					});
				}//if else end
			});
			
			
			$("#pwbtn").click(function(){
				//alert("pwbtn >>>  함수진입");
				console.log("pwbtn >>>  함수진입");
				
				let pw_auth_num = $("#pw_auth_num").val();
				if(pw_auth_num == ""){
					alert("인증번호를 입력하세요");
				}else{
					$("#pwForm").attr({
						'action' : 'pwAuthSelect.bp',
						'method' : 'GET',
						'enctype':'application/x-www-form-urlencoded'
					}).submit();
				}
			});
	});
</script>
</head>
<body>

<img src="resources/img/mainimg/아이디찾기로고.png" class="logo" alt="로고">

	<form name="pwForm" id="pwForm">
		<table class="login" style="float:left;">
		
		<!-- 타이틀 -->
		<tr><td class="idCheck" colspan="2" align="center"><img class="idCheckImg" src="resources/img/mainimg/lock.png" alt="비밀번호 찾기"></td></tr>
		<tr><td align="center" style="font-weight: bold;font-size: 19px; padding-bottom: 8px;">비밀번호 찾기</td></tr>
		<tr align="center"><td class="checkText2" colspan="2">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br> 인증번호를 받을 수 있습니다.</td></tr>
		
		<!-- 아이디 -->
		<tr align="center">
				<td class="name" colspan="2">
					<input type="text" class="buttonCss" name="m_id" id="m_id" value="${memberVO.m_id}" style="width:233px; height: 25px;" readonly>
				</td>
		</tr>
				 
		<!-- 이메일 -->
		<tr align="center">
				<td class="e-mail">
					<input type="text" class="buttonCss" name="m_email" id="m_email" placeholder="이메일 주소" style="width:233px; height: 25px;">
					
					<span class="confirm">
					<input type="button" class="btn btn-primary btn-block" id="emailbtn" style="width: 107px; height: 31px; margin-bottom: 7px;" value="인증번호받기">
					</span>
				</td>
		</tr>	
		
		<!-- 다음 버튼 -->
		<tr>
				<td class="auth_num"><input type="text" class="buttonCss" name="pw_auth_num" id="pw_auth_num" placeholder="인증번호 8자리 입력" style="width:233px; height: 25px;" >
				<span class="nextId">
				<input type="button" id="pwbtn" class="btn btn-primary btn-block" value="다음" style="width: 107px; height: 31px; margin-bottom: 7px;"></td>
				</span>
		</tr>
		
		<!-- 인증번호가 안오나요 -->
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