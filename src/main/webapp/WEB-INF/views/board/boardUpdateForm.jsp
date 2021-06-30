<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.brownpoodle.board.vo.BoardVO" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 수정하기</title>
	
	<!-- ================================================= -->
	<link rel="stylesheet" href="resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<!-- ================================================= -->
	
	
	<style>
		table {
			border-collapse: collapse;
			border: 1px solid black;
			width: 500px;
			margin: auto;
		}

		tr td {
			border: 1px solid black;
		}

		article {
			width: 500px;
			border: 1px solid black;
		}

		img {
			width: 500px;
			object-fit: contain;
		}

		.profile_img {
			width: 20px;
		}

		.report {
			float: right;
		}

		.edit {
			float: right;
		}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			alert('jQuery 영역 진입!');

			$(document).on('click', '#update_btn', function () {
				alert('게시글 수정완료 버튼 이벤트 진입!');

				$('#boardWrite').attr({
					'method': 'POST',
					'action': 'boardUpdate.bp',
					'enctype': 'application/x-www-form-urlencoded'
				}).submit();
			});

			// 삭제하기 : 삭제 -> 전체보기 페이지로 이동 
			$(document).on("click", "#delete_btn", function(){
				let deleteURL = "boardDelete.bp";
				let reqType = "POST";
				let dataParam = {
						b_num : $("#b_num").val()
				};
				
				alert("dataParam >>> : " + dataParam);
				if (confirm('게시글을 삭제하시겠습니까?') == true) {
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
							location.href="boardSelectAll.bp";
						}else if ("DELETE_FAIL" == resData) {
							alert("삭제가 실패하였습니다.");
						};
					}
					function whenError(e) {
						alert("error e >>> : " + e.responseText);
					}
				} else {
					return;
				}					
				
			}); // 게시글 삭제 이벤트 end
		}); // jQuery end
	</script>

</head>

<body>

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
		out.println("location.href='boardSelectAll.bp'");
		out.println("</script>");
	}

	List<BoardVO> listS = (List<BoardVO>)obj;

	int nCnt = listS.size();
	out.println(" * 선택한 게시글 수 (nCnt) : " + nCnt);
	
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
%>

	<h1><%=nick %>님이 로그인 중입니다.</h1>
	<!--
	name을 not null 처리한다면 id 컬럼 추가없이 name으로 세션확인 후 수정/삭제 가능
	https://doublesprogramming.tistory.com/211
 -->
 <form name="boardWrite" id="boardWrite">
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">게시판 글쓰기</td>
			</tr>

			<tr>
				<td align="center">TITLE</td>
				<td>
					<input type="text" name="b_subject" id="b_subject" size="53" value="<%= subject%>">
				</td>
			</tr>

			<tr>
				<td align="center">WRITER</td>
				<td>
					<input type="text" name="b_name" id="b_name" size="53" value="<%= name%>" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img class="content_img" src="/resources/img/boardimg/<%= file %>">
				</td>
			</tr>
			<tr>
				<!-- <td  align="center">내용</td> -->
				<td colspan="2">
					<textarea name="b_content" id="b_content" cols="60" rows="10" placeholder="글을 입력해주세요."><%= content %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="b_num" id="b_num" value="<%=num %>">
					<input type="button" value="LIST" id="list_btn">
					<input type="button" value="수정하기" id="update_btn">
					<input type="button" value="삭제하기" id="delete_btn">
					<!-- onclick="boardWriteCheck()" -->
					<!-- <input type="reset" value="다시"> -->
				</td>
			</tr>
		</table>
	</form>
</body>

</html>