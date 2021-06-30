<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 : 갈색푸들</title>
</head>
<body>
인증번호 확인
<hr>
<%
	Object obj = request.getAttribute("pw_auth_num");
	Object obj_msg = request.getAttribute("msg");
	if(obj == null) return;
	
	// 형변환!!! 
	String pw_auth_num = obj.toString();
	String msg = obj_msg.toString();
	System.out.println("jsp : pw_auth_num >>> : " + pw_auth_num);
%>
<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%= msg %></result>	
</login>
</body>
</html>