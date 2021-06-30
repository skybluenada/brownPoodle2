<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="org.json.simple.JSONObject" %>
 <%@ page import="org.json.simple.JSONArray" %>
 <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>캘린더 : 갈색푸들</title>
</head>
<body>
<%
	Object obj = request.getAttribute("jsonCalendar");
	JSONArray jsonCalendar = null;	
	if(obj!=null){
		jsonCalendar = (JSONArray)obj;
		System.out.println("jarr >>> : " + jsonCalendar);
		out.println("jarr >>> : " +jsonCalendar);
	}
	
	Object obj1 = request.getAttribute("nCnt");
	if(obj1!=null){
		int nCnt = ((Integer)obj1).intValue();
		out.println("nCnt >>> : " + nCnt);
	}
	
%>
</body>
</html>
<?xml version='1.0' encoding='UTF-8'?>
<calendar>
	<result><%= jsonCalendar %></result>	
</calendar>
</body>