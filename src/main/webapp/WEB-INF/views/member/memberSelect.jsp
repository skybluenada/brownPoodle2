<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.brownpoodle.member.vo.MemberVO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%
	Object obj = request.getAttribute("selectList");
	if (obj == null) return;
	
	List<MemberVO> list = (List<MemberVO>)obj;
	System.out.println("셀렉트jsp   list.size() >>> : " + list.size());
	
	MemberVO mvo = (MemberVO)list.get(0);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER SELECT</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">
<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
//---------------------------------------------------------		
		// 휴대전화
		var phone = '<%=mvo.getM_phone()%>';
		console.log("phone >>> : " + phone);
		var m_phone = phone.split('-');
		$('#m_phone2').val(m_phone[1]);
		$('#m_phone3').val(m_phone[2]);
		console.log("$('#m_phone2').val() : " + $('#m_phone2').val());
		console.log("$('#m_phone3').val() : " + $('#m_phone3').val());
		
		// 주소
		var addr = '<%=mvo.getM_addr()%>';
		console.log("addr >>> : " + addr);
		var m_addr = addr.split(' ');
		console.log("m_addr[0] >>> : " + m_addr[0]);
		console.log("m_addr[1] >>> : " + m_addr[1]);
		var m_addr1 = m_addr[0];
		$('#m_addr1').val(m_addr1).prop("selected", true);
		var m_addr2 = m_addr[1];
		$('#m_addr2').val(m_addr2).prop("selected", true);
		
//---------------------------------------------------------
		//multipart/form-data - 사진업로드
		// 수정하기 버튼 클릭 update_btn
		$(document).on("click", "#update_btn", function(){
			alert("회원정보를 수정합니다.");
			
			$("#memberSelect").attr({
				"action":"memberUpdate.bp",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
		
		// 탈퇴하기 버튼 클릭 delete_btn
		$(document).on("click", "#delete_btn", function(){
			alert("회원 탈퇴를 합니다.");
			
			$("#memberSelect").attr({
				"action":"memberDelete.bp",
				"method":"POST",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		// 비밀번호 변경하기 버튼 클릭  m_pw_btn
		$(document).on("click", "#m_pw_btn", function(){
			alert("새로운 비밀번호로 변경합니다.");
			
			/* $("#memberSelect").attr({
				"action":".bp",
				"method":"POST",
				"enctype":"application/x-www-form-urlencoded"
			}).submit(); */
		});
		
		
	}); // jQuery 영역 end 
	
</script>

</head>
<body>
회원 정보 조회
<hr>

<form name="memberSelect" id="memberSelect">

<table border="1" align="center">
<tr>
		<td colspan="2" align="center">
		<font size="4" style="color:Pink;">갈색 푸들</font>	
		</td>
	</tr>
		<tr>
		<td class="member">회원번호</td>
		<td><input type="text" name="m_num" id="m_num" value="<%= mvo.getM_num() %>" readonly /></td>
	 </tr>
	
	 <tr>
		<td class="member">아이디</td>
		<td>
			<input type="text" name="m_id" id="m_id" value="<%= mvo.getM_id() %>" readonly />
		</td>
	 </tr>
	 <tr>
		<td class="member">비밀번호</td>
		<td> <!-- type="password" -->
			<input type="hidden" name="m_pw" id="m_pw" value="<%= mvo.getM_pw() %>"  />
			<button type="button" name="m_pw_btn" id="m_pw_btn">비밀번호 변경</button><br/>
		</td>
	 </tr>
	 <tr>
		<td class="member">이메일</td>
		<td>
			<input type="text" name="m_email" id=m_email placeholder="직접입력" value="<%= mvo.getM_email() %>"/>
		</td>
	 </tr>
	<tr>
		<td class="member">이름</td>
		<td>
			<input type="text" name="m_name" id="m_name" value="<%= mvo.getM_name() %>"/>
		</td>
	 </tr>
	<tr>
		<td class="member">닉네임</td>
		<td>
			<input type="text" name="m_nick" id="m_nick" value="<%= mvo.getM_nick() %>"/>
		</td>
	 </tr>
	 <tr>
		<td class="member">프로필 사진</td>
		<td>
		<img src="resources/img/memberimg/<%= mvo.getM_photo() %>"><br>
		<input type="file" name="m_photo" id="m_photo" /><br>
		</td>
	 </tr>	 
	 <tr>
		<td class="member">휴대전화</td>
		<td>
			<select name="m_phone1" id="m_phone1">
	        	<option value="010" selected >010</option>
	         </select>
	         - <input type="text" name="m_phone2" id="m_phone2" size="2"/>
	         - <input type="text" name="m_phone3" id="m_phone3" size="2"/>
		</td>
	 </tr>
	 <tr>
	 	<td class="member">주소</td>
	 	<td>
	 		<select name="m_addr1" id="m_addr1" style="width:100px;margin-right:10px">
	        	 <option value="서울특별시">서울특별시</option>
	    	</select>
	    	<select name="m_addr2" id="m_addr2" style="width:100px;margin-right:10px">
	        	 <option value="구로구">구로구</option>
	        	 <option value="금천구">금천구</option>
	        	 <option value="강남구">강남구</option>
	    	</select>
	 	</td>
	 </tr>	 
	 <tr>
		 <td class="member">가입일자</td>
		 <td><%= mvo.getM_insertdate() %></td>
	 </tr>
	 <tr>
		 <td class="member">수정일자</td>
		 <td><%= mvo.getM_updatedate() %></td>
	 </tr>
	 <tr id="update">
		<td colspan="2"> 			
			<button type="button" id="update_btn">수정하기</button>
			<button type="button" id="delete_btn">탈퇴하기</button>
		</td>				
	 </tr>
</table>
</form>
</body>
</html>