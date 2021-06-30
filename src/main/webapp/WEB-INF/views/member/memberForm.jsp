<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/bootstrap2.css">
<link rel="stylesheet" href="resources/css/member_form.css" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- ---------- -->



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
     
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
//---------------------------------------------------------			
      // 아이디 중복확인 m_idBtn
      var bool = false;
      $("#m_idBtn").click(function(){
         //alert("중복체크 클릭 >>> : ");
         
         let m_idVal = $("#m_id").val();
         if (m_idVal == '') {
            alert("아이디를 입력하세요.");
            $("#m_id").focus();
            return false;
         }

         let url = "memberIdCheck.bp";
         
         $.get( url, {"m_id": m_idVal}, function(data){
            var msg = $(data).find("result").text();
            //alert(msg);
            bool = true;
         });
         
      });
//				"enctype":"multipart/form-data"
//---------------------------------------------------------
      // 비밀번호 체크  버튼 클릭시 pwCheck / m_pwCheck / m_pw
      var bool_2 = false;
      $("#pwCheck").click(function(){
         var pw = $("#m_pw").val();
         var pw2 = $("#m_pwCheck").val();
         if (pw == pw2) {
            alert("비밀번호가 같습니다.")
            $("#m_email").focus();
            bool_2 = true;
            return true;
         }else {
            alert("비밀번호가 다릅니다 .");
            pw.val("");
            pw2.val("");
            pw.focus();
            return false;
         }
      });
//---------------------------------------------------------
		// 휴대전화 체크 m_phone2
		$("#m_phone2").keyup(function(){
			var Number = /^[0-9]*$/;
			var m_phone2 = $("#m_phone2").val();
			if(!Number.test(m_phone2)) {
				alert("숫자만 입력하세요.");
				$('#m_phone2').val('');
			}
		});
		// 휴대전화 체크 m_phone3
		$("#m_phone3").keyup(function(){
			var Number = /^[0-9]*$/;
			var m_phone3 = $("#m_phone3").val();
			if(!Number.test(m_phone3)) {
				alert("숫자만 입력하세요.");
				$('#m_phone3').val('');
			}
		});
//---------------------------------------------------------		
      // 가입버튼 insert
      $(document).on("click", "#join_btn", function(){
         if ($("#m_id").val() == '') {
            alert("아이디를 입력하세요.");
            $("#m_id").focus();
            return false;
         }else if (bool == false) {
            alert("아이디 중복체크를 클릭하세요.");
            $("#m_id").focus();
            return false;
         }else if($("#m_pw").val() == ''){   
            alert("비밀번호를 입력하세요.")
            $("#m_pw").focus();
            return false;
         }else if (bool_2 == false) {
            alert("비밀번호를 재확인하세요.");
            $("#m_pwCheck").focus();
            return false;
         }else if($("#m_email").val() == ''){
            alert("이메일을 입력하세요.");
            $("#m_email").focus();
            return false;
         }else if($("#m_name").val() == ''){
            alert("이름을 입력하세요.");
            $("#m_name").focus();
            return false;
         }else if($("#m_nick").val() == ''){
            alert("닉네임을 입력하세요.");
            $("#m_nick").focus();
            return false;
         }else { alert("가입을 환영합니다!"); }
         
				$("#memberForm").attr({
					"action":"memberInsert.bp",
					"method":"POST",
					"enctype":"multipart/form-data"
				}).submit();
		});
//---------------------------------------------------------		
		
	});
</script>
</head>
<body>
<div>
<form name="memberForm" id="memberForm">

	<table class="login" style="float:left;">
	
	
		<!-- title -->
		<tr><td><h5 align="center"><img class="loginlogo" src="resources/img/mainimg/로그인로고.png" alt="로그인로고"></h5></td></tr>
	
	<!-- 회원번호 -->
	 <tr align="center">
			<td class="member">
				<div class="m_id_padding"><b>　회원번호</b><br></div>
				<input type="text" class="form-control" name="m_num" id="m_num" placeholder="자동으로 부여돼요!" style="width: 326px; height: 25px; float:left; margin-left: 116px; " readonly>
			</td>
	</tr>
		
	
	<!-- 아이디 -->
	<tr align="center">
		<td class="id">
				<div class="m_id_padding"><b>아이디</b><br></div>
				<input type="text" class="form-control" name="m_id" id="m_id"  style="width: 236px; height: 25px; float:left; margin-left: 116px; " >
				<input type="button" class="btn btn-primary btn-block" name="m_idBtn" id="m_idBtn" style="width:82px; height: 43px; margin-right:110px" value="중복체크">
		</td>
	</tr>
		
		
	<!-- 비밀번호 -->
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>　비밀번호</b><br></div>
				<input type="password" class="form-control" name="m_pw" id="m_pw"  style="width: 204px; height: 25px; float:left; margin-left: 116px; margin-bottom: 5px; "><br>
				<input type="password" class="form-control" name="m_pwCheck" id="m_pwCheck"  style="width: 204px; height: 25px; float:left; margin-left: 116px; ">
				<input type="button" class="btn btn-primary btn-block" name="pwCheck" id="pwCheck" style="width:119px; height: 43px; margin-right:110px; float:right" value="비밀번호 재확인">
		
		</td>
	</tr>	
	
	
	<!--  수정된 비밀번호 -->
	<!--  
	 <tr>
		<td class="member">비밀번호</td>
		<td>
			<input type="password" name="m_pw" id="m_pw" style="width:100px" /><br/>
			<input type="password" name="m_pwCheck" id="m_pwCheck" style="width:100px" placeholder="비밀번호 재확인"/>
         	<input type="button" value="비밀번호 재확인" id="pwCheck" /><br/>
		</td>
	 </tr>
	 -->
	 <!-- ====================== -->
	 
	 <!-- 이메일 -->
	 <tr align="center">
		<td class="member">
			<div class="m_id_padding"><b>이메일</b><br></div>
			<input type="text" class="form-control" name="m_email" id="m_email"  style="width: 326px; height: 25px; float:left; margin-left: 116px; " >
		</td>
	</tr>
	
	<!-- 이름 -->			
	<tr align="center">
		<td class="member">
			<div class="m_id_padding"><b> 이름　</b><br></div>
			<input type="text" class="form-control" name="m_name" id="m_name"  style="width: 326px; height: 25px; float:left; margin-left: 116px; ">
		</td>
	</tr>			
			
			
	<!-- 닉네임 -->
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>닉네임</b><br></div>
				<input type="text" class="form-control" name="m_nick" id="m_nick"  style="width: 326px; height: 25px; float:left; margin-left: 116px; ">
		</td>
	</tr>	
	
	<!-- 사진 -->
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>　　      프로필 사진</b><br></div>
						
				<span class="filebox">
 				<label for="m_photo">사진 선택</label>
  				<input type="file" name="m_photo" id="m_photo">
				</span>
		</td>
	</tr>	
	
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>핸드폰</b><br></div>
						
				<select name="m_phone1" id="m_phone1" style="padding-left: 7px; margin-left: 100px;">
	        	<option value="010" selected>010</option>
	         	</select>
	         			
	         			 
				<input type="text" class="form-control" name="m_phone3" id="m_phone3" style="width: 100px; height: 25px; float: right; margin-right: 114px;">
				<input type="text" class="form-control" name="m_phone2" id="m_phone2" style="width: 100px; height: 25px; float: right; margin-right: 14px;">
		</td>
	</tr>


	
 	<!-- 혹시몰라서... -->
	 <!-- <tr>
		<td class="member">휴대전화</td>
		<td>
			<select name="m_phone1" id="m_phone1">
	        	<option value="010" selected>010</option>
	         </select>
	         - <input type="text" name="m_phone2" id="m_phone2" size="2"/>
	         - <input type="text" name="m_phone3" id="m_phone3" size="2"/>
		</td>
	 </tr>  -->
	 
	 <!-- 주소 -->
	 <tr align="center">
		<td class="member">
			<div class="m_id_padding"><b>주소　</b><br></div>
						
			<select name="m_addr1" id="m_addr1" style="width: 210px; padding-left: 7px; margin-left: -2px;">
	        <option value="서울특별시" selected>서울특별시</option>
	         </select>
	         			
	         <select name="m_addr2" id="m_addr2" style="width:105px; padding-left: 8px; margin-left: 7px;">
	        <option value="구로구">구로구</option>
	        <option value="금천구">금천구</option>
	        <option value="강남구">강남구</option>
	         </select>		 
						
		</td>
	</tr>
	 
	 
	 <tr align="center">
		<td>
			<input type="button" class="btn btn-primary btn-block" id="join_btn" style="width: 327px; height: 43px; font-size: 16px; margin-top: 20px; margin-bottom: 43px; padding-top: 12px; padding-bottom: 38px;" value="가입하기">
		</td>
	</tr>
				
	
	 </table>
</form>
</div>
</body>
</html>