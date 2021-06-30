<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.brownpoodle.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID CHECK</title>
</head>
<body>
ID CHECK
<hr>
<%
	Object obj = request.getAttribute("msg");
	//if(obj == null) return;
	String msg = (String)obj;
%>
<?xml version='1.0' encoding='UTF=8'?>
<idCheck>
	<result><%= msg %></result>
</idCheck>
</body>
</html>