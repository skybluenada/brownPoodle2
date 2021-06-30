<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 이메일 체크 : 갈색푸들</title>
	</head>
	<body>
		Email Check
		<hr>
		<% request.setCharacterEncoding("UTF-8"); %>
		<%
			Object obj = request.getAttribute("authnum");
			if(obj == null) return;
			
			String authnum = obj.toString();
			String authnumStr = "메일을 확인하시고, 인증번호를 입력하세요";
		%>
		<?xml version='1.0' encoding='UTF-8'?>
		<login>
			<result><%= authnumStr %></result>
		</login>
	</body>
</html>