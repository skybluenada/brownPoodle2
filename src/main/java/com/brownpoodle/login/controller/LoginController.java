package com.brownpoodle.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.brownpoodle.common.GoogleMailSend;
import com.brownpoodle.common.PasswordUtil;
import com.brownpoodle.login.service.LoginService;
import com.brownpoodle.login.vo.ID_AuthNumVO;
import com.brownpoodle.login.vo.PW_AuthNumVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;

@Controller
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);

	private LoginService loginService;

	@Autowired(required = false)
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginPage() {
		logger.info("LoginController loginPage() >>> : ");
		return "login/login";
	}

	// 로그인 시도
	@RequestMapping(value = "loginTry", method = RequestMethod.POST)
	public ModelAndView loginTry(MemberVO mvo, HttpSession session) throws Exception {
		logger.info("LoginController loginTry() >>> : ");
		ModelAndView mv = new ModelAndView();
		PetVO pvo = new PetVO();
		
		int nCnt = loginService.loginCheck(mvo);
		if (nCnt > 0) {
			List<MemberVO> mList = loginService.loginData(mvo);
			MemberVO _mvo = mList.get(0);
			
			pvo.setM_num(_mvo.getM_num());
			List<PetVO> pList = loginService.petData(pvo);
			if(pList.size() > 0 ) {
				PetVO _pvo = pList.get(0);
				session.setAttribute("petVO", _pvo);
			}else {
			}
			session.setAttribute("m_num", _mvo.getM_num());
			session.setAttribute("m_id", _mvo.getM_id());
			session.setAttribute("m_nick", _mvo.getM_nick());
			session.setAttribute("m_addr", _mvo.getM_addr());
			
			System.out.println("svo.getM_nick() >>> " + _mvo.getM_nick());
			System.out.println("mvo.getM_num() >>> : " + _mvo.getM_num());
			
			mv.setViewName("login/loginSucc");				
			
		} else {
			mv.setViewName("login/login");
		}
		return mv;
	}

	// 로그아웃
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		logger.info("LoginController logout >>> : ");
		logger.info("m_id >>> " + session.getAttribute("m_id"));
		logger.info("m_nick >>> " + session.getAttribute("m_nick"));
		logger.info("m_photo >>> " + session.getAttribute("m_photo"));
		
		session.invalidate();
		
		ModelAndView mv = new ModelAndView("login/login");
				
		return mv;
	}

	// 아이디 찾기
	@RequestMapping(value = "idFind", method = RequestMethod.GET)
	public String idFind() {
		logger.info("LoginController idFind() >>> : ");
		return "login/idFind";
	}

	// 이름과 이메일이 일치하는지 여부를 확인하고 이메일 인증번호 보내줌.
	@RequestMapping(value = "idAuthEmailCheck", method = RequestMethod.GET)
	public ModelAndView idAuthEmailCheck(MemberVO mvo) {

		ModelAndView mv = new ModelAndView();
		int nCnt = loginService.idAuthEmailCheck(mvo);

		if (nCnt > 0) {

			String id_num = loginService.idAuthSeq().get(0).getId_num();
			String id_auth_num = PasswordUtil.randomPW(8);

			ID_AuthNumVO ivo = null;
			ivo = new ID_AuthNumVO();

			ivo.setId_num(id_num);
			ivo.setId_auth_num(id_auth_num);
			ivo.setM_email(mvo.getM_email());

			int authNcnt = loginService.idAuthInsert(ivo);

			if (authNcnt > 0) {

				String mailSubject = "ID찾기 인증번호";
				String sendMail = "kosmojbin@gmail.com";
				String sendPw = "whdqlsl12";
				String receiveMail = ivo.getM_email();
				String confirmNum = ivo.getId_auth_num();
				String sendMsg = "\t요청하신 인증번호는 [" + confirmNum + "] 입니다.\n\t 인증번호 입력란에 입력하세요";

				GoogleMailSend gms = new GoogleMailSend();
				gms.googleMailSend(mailSubject, sendMail, sendPw, receiveMail, sendMsg);

				mv.addObject("authnum", ivo.getId_auth_num());
				mv.setViewName("login/idEmailCheck");
			}
		}
		return mv;
	}

	@RequestMapping(value = "idAuthEmailIdFind")
	public ModelAndView idAuthEmailIdFind(MemberVO mvo, ID_AuthNumVO ivo) {

		ModelAndView mv = new ModelAndView();

		int nCnt = loginService.idAuthSelect(ivo);

		if (nCnt > 0) {
			List<MemberVO> iList = loginService.idAuthEmailIdFind(mvo);

			int del = loginService.idAuthDelete(ivo);
			if (del > 0) {
				logger.info("인증번호 삭제 완료 >>> : ");
			}

			if (iList != null) {
				mv.addObject("iList", iList);
				mv.setViewName("login/idFindOK");
			} else {
				mv.setViewName("login/idFind");
			}
		} else {
			mv.setViewName("login/idAuthCheck");
		}
		return mv;
	}

	// 비밀번호 찾기
	// -------------------------------------------------------------------------

	@RequestMapping(value = "idFindPw", method = RequestMethod.GET)
	public String idFindPw() {
		logger.info("LoginController.idFindPw >>> : ");

		return "login/idFindPw";
	}

	@RequestMapping(value = "pwFind", method = RequestMethod.GET)
	public String pwFind(MemberVO mvo, Model model) {
		logger.info("LoginController.pwFind >>> : ");
		// 서비스 연결
		// 모델로 값 1 혹은 0 넘김
		// jsp에서 0일 경우 : alert으로 없다고 알려줌 history(-1)
		// 1일 경우 : 페이지 이동

		String resultStr = "";
		int result = loginService.idFindPw(mvo);

		if (result == 1)
			resultStr = "id_OK";
		else
			resultStr = "id_Wrong";

		model.addAttribute("msg", resultStr);
		return "login/pwFind";
	}

	@RequestMapping(value = "pwEmailCheck", method = RequestMethod.GET)
	public <pw_AuthNumVO> String pwAuthEmailCheck(MemberVO mvo, PW_AuthNumVO pvo, Model model) {
		logger.info("LoginController.pwAuthEmailCheck >>> : ");

		// 인증번호 받기
//		String m_id = req.getParameter("m_id");
//		String m_email = req.getParameter("m_email");
//		logger.info("m_id >>> : " + m_id);
//		logger.info("m_email >>> : " + m_email);
		logger.info("m_id >>> : " + mvo.getM_id());
		logger.info("m_email >>> : " + mvo.getM_email());

		// 서비스 호출 & 이메일 여부 확인 하기
		List<MemberVO> list = loginService.pwAuthEmailCheck(mvo);
		logger.info("PW 이메일 여부 확인 emailCnt >>> : " + list);

		if (list.size() == 1) {
			// 인증번호 테이블 seq(순번) 만들기
			String pw_num = loginService.pwAuthSeq().get(0).getPw_num();
			logger.info("PW 인증번호 시퀀스(순번) pw_num >>> : " + pw_num);
			pvo.setPw_num(pw_num);

			// 인증번호 만들기
			String pw_auth_num = PasswordUtil.randomPW(10);
			logger.info("PW 인증번호(10) pw_auth_num >>> : " + pw_auth_num);
			pvo.setPw_auth_num(pw_auth_num);
			pvo.setM_id(mvo.getM_id());

			// 인증번호 테이블에 Insert
			int authCnt = loginService.pwAuthInsert(pvo);
			logger.info("PW 인증번호 테이블 입력 건수 authCnt >>> : " + authCnt);

			// 입력을 성공하면 인증번호 이메일 보내기
			// 이메일 전송 성공여부 처리하기
			if (authCnt == 1) {

				String mailSubject = "[갈색푸들] 비밀번호 확인 인증번호";
				String sendMail = "sleetest0000@gmail.com";
				String sendPw = "test0000!";
				String receiveMail = mvo.getM_email();
				String sendMsg = pw_auth_num;

				GoogleMailSend gms = new GoogleMailSend();
				gms.googleMailSend(mailSubject, sendMail, sendPw, receiveMail, sendMsg);

				// idFind 에 메시지 띄우기
				model.addAttribute("pw_auth_num", pw_auth_num);
				model.addAttribute("msg", "이메일을 확인하시고 인증번호를 입력하세요.");
			}
		} else {
			model.addAttribute("msg", "이메일이 없습니다.");
		}
		return "login/pwEmailCheck";
	}

	@RequestMapping(value = "pwAuthSelect", method = RequestMethod.GET)
	public String pwAuthSelect(MemberVO mvo, PW_AuthNumVO pvo, Model model) {
		logger.info("LoginController.pwAuthSelect() >>> : ");

		String result = "";

		pvo.setM_id(mvo.getM_id());
		String p_id = pvo.getM_id();
		String pw_auth_num = pvo.getPw_auth_num();
		logger.info("LoginController p_id >>> : " + p_id);
		logger.info("LoginController pw_auth_num >>> : " + pw_auth_num);

		List list = loginService.pwAuthSelect(pvo);
		String m_id = ((PW_AuthNumVO) list.get(0)).getM_id();
		String pw_auth_num_ = ((PW_AuthNumVO) list.get(0)).getPw_auth_num();

		if (pw_auth_num.equals(pw_auth_num_)) {
			logger.info("pw_auth_num >>> : ok");
			result = "login/pwChange";
		} else {
			logger.info("pw_auth_num >>> : null");
			result = "login/pwFind";
		}
		return result;
	}

	@RequestMapping(value = "pwFindOK", method = RequestMethod.GET)
	public String pwChange(PW_AuthNumVO pvo, MemberVO mvo, Model model, HttpServletRequest req) {
		logger.info("LoginController.pwChange >>> : ");

		pvo.setM_id(mvo.getM_id());
		loginService.pwDel(pvo);
		logger.info("LoginController.pwDel >>> : completed");

		// 새비밀번호
		String m_pw_r = req.getParameter("m_pw_r");
		logger.info("m_id >>> : " + mvo.getM_id());
		logger.info("m_pw >>> : " + mvo.getM_pw());
		logger.info("m_pw_r >>> : " + m_pw_r);

		// 새비밀번호 주입
		mvo.setM_pw(m_pw_r);
		logger.info("m_pw change >>> : " + mvo.getM_pw());

		String resultStr = "";
		int result = loginService.pwChange(mvo);

		if (result > 0)
			resultStr = "pw_change_OK";
		else
			resultStr = "pw_change_Worng";

		model.addAttribute("result", resultStr);
		return "login/pwFindOK";
	}

//	@RequestMapping(value = "kakaologin")
//	public String kakaologin() {
//		logger.info("LoginController.pwFind >>> : ");
//
//		return "login/kakaologin";
//	}

//	-------- NAVER LOGIN -------------------------------------------------------------------
	@RequestMapping(value = "/naverCallback")
	public String callback() {
		logger.info("LoginContorller callback 함수 진입 성공 >>> : ");

		return "login/naverCallback";
	}

	@RequestMapping(value = "/naverlogin")
	public String naverLogin(Model model, HttpServletRequest request) {
		logger.info("LoginContorller naverLogin 함수 진입 성공 >>> : ");

		String access_token = (String) request.getAttribute("access_token");
		logger.info("naverLogin access_token >>> : " + access_token);

		String token = access_token;
		String header = "Bearer " + token;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);
		logger.info("responseBody >>> : " + responseBody);
		
        //위에 값을 콘솔로 찍어본다. name 값이 유니코드인데 브라우저에서 자동으로 변환해서 읽고 json simple 라이브러리가 변환해준다.
		
        JSONObject jobj = new JSONObject();
        JSONParser parser = new JSONParser();
        MemberVO mvo = new MemberVO();
        
        try {
			jobj = (JSONObject)parser.parse(responseBody);
			
			// resultCode가 00이고 message가 success이면 실행
			String resultcode =(String)jobj.get("resultcode");
			String message =(String)jobj.get("message");
			
			jobj =(JSONObject)jobj.get("response"); 			//여기서 response가 json객체 안에 json객체이기 때문에
			String id =(String)jobj.get("id");					// 아이디 1 o 비번 2 x 
			String email =(String)jobj.get("email");			// 이메일 3 o 
			String name =(String)jobj.get("name");				// 이름 4 O
			String nick = (String)jobj.get("nickname");			// 닉네임 5 o
			String phone = (String)jobj.get("mobile");			// 전화번호 6 o 주소 7 x SNSTYPE NAVER 8 SNSID EMAIL
			String photo = (String)jobj.get("profile_image");
			
			logger.info("id >>> : " + id);
			logger.info("email >>> : " + email);
			logger.info("name >>> : " + name);
			logger.info("nick >>> : " + nick);
			logger.info("phone >>> : " + phone);
			logger.info("photo >>> : " + photo);
	
			if(resultcode.equals("00")&& message.equals("success"))  {
			 //통신을 성공적으로 받았다면	
				mvo.setM_id(id);
				mvo.setM_name(name);
				mvo.setM_email(email);
				mvo.setM_nick(nick);
				mvo.setM_phone(phone);
				mvo.setM_photo(photo);
				mvo.setM_snsid(email);
				
				// 이미 아이디가 있는지 여부를 확인합니다.
				MemberVO nsVO;
				nsVO= loginService.naverSelect(mvo);
				if(nsVO!=null) {
					String m_num = nsVO.getM_num();
					String m_id = nsVO.getM_id();
					String m_nick = nsVO.getM_nick();
					String m_photo = nsVO.getM_photo();
					logger.info("m_num >>> : " + m_num);
					logger.info("m_id >>> : " + m_id);
					logger.info("m_nick >>> : " + m_nick);
					logger.info("m_photo >>> : " + m_photo);
					
					HttpSession session=request.getSession();
					session.setAttribute("m_id", m_id);
					session.setAttribute("m_nick", m_nick);
					session.setAttribute("m_photo", m_photo);
					
					session.setMaxInactiveInterval(-1);//세션 무한대
				}else {
//					네이버 아이디가 없으면 회원 가입 시킨다.
					int nCnt = loginService.naverInsert(mvo);
					
					if(nCnt > 0) {
					
					logger.info("LoginController naverInsert 회원가입완료 >>> ");
					MemberVO resultVO;
					resultVO = loginService.naverLogin(mvo);
					
					String m_num=resultVO.getM_num();
					String m_id = resultVO.getM_id();
					String m_nick = resultVO.getM_nick();
					String m_photo = resultVO.getM_photo();
					logger.info("m_num >>> : " + m_num);
					logger.info("m_id >>> : " + m_id);
					logger.info("m_nick >>> : " + m_nick);
					logger.info("m_photo >>> : " + m_photo);
					
					HttpSession session=request.getSession();
					
					session.setAttribute("m_num", m_num);
					session.setAttribute("m_nick", m_nick);
					session.setAttribute("m_photo", m_photo);
					session.setMaxInactiveInterval(-1);//세션 무한대
					}else{
						// 회원가입을 시키지 못했을 경우 실행됩니다.
						System.out.println("insert가 실행되지 않았습니다.");
					}//end of if(insert result) 
				}//end of if(naverSelect mnum)
			}else{
				System.out.println("네이버 API에서 값을 받아오지 못했습니다.");
			} //end of if(resultcode, massage)
        } catch (ParseException e) {
			System.out.println("json 객체 변환실패");
			e.printStackTrace();
		}//end of try catch
       
        return "login/loginSucc";
	}
	
//	-------- KAKAO LOGIN -------------------------------------------------------------------
	@RequestMapping(value="/kakaoCallback.bp")
	public String kakaoCallback() {
		logger.info("LoginController kakaoCallback 함수 진입 성공 >>> :");
		
		return "login/kakaoCallback";
	}
	
	
	@RequestMapping(value = "/kakaologin")
	public String kakaoLogin(Model model, HttpServletRequest request) {
		logger.info("LoginController kakaoLogin 함수 진입 성공 >>> :");
		
		String access_token = (String) request.getAttribute("access_token");
		logger.info("kakaoLogin access_token >>> : " + access_token);
		String token = access_token;
		String header = "Bearer " + token;
		String apiURL = "https://kapi.kakao.com/v2/user/me";
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);
		logger.info("responseBody >>> : " + responseBody);
		
		
        JSONObject jobj = new JSONObject();
        JSONParser parser = new JSONParser();
        MemberVO mvo = new MemberVO();
        
        try {
			jobj = (JSONObject)parser.parse(responseBody);
			logger.info("jobj >>> : " + jobj);
			
			// 카카오에서 준 id 값
			Long kakao_id = (Long)jobj.get("id");
			String id = Long.toString(kakao_id);
			
			// KAKAO_ACCOUNT 안에 이름, 닉네임, 포토, 이메일 들어 있습니다.
			JSONObject kakao_account =(JSONObject)jobj.get("kakao_account");
			String email = (String)kakao_account.get("email"); 						// 이메일 4
			
			// 
			JSONObject profile =(JSONObject)kakao_account.get("profile");
			String nick = (String)profile.get("nickname");							// 이름, 닉네임 값 사용 5 6
			String photo = (String)profile.get("profile_image_url");				// 사진	8
			
			
			
			logger.info("id >>> : " + id);
			logger.info("email >>> : " + email);
			logger.info("kakao_account  >>> : " + kakao_account);
			logger.info("nick >>> : " + nick);
			logger.info("photo >>> : " + photo);
	
			if(id != null)  {
				//통신을 성공적으로 받았다면	
				mvo.setM_id(id);
				mvo.setM_name(nick);	
				mvo.setM_nick(nick);
				mvo.setM_email(email);
				mvo.setM_photo(photo);
				mvo.setM_snsid(email);
				
				// 이미 아이디가 있는지 여부를 확인합니다.
				MemberVO ksVO;
				ksVO= loginService.kakaoSelect(mvo);
				if(ksVO!=null) {
					String m_num = ksVO.getM_num();
					String m_id = ksVO.getM_id();
					String m_nick = ksVO.getM_nick();
					String m_photo = ksVO.getM_photo();
					logger.info("m_num >>> : " + m_num);
					logger.info("m_id >>> : " + m_id);
					logger.info("m_nick >>> : " + m_nick);
					logger.info("m_photo >>> : " + m_photo);
					
					HttpSession session=request.getSession();
					session.setAttribute("m_id", m_id);
					session.setAttribute("m_nick", m_nick);
					session.setAttribute("m_photo", m_photo);
					
					session.setMaxInactiveInterval(-1);//세션 무한대
				}else {
					// 카카오 아이디가 없으면 회원 가입 시킨다.
					int nCnt = loginService.kakaoInsert(mvo);
					
					if(nCnt > 0) {
					
					logger.info("LoginController naverInsert 회원가입완료 >>> ");
					MemberVO resultVO;
					resultVO = loginService.kakaoLogin(mvo);

					String m_num = resultVO.getM_num();
					String m_id = 	resultVO.getM_id();
					String m_nick = resultVO.getM_nick();
					String m_photo = resultVO.getM_photo();
					logger.info("m_num >>> : " + m_num);
					logger.info("m_id >>> : " + m_id);
					logger.info("m_nick >>> : " + m_nick);
					logger.info("m_photo >>> : " + m_photo);
					
					HttpSession session=request.getSession();
					
					session.setAttribute("m_num", m_num);
					session.setAttribute("m_nick", m_nick);
					session.setAttribute("m_photo", m_photo);
					session.setMaxInactiveInterval(-1);//세션 무한대
					}else{
						// 회원가입을 시키지 못했을 경우 실행됩니다.
						System.out.println("insert가 실행되지 않았습니다.");
					}//end of if(insert result) 
				}//end of if(naverSelect mnum)
			}else{
				System.out.println("카카오 API에서 값을 받아오지 못했습니다.");
			} //end of if
        } catch (ParseException e) {
			System.out.println("json 객체 변환실패");
			e.printStackTrace();
		}//end of try catch
		
		return "login/loginSucc"; 
	}
	
//	-------- RestFul 방식의 데이터 받아오기 위한 메소드 -------------------------------------------------------------------
	public static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}
	
	public static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다 >>> : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다 >>> : " + apiUrl, e);
		}
	}
	
	public static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다. >>> : ", e);
		}
	}
}
