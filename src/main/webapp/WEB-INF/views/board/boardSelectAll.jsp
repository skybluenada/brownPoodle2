<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.brownpoodle.board.vo.BoardVO" %>
<%@ page import="com.brownpoodle.common.CommonUtil" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ============================================main========================================= -->

<%

	//session 로그인상태 가져오기 
	HttpSession bpSession = request.getSession(false);
	
	String mnum = "";
	String nick = "";
	String m_id = "";
	
	if(bpSession != null){
		System.out.println("session 존재함 !!!!!!");
		nick = String.valueOf(bpSession.getAttribute("m_nick"));
		mnum = String.valueOf(bpSession.getAttribute("m_num"));
		m_id = String.valueOf(bpSession.getAttribute("m_id"));
		
		System.out.println("boardSelectAll jsp page nick: " + nick);
		System.out.println("boardSelectAll jsp page m_id: " + m_id);
	}
	
	Object obj = request.getAttribute("listAll");
	if (obj == null) return;
	
	//paging 관련 변수 선언 및 초기화
	List<BoardVO> list = (List<BoardVO>)obj;
	
	String totalCount = list.get(0).getTotalcount();
	int pagesize = Integer.parseInt(CommonUtil.B_PAGE_SIZE);		// 한 페이지당 보여줄 게시글 수
	int curpage = Integer.parseInt(CommonUtil.B_CUR_PAGE);			// 현재 페이지
	int totalcount = Integer.parseInt(totalCount);					// 전체 게시글 수
	
	int maxPage = (int)Math.ceil(totalcount / (pagesize + 0.0));	// 전체 페이지 수

	Object sobj = request.getAttribute("search");
	BoardVO _bvo = (BoardVO) sobj;
	
	// search 관련 변수 선언 및 초기화 
	String keyFilter = _bvo.getKeyfilter();		// 검색 조건
	if (keyFilter == null) keyFilter = "";
	
	String keyword = _bvo.getKeyword();			// 검색어 
	if (keyword == null) keyword = "";
	
	String startdate = _bvo.getStartdate();		// 시작일 
	if (startdate == null) startdate = "";
	
	String enddate = _bvo.getEnddate();			// 종료일 
	if (enddate == null) enddate = "";
	
	System.out.println("jsp page ---------------");
	System.out.println("keyFilter : " + keyFilter);
	System.out.println("keyword : " + keyword);
	System.out.println("startdate : " + startdate);
	System.out.println("enddate : " + enddate);
	

	// 좋아요 이미지 변수 
	String src = "";
	String heart_n = "resources/img/defaultimg/heart_n.png";
	String heart_y = "resources/img/defaultimg/heart_y.png";

%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>brownpoodle main</title>
	
	
	<!-- ================================================= -->
	<link rel="stylesheet" href="resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<!-- ================================================= -->
	
	
	<!-- <link rel="stylesheet" href="/resources/css/board.css"> -->

	<link rel="stylesheet" href="resources/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="resources/common/datepiker/jquery-ui-1.12.1/datepicker-ko.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			/* 달력 표시 (datepicker)*/
			// 시작일
			$("#startdate").datepicker({
				showOn: "button",
				buttonImage: "resources/img/defaultimg/cal_0.gif",
				dateFormat: 'yy-mm-dd',
				buttonImageOnly: true,
				buttonText: "Select date",
				changeMonth: true,
				changeYear: true,
				onClose: function (sDate) {
					$('#enddate').datepicker('option', 'minDate', sDate);
				}
			});
			$("#enddate").datepicker({
				showOn: "button",
				buttonImage: "resources/img/defaultimg/cal_0.gif",
				dateFormat: 'yy-mm-dd',
				buttonImageOnly: true,
				buttonText: "Select date",
				changeMonth: true,
				changeYear: true,
				onClose: function (sDate) {
					$('#startdate').datepicker('option', 'maxDate', sDate);
				}
			});

			// 검색 버튼 이벤트
			$(document).on('click', '#searchBtn', function () {
				//alert('검색 버튼 이벤트 진입!');

				$('#boardForm').attr({
					'method': 'GET',
					'action': 'boardSelectAll.bp',
					'enctype': 'application/x-www-form-urlencoded'

				}).submit();
			});

			// infinite scroll
			let index = 1;
			$(window).scroll(function () {
				let $window = $(this);
				let scrollTop = $window.scrollTop();
				let windowHeight = $window.height();
				let documentHeight = $(document).height();

				/*
				console.log('scrollTop: ' + scrollTop);
				console.log('windowHeight: ' + windowHeight);
				console.log('documentHeight: ' + documentHeight);
				console.log('scrollTop + windowHeight: ' + (scrollTop + windowHeight));
				*/
				console.log('scrollTop >= documentHeight - windowHeight : ' + scrollTop + windowHeight + 1 >= documentHeight)
				if (scrollTop >= documentHeight - windowHeight) {
					setTimeout(fetchlist, 200);
				}

			});

			// 다음 페이지 게시글 불러오기 (json 데이터를 불러오기)
		function fetchlist() {
			let maxPage = <%= maxPage%>;
			if (index <= maxPage) {
				index++;
			} else {
				return;
			}
			console.log('maxPage: ' + maxPage);
			console.log('불러올 페이지: ' + index);
			
			// 검색했을 때
			// keyfilter=key1&keyword=고양이&startdate=&enddate=
			// /boardSelectPaging.bp?curPage=2&keyfilter=&keyword=+&startdate=+&enddate=+
			let kfilter = '';
			let kword = '';
			let sdate = '';
			let edate = '';

			// console.log('type(keyfilter) : ' + typeof(kfilter));
			kfilter = '<%=keyFilter %>';
			kword = '<%=keyword %>';
			sdate = '<%=startdate %>';
			edate = '<%=enddate %>';
			
			console.log('kfilter: ' + kfilter);
			console.log('kword: ' + kword);
			console.log('sdate: ' + sdate);
			console.log('edate: ' + edate);
			
			let dataParams = {
				keyfilter: kfilter,
				keyword: kword,
				startdate: sdate,
				enddate: edate
			};

			$.ajax({
				type: 'GET',
				url: '/boardSelectPaging.bp?curPage='+ index,
				data: dataParams,
				dataType: 'json',
				success: function (data) {
					
					if (data != null && data != '') {
						$(data).each(function(){
							let str = '';
							let src = '';
							
							console.log(this);
							if (this.m_num == '<%= mnum%>' && this.like_deleteyn == 'Y') {
								src = '<%= heart_y %>';
							} else {
								src = '<%= heart_n %>';
							}
							
							str += '<table class="board">'
								+ '<tr><td class="boardprofile"><img class="profile_img" src="/resources/img/defaultimg/default_profile.png" alt="profile"></td>'
								+ '<td class="boardprofilname" colspan="4">' + this.b_name + '<div class="boardprofiltime">' + this.b_insertdate + '</div></td></tr>';
						 if (this.b_file != null && this.b_file != '-' && this.b_file != '') {
							str += '<tr><td class="boardtd" colspan="5"> <img class="photo" alt="photo" src="/resources/img/boardimg/' + this.b_file + '"> </td></tr>';
						 }
						 	str += '<tr><td class="boardcontent" colspan="5">' + this.b_content + '</td></tr>'
						 		+ '<tr><td class="boardtd" colspan="5"><div class="boardline"><img alt="line" src="/resources/img/defaultimg/line.png"></div></td></tr>'
								+ '<tr><div class="boardfoot">'
								+ '<td colspan="2" class="boardlike" id="'+ this.b_num +'"width="5px">'
								+ '<input class="boardlike_img" type="image" name="like_img" id="like_img" src="' + src + '" alt="좋아요이미지" width="20" height="20"></td>'
								+ '<td class="boardlikecount"><input class="b_like" type="text" name="b_like" id="b_like" value="좋아요 ' + this.b_like + '개"></td>'
								+ '<td class="boardre"><a href="boardSelect.bp?b_num=' + this.b_num + '"><img alt="photo" src="/resources/img/defaultimg/reply.png"></a></td>'
								+ '<td class="boardrewrite"><a href="boardSelect.bp?b_num=' + this.b_num + '">댓글쓰기</a></td>'
								+ '<td class="boardreport">신고</td></div></tr>'
								+ '</tr></table>';
							$('.new_page').append(str);
						});
					} else {
						console.log('불러올 데이터가 없음!');
					}

				}
			});
		} // function fetchlist() end
		
		// 좋아요 기능
			$(document).on("click", "#like_img", function(){
				let likeclickURL = "boardLikeCheck.bp";
				let reqType ="POST";
				
				let b_num = $(this).parent('td').attr('id');
				console.log('좋아요 누른 게시글 번호: ' + b_num);
				//alert('좋아요 누른 게시글 번호: ' + b_num);
				
				let dataParam = {
						m_num : '<%= mnum %>',
						b_num : b_num
				};
				
				// alert("dataParam >>> : " + dataParam); // => dataParam >>> : [object Object]
				
				$.ajax({
					url : likeclickURL,
					type : reqType,
					data : dataParam,
					async : false,
					success : whenSuccess,
					error : whenError
				});
				
				function whenSuccess(resData) {
					//alert("resData.resultCheck >>> : " + resData.resultCheck);
					if (resData.resultCheck == 1) {
						//$("#like_img").attr("src", "/resources/img/boardimg/heart_y.png"); //=======> 이부분은 필요한가??????????? ■
						$("#b_like").empty();
						// $("#b_like").append(resData.b_like);
						$("#b_like").attr("value", resData.b_like);
						
					}else if (resData.resultCheck == 0) {
						//$("#like_img").attr("src", "/resources/img/boardimg/heart_n.png"); //■ 
						$("#b_like").empty();
						// $("#b_like").append(resData.b_like);
						$("#b_like").attr("value", resData.b_like);
						
					}else {
						//alert("resData에러!!");
					};
					// location.href="boardLikeSelect.bp";
					// location.reload(); // 새로고침 : 안해도됨 
				}
				function whenError(e) {
					//alert("error e >>> : " + e.responseText);
				}
			}); // 좋아요 기능 end

		}); // jQuery end
		
		
	</script>
</head>

<body>
<!-- =================================================================== -->
<table class="logot">

	<tr class="logotr">
		<td class="logotd">
			<div class="logotdh">
				<a href="boardSelectAll.bp">
					<img alt="logo" src="resources/img/mainimg/로고집.png">
				</a>
			</div>
		</td>
		
		<td class="logotd">
			<div class="logotdtext">
				<a href="boardSelectAll.bp">
					<img alt="logoname" src="resources/img/mainimg/로고네임.png">
				</a>
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
				<a href="memberSelect.bp">
					<img alt="icon3" src="resources/img/mainimg/상단3.png">
				</a>
			</div>
		</td>
		
		<!-- 로그인하기 : session 있으면 로그아웃 / session없으면 로그인하기 -->
		<%
			if(m_id != "null"){
		%>		
				<td class="logotd"><div class="logotdlogin" style="padding-left: 347px;"><a href="logout">로그아웃</a></div></td>
		<% 		
			}else {
		%>
		
		<td class="logotd"><div class="logotdlogin"><a href="login">로그인</a></div></td>
		<% 
			}
		%> 
		<!-- <td class="logotd"><div class="logotdlogin"><a href="login">로그인</a></div></td> -->
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
		<td class="leftsidetd"><img alt="write" src="resources/img/mainimg/업체정보.png"></td><td class="leftsidetext"><a href="info">업체 정보</a></td>
	</tr>
	<tr>
		<td colspan="2" class="leftsidetd"><img alt="write" src="resources/img/mainimg/사이드줄.png"></td>
	</tr>
</table>


<!-- =================================================================== -->


	<% request.setCharacterEncoding("UTF-8");%>
<%
	
	int nCnt = list.size();

	
	if (nCnt > 0) {
%>
	<form name="boardForm" id='boardForm'>
		  <table class="board_side" border="1" style="float:right;">
			<thead>
				<tr>
				</tr>
				<!-- 검색 영역 -->
				<tr>
					<td colspan="10" align="left">
						<input type="text" name="keyword" id="keyword" placeholder="검색어 입력" style="width:144px;     width: 221px;
    height: 39px;
    border: solid #cecdcd 1px;
    border-radius: 8px;
    padding-left: 13px;">
    
						<button type="button" id="searchBtn" style=" height: 39px; border: solid #cecdcd 1px; border-radius: 8px; color: #ffffff; background-color: #797979;">click!</button>
					</td>
				</tr>
			</thead>
			</table> 
			
<%

		for (int i = 0; i < nCnt; i++) {		
			BoardVO bvo = list.get(i);
			System.out.println("* 게시글 번호 : " + bvo.getB_num());
			System.out.println("* 좋아요 여부 : " + bvo.getLike_deleteyn());
			
			if ("Y".equals(bvo.getLike_deleteyn()) && mnum.equals(bvo.getM_num())) {
				src = heart_y;
			}else {
				src = heart_n;
			}

%>
			<div class="content">
				<table class="board" float="right">
						<tr>
							<td class="boardprofile">
								<img class="profile_img" src="resources/img/defaultimg/default_profile.png" alt="profile">
							</td>
							<td class="boardprofilname" colspan="4">
								<%= bvo.getB_name() %><br>
								<div class="boardprofiltime"><%= bvo.getB_insertdate() %></div>
							</td>
						</tr>
						<%
							if ((bvo.getB_file() != null) && !"-".equals(bvo.getB_file()) && !"".equals(bvo.getB_file())) {
								
						%>
						<tr>
							<td class="boardtd" colspan="5">
								<div class="boardphoto"><img class="photo" alt="photo" src="resources/img/boardimg/<%= bvo.getB_file() %>"></div>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td  class="boardcontent" colspan="5"><%= bvo.getB_content() %></td> 
						</tr>
						<tr>
							<td class="boardtd" colspan="5">
								<div class="boardline"><img alt="line" src="resources/img/defaultimg/line.png"></div>
							</td>
						</tr>
						<tr>

							<div class="boardfoot">
								<td colspan="2" class="boardlike" width="5px" id="<%= bvo.getB_num()%>">
									<input class="boardlike_img" type="image" name="like_img" id="like_img" 
								       src="<%= src %>" alt="좋아요이미지" width="20" height="20">
								</td>
								<td class="boardlikecount"><input type="text" class="b_like" name="b_like" id="b_like" value="좋아요 <%= bvo.getB_like() %>개"></td>
								<td class="boardre"><a href="boardSelect.bp?b_num=<%= bvo.getB_num() %>"><img alt="photo" src="resources/img/defaultimg/reply.png"></a></td>
								<td class="boardrewrite"><a href="boardSelect.bp?b_num=<%= bvo.getB_num() %>" style="color: #807e7e;">댓글</a></td>
								<td class="boardreport">신고</td>
							</div>
						</tr>
				</table>
			</div>
<%
		}//end of for
	} // if end
%>

	
			
		<div class="new_page"></div>
		
		
</body>

</html>