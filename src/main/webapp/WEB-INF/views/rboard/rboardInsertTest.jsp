<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글 입력 테스트 </title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			$(document).on('click', '#insert_btn', function () {
				alert('댓글 작성 버튼 이벤트 진입 !');
				
				let insertURL 	= "rboardInsert.bp";
				let method 		= "POST";
				
				let dataParam = {	
						"rb_name": $('#rb_name').val(),
						"b_num": $('#b_num').val(),
						"rb_content": $('#rb_content').val(),
				};	
				// dataParam = $("#rboardForm").serialize();
				console.log("dataParam >>> : " + dataParam);
				// alert("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: insertURL,
					type: method, 
					data: dataParam,			
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);
					// alert("resData >>> : " + resData);
				}
				
				function whenError(){
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				}
			});
			
		});
	</script>
</head>
<body>
<form id="rboardWrite" name="rboardWrite">
	<table>
		<tr>
			<td>작성자 이름</td>
			<td>
				<input type="text" id="rb_name" name="rb_name">
				<input type="hidden" id="b_num" name="b_num" value="B0010">
			</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<input type="text" id="rb_content" name="rb_content">
				<input type="button" id="insert_btn" value="입력하기">
			</td>		
		</tr>
	</table>
</form>
</body>
</html>