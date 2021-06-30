/**
 * 
 */
 
 	$(document).ready(function(){
		
		// OK 버튼클릭 : 게시글 등록 
		$(document).on("click", "#ok_btn", function(){
			
			alert("b_btn click >>> : ");
			
			$('#boardWrite').attr({
				'action' : '/boardInsert.bp',
				'method' : 'POST',
				'enctype' : 'multipart/form-data'
			}).submit();	
		});
	
		// LIST 버튼클릭 : 전체보기 페이지로 이동 
		$(document).on("click", "#list_btn", function(){
			// selectAll 페이지로 이동 
		});
		
	});