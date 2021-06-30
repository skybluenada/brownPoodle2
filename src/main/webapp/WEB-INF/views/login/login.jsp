<%@page import="com.brownpoodle.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();

	// 네이버 로그인 API 사용
	String clientId = "auFKWzgp26tOU_2jRrOj";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8088/naverCallback.bp", "UTF-8");// 네이버에 등록한 값 콜백화면으로 가야된다.
	String naverApiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	naverApiURL += "&client_id=" + clientId;
	naverApiURL += "&redirect_uri=" + redirectURI;
	naverApiURL += "&state=" + state;
	System.out.println("naverApiURL >>> : " + naverApiURL);

	
	// 카카오 로그인 API 사용
	String kakaoAppKey = "841ade6e36787e3a3c173468f82bbc4e"; // 카카오 아이디값.
	String kakaoRedirectURI =   "http://localhost:8088/kakaoCallback.bp";
	SecureRandom kakaoRandom = new SecureRandom();
	String kakaoApiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
	kakaoApiURL += "&client_id="+ kakaoAppKey; 
	kakaoApiURL	+= "&redirect_uri=" +  kakaoRedirectURI + "&";
	kakaoApiURL += "&state=" + state;
	System.out.println("kakaoApiURL >>> : " + kakaoApiURL);
	
	session.setAttribute("state", state);
	
	//session.setAttribute("kakaoState", kakaoState);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 : 갈색푸들</title>
		
		<!-- css -->
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		<link rel="stylesheet" href="resources/css/login.css" type="text/css">
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
		<!-- ---------- -->


		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btn").click(function(){
					var m_id = $("#m_id").val();
					var m_pw = $("#m_pw").val();
					
					if(m_id == ""){
						alert("아이디를 입력하세요");
					}else if(m_pw == ""){
						alert("비밀번호를 입력하세요");
					}else{
						$('#loginForm').attr({
							'action':'loginTry.bp',
							'method':'POST',
							'enctype':'application/x-www-form-urlencoded'
						}).submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<form name="loginForm" id="loginForm">
			<table class="login" style="float:left;">
				<tr><td><a href="boardSelectAll.bp"><h5 align="center"><img class="loginlogo" src="resources/img/mainimg/로그인로고.png" alt="로그인로고"></h5></a></td></tr>
				<!-- 아이디 입력 -->
				<tr align="center">
				<td class="id">
						<input type="text" class="form-control" name="m_id" id="m_id" placeholder="아이디" style="width: 327px; height: 25px;">
				</td>
				</tr>
				
				
				
				<!-- 비밀번호 입력 -->
				<tr align="center">
					<td class="password">
						<input type="password" class="form-control" name="m_pw" id="m_pw" placeholder="비밀번호" style="width: 327px; height: 25px;">
					</td>
				</tr>
				
				
				<!-- 로그인 버튼 -->
				<tr align="center">
					<td>
						<input type="button" class="btn btn-primary btn-block" id="btn" style="width: 327px; height: 43px; font-size: 14px; border-radius: 25px; font-weight: bold;" value="로그인">
					</td>
				</tr>
				
				
				<!-- 아이디/비번 찾기 -->
				<tr align="center">
					<td class="findIdPw">
						<a href="idFind.bp">아이디찾기</a> |
						<a href="idFindPw.bp">비밀번호찾기<br><br></a>
						<img src="resources/img/mainimg/로그인선.png" alt="line">
					</td>
				</tr>
				
				<!-- 네이버 로그인 -->
				<tr align="center">
					<td>
						<a href="<%=naverApiURL %>">
						<input type="button" class="btn btn-primary btn-block" id="btn" value="네이버 로그인" style="width: 329px; height: 45px; background-color:#1EC800; border: solid #1EC800 1px; margin-top: 22px;  margin-bottom: 8px; font-size: 14px;
						        font-weight: bold;  padding-left: 54px; border-radius: 8px; background: url(resources/img/mainimg/naverBack.png);">
						 </a>
					</td>
				</tr>
				
				
				
				<!-- 카카오 로그인 -->
				
				<tr align="center">
					<td>
					<a href="<%=kakaoApiURL%>">
					<input type="button" class="btn btn-primary btn-block" id="btn" value="카카오 로그인" style="width: 329px; height: 45px; background-color:#ffeb00;; border: solid #ffeb00 1px; font-size: 14px; font-weight: bold; padding-left: 54px; border-radius: 8px; color: #47292b; background: url(resources/img/mainimg//kakaoBack.png);">
					</a>
					</td>
				</tr>
				
				
				<!-- 회원가입 -->
				
				<tr align="center">
					<td class="joinMember">
					<a href="memberForm.bp"><input type="button" class="btn btn-primary btn-block" id="btn" style="width: 327px; height: 43px; font-size: 14px; font-weight: bold;" img="src:" value="회원가입 하러 GO!"
						></a>
					</td>
				</tr>
				
			</table>
		</form>
	<!-- 	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
	        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	        Kakao.init('1433179c9949a6df24709974fab3536e');
			
	        // SDK 초기화 여부를 판단합니다.
	        console.log("Kakao.isInitialized() >>> : " + Kakao.isInitialized());
	        function loginWithKakao() {
	            Kakao.Auth.login({
	              success: function(authObj) {
	                alert(JSON.stringify(authObj))
	              },
	              fail: function(err) {
	                alert(JSON.stringify(err))
	              },
	            })
	          }
    	</script> -->
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
		
		
	</body>
</html>