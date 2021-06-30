<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<style type="text/css">
div {margin: 50px 0px 0px 100px;}
.member{text-align: center;}
</style>      
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
//---------------------------------------------------------			
		// 아이디 중복확인 m_idBtn
		$("#m_idBtn").click(function(){
			alert("중복체크 클릭 >>> : ");
			
			let m_idVal = $("#m_id").val();
			if (m_idVal == '') {
				alert("아이디를 입력하세요.");
				$("#m_id").focus();
				return false;
			}

			let url = "memberIdCheck.bp";
			
			$.get( url, {"m_id": m_idVal}, function(data){
				var msg = $(data).find("result").text();
				alert(msg);
			});
			
			/* $("#m_idBtn").attr({
				"action":"memberIdCheck.ys",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit(); */
		});
//---------------------------------------------------------
//---------------------------------------------------------		
		// 가입버튼 insert
		$(document).on("click", "#join_btn", function(){
			alert("가입을 환영합니다!");
			
			$("#memberForm").attr({
				"action":"memberInsert.ys",
				"method":"POST",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
//---------------------------------------------------------		
		
	});
</script>
</head>
<body>
<div>
<form name="memberForm" id="memberForm">
	<h2>회원가입</h2>
	<hr>
	<table border="1">
	<tr>
		<td colspan="2" align="center">
		<font size="4" style="color:Pink;">갈색 푸들</font>	
		</td>
	</tr>
		<tr>
		<td class="member">회원번호</td>
		<td><input type="text" name="m_num" id="m_num" placeholder="입력불가" readonly /></td>
	 </tr>
	
	 <tr>
		<td class="member">아이디</td>
		<td>
			<input type="text" name="m_id" id="m_id" placeholder="아이디체크" style="width:100px" />
			<input type="button" name="m_idBtn" id="m_idBtn" value="중복확인"  />
		</td>
	 </tr>
	 <tr>
		<td class="member">비밀번호</td>
		<td>
			<input type="text" name="m_pw" id="m_pw" style="width:100px" /><br/>
		</td>
	 </tr>
	 <tr>
		<td class="member">이메일</td>
		<td>		
			<input type="text" name="m_email" id=m_email style="width:170px" placeholder="직접입력"/>    	   
		</td>
	 </tr>
	<tr>
		<td class="member">이름</td>
		<td><input type="text" name="m_name" id="m_name"/></td>
	 </tr>
	<tr>
		<td class="member">닉네임</td>
		<td><input type="text" name="m_nick" id="m_nick"/></td>
	 </tr>
	 <tr>
		<td class="member">프로필 사진</td>
		<td> 
			<input type="file" name="m_photo"  /><br>
	    </td>
	 </tr>	 
	 <tr>
		<td class="member">휴대전화</td>
		<td>
			<select name="m_phone1" id="m_phone">
	        	<option value="010">010</option>
	        	<option value="011">011</option>
	        	<option value="016">016</option>
	        	<option value="017">017</option>		        	
	         </select>
	         - <input type="text" name="m_phone2" id="m_phone1" size="2"/>
	         - <input type="text" name="m_phone3" id="m_phone2" size="2"/>
		</td>
	 </tr>
	 <tr>
	 	<td class="member">주소</td>
	 	<td>
	 		<select name="m_city" id="m_city" style="width:100px;margin-right:10px">
	        	 <option value="0" selected>서울특별시</option>
	    	</select>
	    	<select name="m_addr" id="m_addr" style="width:100px;margin-right:10px">
	        	 <option value="0">종로구</option>
	        	 <option value="1">중구</option>
	        	 <option value="2">용산구</option>
	        	 <option value="3">성동구</option>
	        	 <option value="4">광진구</option>
	        	 <option value="5">동대문구</option>
	        	 <option value="6">중랑구</option>
	        	 <option value="7">성북구</option>
	        	 <option value="8">강북구</option>
	        	 <option value="9">도봉구</option>
	        	 <option value="10">노원구</option>
	        	 <option value="11">은평구</option>
	        	 <option value="12">서대문구</option>
	        	 <option value="13">마포구</option>
	        	 <option value="14">양천구</option>
	        	 <option value="15">강서구</option>
	        	 <option value="16">구로구</option>
	        	 <option value="17">금천구</option>
	        	 <option value="18">영등포구</option>
	        	 <option value="19">동작구</option>
	        	 <option value="20">관악구</option>
	        	 <option value="21">서초구</option>
	        	 <option value="22">강남구</option>
	        	 <option value="23">송파구</option>
	        	 <option value="24">강동구</option>
	    	</select>
	 	</td>
	 </tr>	 
	 <tr id="join">
		<td colspan="2"> 			
			<button type="button" id="join_btn">가입하기</button>
		</td>				
	 </tr>
	 </table>
</form>
</div>
</body>
</html>