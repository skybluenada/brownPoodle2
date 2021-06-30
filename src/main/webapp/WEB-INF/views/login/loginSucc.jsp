<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 : 갈색푸들</title>
	</head>
	<body>
		<% request.setCharacterEncoding("UTF-8");%>
		<%
			HttpSession bpSession = request.getSession(false);
			String m_id = request.getParameter("m_id");
			
			if(bpSession != null){
				String sM_id = String.valueOf(bpSession.getAttribute("m_id"));
				String m_nick = (String)bpSession.getAttribute("m_nick");
				String m_photo = (String)bpSession.getAttribute("m_photo");
				
				System.out.println("sM_id >>> : " + sM_id);
				System.out.println("m_id >>> : " + m_id);
				System.out.println("m_nick >>> : " + m_nick);
				System.out.println("m_photo >>> : " + m_photo);
				if(m_nick != null){
					
		%>
					<h5 align="center">
						<img alt="사진" src="<%=m_photo%>" width="100">
						 <%=m_nick %>님이 로그인 중입니다
					</h5>
		<%
				}
			}
		%>
		
		<table>
			<tr align="center">
				<td><a href="logout.bp">로그아웃</a></td>
			</tr>
		</table>
		
		<script>
			location.href = "/boardSelectAll.bp";
		</script>
		
	</body>
</html>