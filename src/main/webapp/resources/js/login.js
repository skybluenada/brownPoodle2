/**
 * 
 */
 
 			$(document).ready(function(){
				$("#btn").click(function(){
					var m_id = $("#m_id").val();
					var m_pw = $("#m_pw").val();
					
					if(m_id == ""){
						alert("아이디를 입력하세요");
					}else if(m_pw == ""){
						alert("비밀번호를 입력하세요");
					}else{
						$('#loginForm').attr({
							'action':'loginTry.bp',
							'method':'POST',
							'enctype':'application/x-www-form-urlencoded'
						}).submit();
					}
				});
			});