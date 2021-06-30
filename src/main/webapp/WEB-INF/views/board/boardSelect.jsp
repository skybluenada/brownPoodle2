<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.brownpoodle.board.vo.BoardVO" %>



<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 상세보기 - 게시글 제목 넣기</title>
	
	
	<!-- ================================================= -->
	<link rel="stylesheet" href="resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/rboard.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap_re.css">
	<link rel="stylesheet" href="resources/css/rboard_re.css" type="text/css">
	<link rel="stylesheet" href="resources/css/main_re.css" type="text/css">
	<!-- ================================================= -->
	
	
	<link rel="stylesheet" href="/resources/css/board.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			// 게시글 수정 페이지로 이동
			$(document).on('click', '#update_btn', function () {
				//alert('게시글 수정 버튼 이벤트 진입!');

				let num = $('#b_num').val();
				//alert('수정할 게시글 번호: ' + num);

				$('#boardForm').attr({
					'method': 'GET',
					'action': 'boardUpdateForm.bp?b_num=' + num,
					'enctype': 'application/x-www-form-urlencoded'
				}).submit();
			});

			// 삭제하기 : 삭제 -> 전체보기 페이지로 이동 
			$(document).on("click", "#delete_btn", function () {
				let deleteURL = "boardDelete.bp";
				let reqType = "POST";
				let dataParam = {
					b_num: $("#b_num").val()
				};

				//alert("dataParam >>> : " + dataParam);
				if (confirm('게시글을 삭제하시겠습니까?') == true) {
					$.ajax({
						url: deleteURL,
						type: reqType,
						data: dataParam,
						success: whenSuccess,
						error: whenError
					});

					function whenSuccess(resData) {
						if ("DELETE_OK" == resData) {
							alert("삭제가 완료되었습니다.");
							location.href = "boardSelectAll.bp";
						} else if ("DELETE_FAIL" == resData) {
							alert("삭제가 실패하였습니다.");
						};
					}

					function whenError(e) {
						//alert("error e >>> : " + e.responseText);
					}
				} else {
					return;
				}

			}); // 게시글 삭제 이벤트 end
		}); // jQuery end
	</script>

</head>

<body>
	<!-- =================================================================== -->
	<table class="logot">
	
		<tr class="logotr">
			<td class="logotd">
				<div class="logotdh">
				<a href="boardSelectAll.bp"><img alt="logo" src="resources/img/mainimg/로고집.png"></a>
				</div>
			</td>
			
			<td class="logotd">
				<div class="logotdtext">
				<a href="boardSelectAll.bp"><img alt="logoname" src="resources/img/mainimg/로고네임.png"></a>
				</div>
			</td>
			
			<!-- 상단 아이콘 -->
			<td class="logotd">
				<div class="logotdicon1">
				<img alt="icon1" src="resources/img/mainimg/상단1.png">
				</div>
			</td>
			<td class="logotd">
				<div class="logotdicon2">
				<img alt="icon2" src="resources/img/mainimg/상단2.png">
				</div>
			</td>
			<td class="logotd">
				<div class="logotdicon3">
				<img alt="icon3" src="resources/img/mainimg/상단3.png">
				</div>
			</td>
			
			<!-- 로그인 -->
			
			<td class="logotd"><div class="logotdlogin"><a href="indexlogin.jsp">로그인</a></div></td>
			<td class="logotd">
			<div class="logotdloginp"><img alt="login" src="resources/img/mainimg/상단로그인.png"></div>
			</td>
		</tr>
	</table>
	
	<!-- 왼쪽사이드 -->
	<table class="leftside" style="float:left;">
		<tr>
			<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/글쓰기.png"></td><td class="leftsidetext"><a href="boardInsertForm">글쓰기</a></td>
		</tr>
	
		<tr>
			<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/다이어리.png"></td><td class="leftsidetext"><a href="calendar">펫 다이어리</td>
		</tr>
		<tr>
			<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/산책.png"></td><td class="leftsidetext"><a href="walkMain">산책 하기</td>
		</tr>
		<tr>
			<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/업체정보.png"></td><td class="leftsidetext"><a href="ion">업체 정보</a></td>
		</tr>
		<tr>
			<td colspan="2" class="leftsidetd"><img alt="write" src="resources/img/mainimg/사이드줄.png"></td>
		</tr>
	</table>
	
	<!-- =================================================================== -->


	<% request.setCharacterEncoding("UTF-8");%>
	<%
	// session 로그인상태 가져오기 
	HttpSession bpSession = request.getSession(false);
	String nick = "";
	
	if(bpSession != null){
		System.out.println("session 존재함 !!!!!!");
		nick = String.valueOf(bpSession.getAttribute("m_nick"));
		// String sM_id = String.valueOf(bpSession.getAttribute("m_id"));
		// System.out.println("sM_id >>> : " + sM_id);
		System.out.println("nick >>> : " + nick);
		
	} else {
		
	}
	
	//aListAll 속성의 객체 가져오기 - 전체 조회 결과 담은 list
	Object obj = request.getAttribute("listS");
	if (obj == null) {
		out.println("<script>alert('게시글이 존재하지 않습니다.');");	
		out.println("location.href='boardSelectAll.bp';");
		out.println("</script>");
	}

	List<BoardVO> listS = (List<BoardVO>)obj;

	int nCnt = listS.size();
	// out.println(" * 선택한 게시글 수 (nCnt) : " + nCnt);
	
	// 수정할 게시글의 데이터 담을 변수 선언 및 초기화
	String num = "";
	String subject = "";	
	String name = "";
	String content = "";
	String file = "";
	String hate = "";
	String like = "";
	String deleteyn = "";
	String insertdate = "";
	String updatedate = "";
	
	if (nCnt == 1) {
		BoardVO bvo = listS.get(0);
		
		num = bvo.getB_num();
		subject = bvo.getB_subject();
		name = bvo.getB_name();
		content = bvo.getB_content();
		file = bvo.getB_file();
		hate = bvo.getB_hate();
		like = bvo.getB_like();
		deleteyn = bvo.getB_deleteyn();
		insertdate = bvo.getB_insertdate();
		updatedate = bvo.getB_updatedate();
	}
	
	// likeCheck
	String src = "";
	Object obj2 = request.getAttribute("likeCheck");
	
	int likenCnt = (int)obj2;
	// int likenCnt = 0;
	System.out.println("boardDebugForm likenCnt >>> : " + likenCnt);

	if (likenCnt == 0) {
		src="/resources/img/defaultimg/heart_n.png";
	}else {
		src="/resources/img/defaultimg/heart_y.png";
	}
%>

	<!--
	name을 not null 처리한다면 id 컬럼 추가없이 name으로 세션확인 후 수정/삭제 가능
	https://doublesprogramming.tistory.com/211
 -->
 <div>
 <form id="boardForm" name="boardForm">
	<table class="board">
		<tr>
			<td class="boardprofile">
				<img class="profile_img" src="/resources/img/defaultimg/default_profile.png" alt="profile">
			</td>
			<td class="boardprofilname" colspan="4">
				<%= name %><br>
				<div class="boardprofiltime"><%= insertdate %></div>
			</td>
		</tr>
		<%
		if ((file != null) && !"-".equals(file) && !"".equals(file)) {		
%>
		<tr>
			<td class="boardtd" colspan="5">
				<div class="boardphoto"><img class="photo" alt="photo" src="/resources/img/boardimg/<%= file %>"></div>
			</td>
		</tr>
		<%
		}
%>
		<tr>
			<td class="boardcontent" colspan="5"><%= content %></td>
		</tr>
		<tr>
			<td class="boardtd" colspan="5">
				<div class="boardline"><img alt="line" src="resources/img/defaultimg/line.png"></div>
			</td>
		</tr>
		<tr>
			<div class="boardfoot">
				<td colspan="2" class="boardlike" width="5px"><img class="boardlike_img" alt="like"
						src="<%= src %>" width="20" height="20"></td>
				<td class="boardlikecount">좋아요 <%= like %>개</td>
				<td class="boardre"><img alt="photo" src="resources/img/defaultimg/reply.png"></td>
				<td class="boardrewrite">댓글쓰기</td>
				<td class="boardreport">신고</td>
			</div>
		</tr>
	</table>
<%
				if (name.equals(nick)) {
%>
	<span class="edit">
		<input type="hidden" name="b_num" id="b_num" value="<%=num %>">
		<input type="button" id="update_btn" value="수정">
		<input type="button" id="delete_btn" value="삭제">
	</span>
<%
				}
%>
</form>
</div>
<div class="rboard_include">
		<jsp:include page="../rboard/rboard.jsp" flush="true">				
			<jsp:param name="b_num" value="<%= num %>"/>
			<jsp:param name="nick" value="<%= nick %>"/>
		</jsp:include>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>