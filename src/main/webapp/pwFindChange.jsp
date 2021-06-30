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
	
	$(function(){ 
		$("#right").hide(); 
		$("#wrong").hide(); 
		$("#m_pw_r").keyup(function(){ 
			var pwd1=$("#m_pw").val(); 
			var pwd2=$("#m_pw_r").val(); 
			if(pwd1 != "" && pwd2 != ""){ 
				if(pwd1 == pwd2){ 
					$("#right").show();
					$("#wrong").hide();
					
				}else{ 
					$("#right").hide();
					$("#wrong").show(); 
					
				} 
			} 
		}); 
	});

	$(document).ready(function(){
		//alert("ready >>> 클릭 이벤트 ");		
			$("#btn").click(function(){
				//alert("btn >>> 클릭 이벤트");
				console.log("btn >>> 클릭 이벤트");
				
				let midVal = $("#m_id").val();
				let mpwVal = $("#m_pw").val();
				let mpw_rVal = $("#m_pw_r").val();
				let url = "pwFindOK.bp";
				console.log("midVal >>> " + midVal);
				
				$.ajax({
					"url" : url 
				   ,"type" : "GET" 
				   ,"data" : {"m_id" : midVal, "m_pw" : mpwVal, "m_pw_r" : mpw_rVal} 
				   ,"success" : function(data){
					   			//alert(data);
								//alert("통신 성공");
								var msg = $(data).find("result").text();
								alert(msg);
								location.href="login.bp";
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
 
 
 
<img src="resources/img/mainimg/아이디찾기로고.png" class="logo" alt="로고">
<!-- 로그인 --> 
<form name="pwChangeForm" id="pwChangeForm"> 
			<table class="login" style="float:left;">
				<tr><td class="idCheck" colspan="2" align="center"><img class="idCheckImg" src="resources/img/mainimg/lock.png" alt="비밀번호 찾기"></td></tr>
				<tr><td align="center" style="font-weight: bold;font-size: 19px; padding-bottom: 18px;">비밀번호 찾기</td></tr>
				
				
				
				
				<tr align="center">
					<td class="name" colspan="2" style="padding-left: 101px;">
						<input type="password" class="buttonCss" name="m_pw" id="m_pw" placeholder="새비밀번호"  style="width:233px; height: 25px;" >
					</td>
				</tr>
				
				
				<tr align="center">
					<td class="name" colspan="2" style="padding-left: 101px;">
						<input type="password" class="buttonCss" name="m_pw_r" id="m_pw_r" placeholder="새비밀번호 확인"  style="width:233px; height: 25px;" >
					</td>
				</tr>
				
				<tr style="height:25px;">	
					<td style="text-align: center; padding-bottom: 28px; padding-top: 16px;">
					<div class="right" id="right" style="font-size:12px; color:blue">비밀번호가 일치합니다.</div> 
					<div class="wrong" id="wrong" style="font-size:12px; color:red">비밀번호가 일치하지 않습니다.</div>
					</td>
				</tr>
				
				
				
			

				<tr>
					<td class="auth_num" align="center" style="padding-right: 122px; padding-bottom: 26px;">
					<span class="nextId">
					<button type="button" id=btn" class="btn btn-primary btn-block" style="width: 107px; height: 31px; margin-bottom: 7px;">
					다음</button>
					<input type="hidden" name="m_id" id="m_id" value=${memberVO.m_id}>
					</td>
					</span>
				</tr>
		
				
				
				
			</table>
		</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>