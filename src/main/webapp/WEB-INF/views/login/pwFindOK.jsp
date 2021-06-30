<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.brownpoodle.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 : 갈색푸들</title>
</head>
<body>
<script type="text/javascript">
<%
	Object obj = request.getAttribute("result");
	if(obj == null) return;
	
	// 형변환!!! 
	String result = obj.toString();
	System.out.println("jsp : result >>> : " + result);
	
	String msg = "";
	if(result == "pw_change_OK"){
		msg = "비밀번호가 정상적으로 변경 되었습니다. \n새 비밀번호로 로그인 해주세요.";
		%>
		location.href="login.bp";
		<%
	}else{
		msg = "비밀번호가 변경되지 않았습니다. 다시 시도해 주세요.";
	}
%>
</script>
<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%= msg %></result>	
</login>
</body>
</html>