<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String bnum = request.getParameter("b_num");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>댓글 전체 조회 테스트 페이지 </title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">
		table,
		tr,
		td {
			border: 1px solid black;
			border-collapse: collapse;
		}

		.rboard_table {
			margin-bottom: 50px;
		}

		.rboard_edit {
			text-align: right;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function () {
			let bnum = 'B0010';
			alert(' 현재 게시글 번호:' + bnum);
			
			// 댓글 목록 불러오기
			function r_selectAll() {
				$.ajax({
				type: 'POST',
				url: '/rboardSelectAll.bp?b_num=' + bnum,
				dataType: 'json',
				success: function (data) {
					if (data != null && data != '') {
						$(data).each(function () {
							console.log(this);
							let str = '';
							str += '<form id="' + this.rb_num + '" name="' + this.rb_num + '">' +
								'<table class="rboard_table">' +
								'<tr><td>' + this.rb_name + '<br>' + this.rb_insertdate +
								'</td>' +
								'<td><span class="rb_content_' + this.rb_num + '">' + this.rb_content +
								'</span><input type="hidden" name="rb_content" id="rb_content"></td></tr>' +
								'<tr><td class="rboard_edit" colspan="2">' +
								'<input type="button" id="r_update_btn" name="r_update_btn" value="수정">' +
								'<input type="button" id="r_delete_btn" name="r_delete_btn" value="삭제"></td></tr>' +
								'</table></form>';
							$('.rboard_div').append(str);
						});

					} else {
						console.log('불러올 데이터가 없음!');
					}

				}
			});
			}
			
			r_selectAll();

			// 댓글 작성
			$(document).on('click', '#r_insert_btn', function () {
				alert('댓글 작성 버튼 이벤트 진입 !');
				
				alert('댓글 작성자 이름: ' + $('#rb_name').text());

				let insertURL 	= "rboardInsert.bp";
				let method 		= "POST";
				let dataParam = {	
						"rb_name": $('#rb_name').text(),
						"b_num": bnum,
						"rb_content": $('#rb_content').val(),
				};	
				
				$.ajax({
					url: insertURL,
					type: method, 
					data: dataParam,			
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);

					if ("INSERT_SUCC" == resData) {
						alert("입력이 완료되었습니다.");
						$('#rb_content').val('');
						
						$('.rboard_div').empty();
						r_selectAll();
					} else if ("INSERT_FAIL" == resData) {
						alert("입력 실패하였습니다.");
					};
				}
				
				function whenError(e){
					console.log("댓글 입력 실패 :" + e.responseText);
				}
			});

			/*
				맨 처음 댓글 수정 버튼 클릭 -> select로 input tag로 교체하면서 댓글 내용 불러오기 & 수정하기 버튼 id 변경
				-> 수정 완료하면 update 쿼리 수행 -> 다시 input tag를 일반 텍스트로 교체
			*/
			// 댓글 수정(select 수행)
			$(document).on('click', '#r_update_btn', function () {
				let rbnum = $(this).parents('form').attr('id');
				alert('수정할 댓글 번호: ' + rbnum);

				// 수정할 부분의 span 영역
				let span_rbcontent = $('.rb_content_' + rbnum);
				alert('댓글 내용이 있는 span 영역 id: ' + span_rbcontent);

				// 속성 text로 변경할 input tag
				let _input = span_rbcontent.siblings();
				// alert('input tag: ' + _input);

				// 속성 변경할 input tag
				let _update_input = $(this);
				// alert('수정버튼: ' + _update_input);
				alert(_update_input.val());

				$.ajax({
					type: 'POST',
					url: '/rboardSelect.bp?rb_num=' + rbnum,
					dataType: 'json',
					success: whenSuccess,
					error: whenError
				});

				function whenSuccess(data) {
					if (data != null && data != '') {
						console.log(data[0]);
						span_rbcontent.empty();
						_input.attr({
							'type': 'text',
							'value': data[0].rb_content
						});
						_input.focus();

						_update_input.attr({
							'id': 'r_update_btn_ok',
							'name': 'r_update_btn_ok'
						});
					} else {
						console.log('불러올 데이터가 없음!');
					}
				}

				function whenError(e) {
					console.log("error e : " + e.responseText);
				}
			}); // r_update_btn 이벤트 end

			// 댓글 수정 완료 (update 수행)
			$(document).on('click', '#r_update_btn_ok', function () {
				alert('수정 완료 버튼 이벤트 진입!');

				let rbnum = $(this).parents('form');
				let rbnum_num = rbnum.attr('id');
				alert('수정할 댓글 번호: ' + rbnum_num);

				// 수정할 부분의 span 영역
				let span_rbcontent = $('.rb_content_' + rbnum_num);
				alert('댓글 내용이 있는 span 영역 id: ' + span_rbcontent);

				// 속성 text로 변경할 input tag
				let input_rbcontent = rbnum.find('#rb_content');

				// 속성 변경할 input tag
				let _update_input = $(this);
				alert('수정버튼: ' + _update_input);
				// alert(_update_input.val());

				// 수정할 데이터 값
				alert(input_rbcontent.val());
				
				async function rb_update() {
					let dataParam = {
						'rb_num': rbnum_num,
						'rb_content': input_rbcontent.val()
					};
					// update 수행
					$.ajax({
						type: 'POST',
						url: '/rboardUpdate.bp',
						data: dataParam,
						dataType: 'json',
						success: function(resData){
							if ("UPDATE_SUCC" == resData) {
								alert("수정이 완료되었습니다.");
							} else if ("UPDATE_FAIL" == resData) {
								alert("수정 실패하였습니다.");
							};
						}
					});

					await reload();
				}

				rb_update();
				
				// select 수행
				function reload() {
					$.ajax({
						type: 'POST',
						url: '/rboardSelect.bp?rb_num=' + rbnum_num,
						dataType: 'json',
						success: whenSuccess,
						error: whenError
					});

					function whenSuccess(data) {
						if (data != null && data != '') {
							console.log(data[0]);
							input_rbcontent.attr({
								'type': 'hidden',
								'value': ''
							});
							
							console.log('변경되는 값: ' + data[0].rb_content);
							span_rbcontent.text(data[0].rb_content);

							_update_input.attr({
								'id': 'r_update_btn',
								'name': 'r_update_btn'
							});
						} else {
							console.log('수정 후 데이터 불러오기 실패!');
						}
					}

					function whenError(e) {
						console.log("error e : " + e.responseText);
					}
				}

			}); // r_update_btn_ok 이벤트 end

			// 게시글 한 개 select 하는 함수


			// 댓글 삭제
			$(document).on('click', '#r_delete_btn', function () {
				alert('댓글 삭제 이벤트 진입!');
				let rbnum = $(this).parents('form').attr('id');
				alert('삭제할 댓글 번호: ' + rbnum);

				let _form = $(this).parents('form');
				alert('삭제할 영역: ' + _form);

				let deleteURL = "rboardDelete.bp";
				let reqType = "POST";
				let dataParam = {
					rb_num: rbnum
				};

				alert("dataParam >>> : " + dataParam);
				if (confirm('댓글을 삭제하시겠습니까?') == true) {
					$.ajax({
						url: deleteURL,
						type: reqType,
						data: dataParam,
						success: whenSuccess,
						error: whenError
					});

					function whenSuccess(resData) {
						if ("DELETE_SUCC" == resData) {
							alert("삭제가 완료되었습니다.");
							_form.remove();
						} else if ("DELETE_FAIL" == resData) {
							alert("삭제가 실패하였습니다.");
						};
					}

					function whenError(e) {
						console.log("error e >>> : " + e.responseText);
					}
				} else {
					return;
				}
			}); // r_delete_btn 이벤트 end

		}); // jQuery 영역 end
	</script>
</head>

<body>
	<h1>댓글 입력</h1>
	<form id="rboardWrite" name="rboardWrite">
		<table>
			<tr>
				<td>
					<span id="rb_name" name="rb_name">user name</span>
					<!-- <input type="text" id="rb_name" name="rb_name"> -->
				</td>
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
	</form>
	<H1>댓글 수정 입력폼 예시</H1>
	<form id="RB0001">
		<table class="rboard_table">
			<tr>
				<td>작성자 이름<br> 작성일자</td>
				<td><input type="text" name="rb_content" id="rb_content"></td>
			</tr>
			<!-- 세션 처리 필요  -->
			<tr>
				<td class="rboard_edit" colspan="2">
					<input type="button" id="r_update_btn_ok" name="r_update_btn_ok" value="수정완료">
					<input type="button" id="r_update_btn" name="r_update_btn" value="수정">
					<input type="button" id="r_delete_btn" name="r_delete_btn" value="삭제">
				</td>
			</tr>
		</table>
	</form>
	<h1>댓글 전체 조회 예시</h1>
	<form id="RB">
		<table class="rboard_table">
			<tr>
				<td>작성자 이름<br> 작성일자</td>
				<td>
					<span class="rb_content_text">댓글 내용</span>
					<input type="hidden" name="rb_content" id="rb_content">
				</td>
			</tr>
			<!-- 세션 처리 필요  -->
			<tr>
				<td class="rboard_edit" colspan="2">
					<input type="hidden" id="r_update_btn_ok" name="r_update_btn_ok" value="수정완료">
					<input type="button" id="r_update_btn" name="r_update_btn" value="수정">
					<input type="button" id="r_delete_btn" name="r_delete_btn" value="삭제">
				</td>
			</tr>
		</table>
	</form>
	<!-- <h1>DB에서 불러온 데이터 전체 조회</h1> --> 
	<div class="rboard_div">

	</div>
</body>

</html>