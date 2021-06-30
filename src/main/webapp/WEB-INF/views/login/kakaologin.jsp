<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=ege"/>
<meta name="viewport" content="user-scalable=no,inital-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
<title>:: Custom Login Demo - Kakao JavaScript SDK ::</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key
        Kakao.init( "1433179c9949a6df24709974fab3536e" );
        // @breif 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
              container : "#kakao-login-btn",
              success : function( authObj ) {
              console.log( "authObj >>> : " + JSON.stringify(authObj));
              Kakao.API.request({
                      url : "/v2/user/me",
                      success : function( res ) {
                    	  
                        console.log( "res  >>> : " + res );
                        console.log( "res  >>> : " + JSON.stringify(res));
                     /*    res  >>> : 
                        {"id":1759730587
                        ,"connected_at":"2021-06-07T09:23:19Z"
                        ,"properties":{
			                        	"nickname":"김규민"
			                        	,"profile_image":"http://k.kakaocdn.net/dn/vdgBO/btq1g9ayDbN/a9kgVzUqJcapMqHSYId0R1/img_640x640.jpg"
			                        	,"thumbnail_image":"http://k.kakaocdn.net/dn/vdgBO/btq1g9ayDbN/a9kgVzUqJcapMqHSYId0R1/img_110x110.jpg"
			                        }
                        ,"kakao_account":{
			                        	"profile_needs_agreement":false
			                        	,"profile":{
			                        				"nickname":"김규민"
			                        				,"thumbnail_image_url":"http://k.kakaocdn.net/dn/vdgBO/btq1g9ayDbN/a9kgVzUqJcapMqHSYId0R1/img_110x110.jpg"
			                        				,"profile_image_url":"http://k.kakaocdn.net/dn/vdgBO/btq1g9ayDbN/a9kgVzUqJcapMqHSYId0R1/img_640x640.jpg"
			                        				,"is_default_image":false}
                        				,"has_email":true,
                        				"email_needs_agreement":false,
                        				"is_email_valid":true,
                        				"is_email_verified":true,
                        				"email":"xcv232@naver.com"
                        				}
                        } */
                        console.log( "res.id >>> : " + res.id);
                        console.log( "res.properties.nickname >>> : " + res.properties.nickname);
                        console.log( "res.properties.profile_image >>> : " + res.properties.profile_image);
                        console.log( "res.properties.thumbnail_image >>> : " + res.properties.thumbnail_image);
                        // @breif 아이디
                        document.getElementById( "kakaoIdentity" ).innerHTML = res.id;
                        // @breif 닉네임
                        document.getElementById( "kakaoNickName" ).innerHTML = res.properties.nickname;
                        // @breif 프로필 이미지
                        document.getElementById( "kakaoProfileImg" ).src = res.properties.profile_image;
                        // @breif 썸네일 이미지
                        document.getElementById( "kakaoThumbnailImg" ).src = res.properties.thumbnail_image;
                    }, 
                    fail : function( error ) {
                        alert( JSON.stringify( error ) );
                    }
                });
            }
            , fail : function( error ) {
                alert( JSON.stringify( error ));
            }
        });
    });
</script>
</head>
<body>
    <div>카카오 아이디 : <span id="kakaoIdentity"></span></div>
    <div>닉네임 : <span id="kakaoNickName"></span></div>

    <div>프로필 이미지 : <img id="kakaoProfileImg" src=""/></div>
    <div>썸네일 이미지 : <img id="kakaoThumbnailImg" src=""/></div>
    <br/>
    <a id="kakao-login-btn"></a>
</body>
</html> 