<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	
	<!-- ================================================= -->
	<link rel="stylesheet" href="resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/boardInsertForm.css" type="text/css">
	<!-- ================================================= -->
	

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {

			// OK 버튼클릭 : 게시글 등록 
			$(document).on("click", "#ok_btn", function () {
				//alert("b_btn click >>> : ");

				$('#boardWrite').attr({
					'action': '/boardInsert.bp',
					'method': 'POST',
					'enctype': 'multipart/form-data'
				}).submit();
			});

			// LIST 버튼클릭 : 전체보기 페이지로 이동 
			$(document).on("click", "#list_btn", function () {
				// selectAll 페이지로 이동
				$('#boardWrite').attr({
					'action': '/boardSelectAll.bp',
					'method': 'GET',
					'enctype': 'application/x-www-form-urlencoded'
				}).submit();
			});

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
			
			<td class="logotd"><div class="logotdlogin"><a href="login">로그인</a></div></td>
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
			<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/업체정보.png"></td><td class="leftsidetext"><a href="ion"><a href="info">업체 정보</a></td>
		</tr>
		<tr>
			<td colspan="2" class="leftsidetd"><img alt="write" src="resources/img/mainimg/사이드줄.png"></td>
		</tr>
	</table>
	
	<!-- =================================================================== -->

	<!-- session -->
	<% request.setCharacterEncoding("UTF-8");%>
	<%
	// session 로그인상태 가져오기 
	HttpSession bpSession = request.getSession(false);
	String nick = "";
	String m_id = "";
	
	if(bpSession != null){
		System.out.println("session 존재함 !!!!!!");
		nick = String.valueOf(bpSession.getAttribute("m_nick"));
		m_id = String.valueOf(bpSession.getAttribute("m_id"));
		// String sM_id = String.valueOf(bpSession.getAttribute("m_id"));
		// System.out.println("sM_id >>> : " + sM_id);
		System.out.println("m_nick >>> : " + nick);
		System.out.println("m_id >>> : " + m_id);
		
	} 
	
	if(m_id.equals("null")) {
	%>
		<script>
			alert("로그인인 필요합니다.");
			location.href="boardSelectAll.bp";
		</script>
	<% 	
	}
	%>




	<form name="boardWrite" id="boardWrite">
		<table class="board" style="float:left;">
			<tr>
				<td class="boardtdprofil"><img alt="profil" src="resources/img/mainimg/작성자사진.png"></td>
				<td>
					<input type="text" name="b_name" id="b_name" class="boardtdprofilname" size="53" value="<%= nick%>" readonly>
					<input type="text" name="b_subject" id="b_subject" size="53" value=" " hidden>
				</td>
			</tr>

			<tr>
				<td colspan="2">
				<textarea name="b_content" id="b_content" cols="60" rows="10" placeholder="어떤 이야기를 나누고 싶으세요?" style="height: 203px;"></textarea>
				</td>
			</tr>

			<tr>
				<td class="boardtd" colspan="6"><div class="boardtdline"><img alt="line" src="resources/img/mainimg/댓글선.png"></div></td>
			</tr>
			
			<tr>
				<td colspan="2">  
				<span class="filebox">
 				<label for="b_file"><img class="photoChoice" alt="photo" src="resources/img/mainimg/photo1.png"> 사진 선택</label>
  				<input type="file" name="b_file" id="b_file">
				</span>
				
				<span class="okbuuttonall">
				<span class="okbutton">
  				<input class="okbuttonInput" type="button" id="list_btn" value="취소하기" >
				</span>
				<span class="okbutton">
  				<input class="okbuttonInput" type="button" id="ok_btn" value="게시하기" >
				</span>
				</span>
				</td> 
			</tr>



	

			<!-- <tr>
				<td colspan="2" align="center">-->
					<!-- <input type="button" value="LIST" id="list_btn" style="padding: 3px 100px 3px 100px">-->
					<!-- onclick="boardWriteCheck()" -->
					<!-- <input type="reset" value="다시"> -->
				<!-- </td>
			</tr>-->
		</table>
	</form>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>