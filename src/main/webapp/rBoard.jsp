<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갈색푸들</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/rboard.css" type="text/css">



</head>
<body>
 
<!-- 상단 -->
<table class="logot">
	<tr class="logotr">
		<td class="logotd">
			<div class="logotdh">
			<img alt="logo" src="resources/img/mainimg/로고집.png">
			</div>
		</td>
		<td class="logotd">
			<div class="logotdtext">
			<img alt="logoname" src="resources/img/mainimg/로고네임.png">
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
		
		<td class="logotd"><div class="logotdlogin">로그인 하기</div></td>
		<td class="logotd">
		<div class="logotdloginp"><img alt="login" src="resources/img/mainimg/상단로그인.png"></div>
		</td>
	</tr>
</table>

<!-- 왼쪽사이드 -->
<table class="leftside" style="float:left;">
	<tr>
		<td class="leftsidetd"><img class="write" alt="write" src="resources/img/mainimg/글쓰기.png"></td><td class="leftsidetext">글쓰기</td>
	</tr>
	<tr>
		<td class="leftsidetd"><img alt="diary" src="resources/img/mainimg/다이어리.png"></td><td class="leftsidetext">펫 다이어리</td>
	</tr>
	<tr>
		<td class="leftsidetd"><img alt="walk" src="resources/img/mainimg/산책.png"></td><td class="leftsidetext">산책 하기</td>
	</tr>
	<tr>
		<td class="leftsidetd"><img alt="info" src="resources/img/mainimg/업체정보.png"></td><td class="leftsidetext">업체 정보</td>
	</tr>
	<tr>
		<td colspan="2" class="leftsidetd"><img alt="line" src="resources/img/mainimg/사이드줄.png"></td>
	</tr>
</table>


<!-- 게시판 --> 

<form id="boardForm" name="boardForm">
 
<table class="board"  > 
	<tr> 
		<td class="boardtdprofil"><img alt="profil" src="resources/img/mainimg/작성자사진.png"></td>
		<td class="boardtdprofilname" colspan="3">이름<br><div class="boardprofiltime">6월3일 오후 02:29</div></td>
		<td class="boardadd" colspan="2" style="float: right;">
		<div class="add">
		 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  		 <img alt="add" src="resources/img/mainimg/더보기.png">
  		</button>
 		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" tabindex="0">수정</a>
    	<a class="dropdown-item" tabindex="0">삭제</a>
  		</div> 
		</div>
		</td>
	</tr>
	<tr> 
		<td class="boardtd" colspan="6"><div class="boardtdphoto"><img class="photo" alt="photo" src="resources/img/mainimg/야옹이.jpg"></div></td>
	</tr>
	<tr>
		<td class="boardtdtext" colspan="6">텍스트</td>
	</tr>
	<tr>
		<td class="boardtd" colspan="6"><div class="boardtdline"><img alt="line" src="resources/img/mainimg/댓글선.png"></div></td>
	</tr>
	<tr>
		<div class="boardfoot">
		<td colspan="2" class="boardtdlike" width="5px"><img alt="like" src="resources/img/mainimg/좋아요댓글.png"></td>
		<td class="boardtdlikere">좋아요 350개</td>
		<td class="boardtdre"><img alt="comment" src="resources/img/mainimg/댓글.png"></td>
		<td class="boardtrrewrite">댓글</td>
		<td class="boardreport">신고</td>
		</div>
	</tr>
	
	<!-- <댓글>
	<tr>
		<div class="rboard" >
		<td colspan="4" style= "background-color: #f9f7f7;
    border-radius: 0px 0px 0px 8px;">
			<span id="rb_name" name="rb_name" class="rbname">gahyun12345</span>
			<input type="text" id="rb_content" name="rb_content" class="rbcontent" value="댓글을 입력해주세요.">
		 </td>
		<td class="r_button_td" style="background-color: #f9f7f7;
    border-radius: 0px 0px 8px 0px;">
			<input type="button" id="r_insert_btn" name="r_insert_btn" class="r_button" value="등록" >
		</td>	
		</div>
	</tr>

		 -->
</table>
</form>

	<!-- 댓글 입력 -->
	<form id="rboardWrite" name="rboardWrite">
		<table class="rboard">
			<tbody>	<tr>

		<td colspan="4" style= "background-color: #f9f7f7;
    border-radius: 8px;">
			<span id="rb_name" name="rb_name" class="rbname">gahyun12345</span>
			<input type="text" id="rb_content" name="rb_content" class="rbcontent" value="댓글을 입력해주세요.">
		 </td>
		<td class="r_button_td" style="background-color: #f9f7f7;
    border-radius: 8px;">
			<input type="button" id="r_insert_btn" name="r_insert_btn" class="r_button" value="등록" >
		</td>	

	</tr>
		</tbody></table>
	</form>






<!-- *댓글 form 게시판이랑 합치기*
<form id="rboardWrite" name="rboardWrite">
		<table class="rboard" style="float:bottom;">
			<tr>
				<td>
					<span id="rb_name" name="rb_name">user name</span> -->
					<!-- <input type="text" id="rb_name" name="rb_name"> -->
				<!-- </td>
				<td>
					<input type="text" id="rb_content" name="rb_content">
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="r_insert_btn" name="r_insert_btn" value="입력하기">
				</td>		
			</tr>
		</table>
	</form>-->



<!-- 오른쪽 사이드(위젯) --> 
<table class="rightside" style="float:left;">
	<tr><td>검색</td></tr>
	<tr><td>캘린더</td></tr>
</table>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>