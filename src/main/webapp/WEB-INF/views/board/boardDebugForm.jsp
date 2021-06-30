<%@page import="com.brownpoodle.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update, Delete, Like</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		 
		// ==========================수정, 삭제 디버깅============================
		// 수정하기
		$(document).on("click", "#update", function(){
			$("#boardDebugForm").attr({
				"method" : "POST",
				"action" : "boardUpdate.bp"
			}).submit();
		});
		
		// 삭제하기 : 삭제 -> 전체보기 페이지로 이동 
		$(document).on("click", "#delete", function(){
		
			let deleteURL = "boardDelete.bp";
			let reqType = "POST";
			let dataParam = {
					b_num : $("#b_num").val()
			};
			
			alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url : deleteURL,
				type : reqType,
				data : dataParam,
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess(resData) {
				if ("DELETE_OK" == resData) {
					alert("삭제가 완료되었습니다.");
					location.href="boardInsertForm.bp";
				}else if ("DELETE_FAIL" == resData) {
					alert("삭제가 실패하였습니다.");
					location.href="boardInsertForm.bp";
				};
			}
			function whenError(e) {
				alert("error e >>> : " + e.responseText);
			}
		});
		
		
		// ==========================좋아요 디버깅============================
		// 좋아요 버튼 눌렀을 때, ajax 처리
		$(document).on("click", "#like_img", function(){
			
			let likeclickURL = "boardLikeCheck.bp";
			let reqType ="POST";
			let dataParam = {
					
			};
			
			$.ajax({
				
			});
		});
		
	});
</script>

</head>
<body>
<% request.setCharacterEncoding("EUC-KR");%> 

<h1>Update, Delete 디버깅</h1>

<!-- UPDATE, DELETE : 제목, 내용, 글번호 -->
<div>
	<form name="boardDebugForm" id="boardDebugForm">
		글번호 : <input type="text" name="b_num" id="b_num"><br>
		제목 : <input type="text" name="b_subject" id="b_subject"><br>
		내용 : <input type="text" name="b_content" id="b_content"><br>
	
		<button type="button" id="update">수정하기</button>
		<button type="button" id="delete">삭제하기</button>
 	</form>
</div>
<hr><p>

<!-- 좋아요 
		로그인한 회원번호 
		게시글 번호 
-->
<h1>좋아요♡->♥ 디버깅</h1>
<div>
	<form name="likeForm" id="likeForm">

<%
	// likeSelect
	Object obj1 = request.getAttribute("likeSelect");
	List<BoardVO> list1 = (List)obj1;
	BoardVO bvo = null;
	if (list1.size() == 1) {
		bvo = list1.get(0);
	};
	
	// likeCheck
	String src = "";
	Object obj2 = request.getAttribute("likeCheck");
	//int nCnt = Integer.valueOf(obj2);
	int nCnt = (int)obj2;
	System.out.println("boardDebugForm nCnt >>> : " + nCnt);
	if (nCnt == 0) {
		src="/resources/img/boardimg/heart_n.png";
	}else {
		src="/resources/img/boardimg/heart_y.png";
	}
%>
		<button type="button" name="like_img" id="like_img" value="<%= nCnt %>"
		        style="width:40px; height:40px">
			<img src="<%= src %>" alt="좋아요이미지"
			     style="width:30px; height:30px">
		</button>
		<br>
		
		<input type="text" name="b_like" id="b_like" value="<%= bvo.getB_like() %>"> <!-- 좋아요 수 -->
	</form>
</div>

</body>
</html>