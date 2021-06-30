<%@page import="com.brownpoodle.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("mmvo");
	if (obj == null) return;
	MemberVO mvo = (MemberVO)obj;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET FORM</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/bootstrap2.css">
<link rel="stylesheet" href="resources/css/member_form.css" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- ---------------------- -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// --------------------------------------------
		// 동물 나이 체크 p_age
		$("#p_age").keyup(function(){
			var ageNumber = /^[0-9]*$/;
			var p_age = $("#p_age").val();
			if(!ageNumber.test(p_age)) {
				alert("0에서 99까지의 숫자만 입력하세요.");
				$("#p_age").val('');
			}
		});
		// --------------------------------------------
		// 등록하기 버튼 클릭 insert_btn
		$(document).on("click", "#insert_btn", function(){
			if ($("#p_name").val() == '') {
	            alert("동물의 이름을 입력하세요.");
	            $("#p_name").focus();
	            return false;
			}else { alert("동물 정보를 등록합니다."); }
			
			$("#petForm").attr({
				"action":"petInsert.bp",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
		// --------------------------------------------
		// 나중에 등록 버튼 클릭 
		$(document).on("click", "#pass_btn", function(){
			$("#petForm").attr({
				"action":"login.bp",
				"method":"GET",
				"enctype":"multipart/form-data"
			}).submit();
			
		});
		// --------------------------------------------
	});
</script>
</head>
<body>
<div>
<form name="petForm" id="petForm">
<table class="login" style="float:left;">

	<!-- 타이틀 -->
	<tr><td><h5 align="center"><img class="loginlogo" src="resources/img/mainimg/로그인로고.png" alt="로그인로고"></h5></td></tr>
	
	<!-- 동물 번호 -->
 	<tr align="center"> 
		<td class="member">
			<div class="m_id_padding"><b>　동물번호</b><br></div>
			<input type="text" class="form-control" name="p_num" id="p_num" placeholder="자동으로 부여돼요!" style="width: 326px; height: 25px; float:left; margin-left: 116px; " readonly>
			<input type="hidden" name="m_num" id="m_num" value="<%= mvo.getM_num()%>">
		</td>
	</tr>
	
	
	<!-- 동물 이름 -->	
	<tr align="center">
		<td class="member">
			<div class="m_id_padding"><b>　동물 이름</b><br></div> 
			<input type="text" class="form-control" name="p_name" id="p_name" placeholder="필수입력"  style="width: 326px; height: 25px; float:left; margin-left: 116px;" >
		</td>
	</tr>

	<!-- 동물 나이 -->
	<tr align="center">
		<td class="member">
			<div class="m_id_padding"><b>　동물 나이</b><br></div>
			<input type="text" class="form-control" name="p_age" id="p_age" maxlength="2" placeholder="0~99세까지 입력" style="width: 326px; height: 25px; float:left; margin-left: 116px; ">
		</td>
	</tr>
			
			
	<!-- 동물 성별 -->	
	<tr align="center">
		<td class="member">
			<div class="m_id_padding"><b> 　　 동물 성별　</b><br></div>
			<select name="p_gender" id="p_gender" style="padding-left: 9px; margin-left: 2px; width:326px;">
	        <option value="F" selected>여자</option>
	        <option value="M" >남자</option>
	         </select>
		</td>
	</tr>	
	
	
	<!-- 동물 종류 -->		
	
	<tr align="center">
		<td class="member">
			<div class="m_id_padding"><b> 　　 동물 종류　</b><br></div>
			<select name="p_type" id="p_type" style="padding-left: 9px; margin-left: 2px; width:326px;">
	        <option value="dog" selected>강아지</option>
	        <option value=cat" >고양이</option>
	        <option value=else" >기타</option>
	         </select>
		</td>
	</tr>	
	
	
	<!-- 동물 품종 -->	
	
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>　 동물 품종</b><br></div>
				<input type="text" class="form-control" name="p_variety" id="p_variety"  style="width: 326px; height: 25px; float:left; margin-left: 116px; ">
		</td>
	</tr>
	
	<!-- 프로필 사진 -->
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>　　      프로필 사진</b><br></div>
						
				<span class="filebox">
 				<label for="p_photo">사진 선택</label>
  				<input type="file" name="p_photo" id="p_photo">
				</span>
		</td>
	</tr>
	
	<!-- 동물 등록번호 -->
	<tr align="center">
		<td class="member">
				<div class="m_id_padding"><b>　　　동물 등록번호</b><br></div>
				<input type="text" class="form-control" name="p_regnum" id="p_regnum"  style="width: 326px; height: 25px; float:left; margin-left: 116px; ">
		</td>
	</tr>	 
	 
	 <!-- 등록 -->
	<tr align="center" id="insert">
		<td>
			<input type="button" class="btn btn-primary btn-block" id="insert_btn" style="width: 160px; height: 43px; font-size: 16px; margin-top: 20px; margin-bottom: 43px; padding-top: 12px; padding-bottom: 38px;" value="등록하기">
			<input type="button" class="btn btn-primary btn-block" id="pass_btn" style="width: 160px; height: 43px; font-size: 16px; margin-top: 20px; margin-bottom: 43px; padding-top: 12px; padding-bottom: 38px;" value="나중에 하기">
		</td>
	</tr>


</table>
</form>
</div>
</body>
</html>