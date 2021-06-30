<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.brownpoodle.pet.vo.PetVO" %>
<%@page import="java.util.List" %>
	<%
		Object obj = request.getAttribute("selectList");
		if (obj == null) return;
		
		List<PetVO> list = (List<PetVO>)obj;
		System.out.println("동물셀렉트  list.size() >>> : " + list.size());
		
		PetVO pvo = (PetVO)list.get(0);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET SELECT</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// --------------------------------------------
		// 성별
		var gender = '<%=pvo.getP_gender()%>';
		console.log("gender >>> : " + gender);
		$(p_gender).val(gender).prop("selected", true)
		
		// 종류 타입
		var type = '<%=pvo.getP_type()%>';
		console.log("type >>> : " + type);
		$(p_type).val(type).prop("selected", true)
		
		// --------------------------------------------
		// 수정하기 버튼 클릭 update_btn
		$(document).on("click", "#update_btn", function(){
			alert("동물 정보를 수정합니다.");
			
			$("#petForm").attr({
				"action":"petUpdate.bp",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
			
		});
		// --------------------------------------------
		// 삭제하기 버튼 클릭 delete_btn
		$(document).on("click", "#delete_btn", function(){
			alert("동물 정보를 삭제합니다.");
			
			$("#petForm").attr({
				"action":"petDelete.bp",
				"method":"POST",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
	});
</script>
</head>
<body>
<div>
<form name="petForm" id="petForm">
<table border="1">
	<h2>반려동물 조회</h2>
	<hr>

	<tr>
		<td colspan="2" align="center">
		<font size="4" style="color:Pink;">갈색 푸들</font>	
		</td>
	</tr>
	<tr>
		<td class="pet">동물 번호</td>
		<td><input type="text" name="p_num" id="p_num" value="<%= pvo.getP_num() %>" readonly /></td>
	</tr>
	 <tr>
		<td class="pet">동물 이름</td>
		<td>
			<input type="text" name="p_name" id="p_name" placeholder="필수입력" value="<%= pvo.getP_name() %>" />
		</td>
	 </tr>
	 <tr>
		<td class="pet">동물 나이</td>
		<td>
			<input type="text" name="p_age" id="p_age" value="<%= pvo.getP_age() %>"/><br/>
		</td>
	 </tr>
	 <tr>
		<td class="pet">동물 성별</td>
		<td>
			<select	 name="p_gender" id="p_gender">
			<option value="F" selected>여자</option>
			<option value="M" >남자</option>
	        </select>
		</td>
	 </tr>
	<tr>
		<td class="pet">동물 종류</td>
		<td>
			<select	 name="p_type" id="p_type">
			<option value="dog" >강아지</option>
			<option value="cat" >고양이</option>
			<option value="else" >기타</option>
	        </select>
		</td>
	 </tr>
	<tr>
		<td class="pet">동물 품종</td>
		<td><input type="text" name="p_variety" id="p_variety"/ value="<%= pvo.getP_variety() %>"></td>
	 </tr>
	 <tr>
		<td class="pet">프로필 사진</td>
		<td>
		<img src="resources/img/petimg/<%= pvo.getP_photo() %>">
		<input type="file" name="p_photo" id="p_photo"  /><br>
		</td>
	 </tr>	 
	<tr>
		<td class="pet">동물 등록번호</td>
		<td><input type="text" name="p_regnum" id="p_regnum" value="<%= pvo.getP_regnum() %>" /></td>
	 </tr>
	 <tr id="insert">
		<td colspan="2"> 			
			<button type="button" id="update_btn">수정하기</button>
			<button type="button" id="delete_btn">삭제하기</button>
		</td>				
	 </tr>
</table>
</form>
</div>
</body>
</html>