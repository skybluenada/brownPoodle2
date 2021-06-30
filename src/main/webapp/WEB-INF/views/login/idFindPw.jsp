<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 : 갈색푸들</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/login.css" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

		<script type="text/javascript">
		
		$(document).ready(function(){
			$("#mid").attr('placeholder', '아이디');		
			
			$("#idFindPwbtn").click(function(){
				console.log("idFindPwbtn >>> 클릭 이벤트 진입");
				
				$('#idFindForm').attr({
					'action':'pwFind.bp',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
		});
		
		</script> 
</head>
<body> 
<img src="resources/img/mainimg/아이디찾기로고.png" class="logo" alt="로고">
<!-- 로그인 --> 
<form name="idFindForm" id="idFindForm"> 
			<table class="login" style="float:left;">
				<!-- 타이틀 -->
				<tr><td class="idCheck" colspan="2" align="center"><img class="idCheckImg" src="resources/img/mainimg/lock.png" alt="비밀번호 찾기"></td></tr>
				<tr><td align="center" style="font-weight: bold;font-size: 19px; padding-bottom: 8px; padding-bottom: 19px;">비밀번호</td></tr>
				<tr align="center"><td class="checkText" colspan="2">비밀번호를 찾고자 하는 아이디를 입력해주세요!</td></tr>
				
				<!-- 아이디 입력 -->
				<tr align="center">
					<td class="name2" colspan="2" style="padding-top: 27px;">
						<input type="text" class="buttonCss" name="m_id" id="m_id" placeholder="아이디" style="width:233px; height: 25px;">
					</td>
				</tr>

				<!-- 다음 -->
				<tr>
					<td class="auth_num2">
					<span class="nextId">
					<input type="button" id="idFindPwbtn" class="btn btn-primary btn-block" value="다음" style="width: 107px; height: 31px; margin-bottom: 7px;"></td>
					</span>
					</tr>
		
				<tr align="center">
				<td class="line" colspan="2"><img src="resources/img/mainimg/로그인선.png" alt="line"><br>
				<font size="1">아이디가 기억나지 않으세요?</font>
			  	<a href="idFind.bp" style="font-size: 10px; text-decoration: underline;">아이디찾기 </div></a>
			 	</td>
				</tr>
			</table>
		</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>