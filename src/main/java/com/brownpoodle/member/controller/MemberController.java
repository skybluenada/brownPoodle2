package com.brownpoodle.member.controller;

import java.util.List;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.brownpoodle.chabun.service.ChabunService;
import com.brownpoodle.common.ChaebunUtils;
import com.brownpoodle.common.CommonUtil;
import com.brownpoodle.common.FileUploadUtil;
import com.brownpoodle.member.service.MemberService;
import com.brownpoodle.member.vo.MemberVO;
import com.sun.istack.internal.logging.Logger;

@Controller
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	
	private MemberService memberService;
	private ChabunService chabunService;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired(required = false)
	public MemberController( MemberService memberService,
							 ChabunService chabunService,
							 BCryptPasswordEncoder bcryptPasswordEncoder ) {
		this.memberService = memberService;
		this.chabunService = chabunService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	// 회원가입 폼으로 가기-------------------------------------------
	@RequestMapping("memberForm")
	public String memberForm() {
		
		logger.info("Controller memberForm() 함수 진입 성공  ");
		
		return "/member/memberForm";
	}
	
	// 회원가입 등록-------------------------------------------MemberVO mvo, Model m / MultipartHttpServletRequest req / HttpServletRequest / @ModelAttribute
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	public String memberInsert(MultipartHttpServletRequest req, Model m) {
		logger.info("Controller memberInsert() 함수 진입 성공");
		
		
		MemberVO mvo = null;
		mvo = new MemberVO();
		
		// 회원번호 채번로직
		String m_num = ChaebunUtils.getMemberChaebun(chabunService.getMemberChabun().getM_num());
		mvo.setM_num(m_num);
		logger.info("컨트롤러 회원번호 채번 >>> : " + m_num);
		
		// 비밀번호 암호화 
		mvo.setM_pw(req.getParameter("m_pw"));
		logger.info("암호화 전 >>> : " + mvo.getM_pw());
//		mvo.setM_pw(bcryptPasswordEncoder.encode(mvo.getM_pw()));
//		logger.info("암호화 후 >>> : " + mvo.getM_pw());
		mvo.setM_pw(mvo.getM_pw());
		
		// 이미지 업로드
		FileUploadUtil fu = new FileUploadUtil();
		String file_name = fu.uploadFile(req, CommonUtil.M_IMG_UPLOAD_PATH);
		
		// 휴대전화
		String m_phone1 = req.getParameter("m_phone1");
		String m_phone2 = req.getParameter("m_phone2");
		String m_phone3 = req.getParameter("m_phone3");
		String m_phone = m_phone1.concat("-").concat(m_phone2).concat("-").concat(m_phone3);
		//String m_phone = m_phone1.concat(m_phone2).concat(m_phone3);
		
		
		// 주소
		String m_addr1 = req.getParameter("m_addr1");
		String m_addr2 = req.getParameter("m_addr2");
		String m_addr = m_addr1.concat(" ").concat(m_addr2);
		
		
		mvo.setM_id(req.getParameter("m_id"));
		mvo.setM_email(req.getParameter("m_email"));
		mvo.setM_name(req.getParameter("m_name"));
		mvo.setM_nick(req.getParameter("m_nick"));
		mvo.setM_photo(file_name);
		mvo.setM_phone(m_phone);
		mvo.setM_addr(m_addr);
		
		logger.info("mvo.getM_id()" + mvo.getM_id());
		logger.info("mvo.getM_pw()" + mvo.getM_pw());
		
		int nCnt = memberService.memberInsert(mvo);
		logger.info("컨트롤러 memberInsert / nCnt >>> : " + nCnt);
		if (nCnt > 0) {
			m.addAttribute("mmvo", mvo);
			return "/pet/petForm";
		}
		else {return "/member/memberForm";}
		
	}
	
	// 아이디 중복확인 -------------------------------------------
	@RequestMapping(value = "memberIdCheck", method = RequestMethod.GET)
	public String memberIdCheck(MemberVO mvo, Model m) {
		logger.info("Controller memberIdCheck() 함수 진입 성공");
		logger.info("아이디 중복 확인 / mvo.getM_id() " + mvo.getM_id());
		
		int nCnt = memberService.memberIdCheck(mvo);
		String msg = "";
		
		if (nCnt == 1) {
			msg = "이미 존재하는 아이디입니다.";
			m.addAttribute("msg", msg);
		} else {
			msg = "멋진 아이디네요!";
			m.addAttribute("msg", msg);
		}
		
		return "/member/idCheck";
	}
	
	// 회원정보 조회 ---------------------------------------------
	//@RequestMapping(value = "memberSelect", method = RequestMethod.POST)/("memberSelect")
	@RequestMapping(value = "memberSelect", method = RequestMethod.GET)
	public String memberSelect (MemberVO mvo, Model m, HttpSession session) {
		logger.info("Controller memberSelect() 함수 진입 성공");
		
		// 세션 가져오기 ★
//		mvo.setM_num("M0016");
		String mnum = null;
		if (session != null) {
			mnum = (String) session.getAttribute("m_num");
			System.out.println("mnum >>> : " + mnum);
			mvo.setM_num(mnum);
			System.out.println("Controller memberSelect() mnum >>> : " + mvo.getM_num());
		}
		
		List<MemberVO> selectList = memberService.memberSelect(mvo);
		logger.info("셀렉트selectList.size() >>> : " + selectList.size());
		
		if (selectList.size() > 0) {
			m.addAttribute("selectList", selectList);
			return "/member/memberSelect"; 
		}
		return "/member/memberForm"; 
	}
	
	// 회원정보 수정  ---------------------------------------------프로필사진 수정할 수 있도록
	@RequestMapping("memberUpdate")
	public String memberUpdate (MultipartHttpServletRequest req, Model m) {
		logger.info("Controller memberUpdate() 함수 진입 성공");
		
		MemberVO mvo = null;
		mvo = new MemberVO();	
		
		mvo.setM_num(req.getParameter("m_num"));
		logger.info("mvo.getM_num() >>> : " + mvo.getM_num());
		
		// 비밀번호 암호화 
		mvo.setM_pw(req.getParameter("m_pw"));
		logger.info("암호화 전 >>> : " + mvo.getM_pw());
//		mvo.setM_pw(bcryptPasswordEncoder.encode(mvo.getM_pw()));
//		logger.info("암호화 후 >>> : " + mvo.getM_pw());
		mvo.setM_pw(mvo.getM_pw());
		
		// 이미지 업로드
		FileUploadUtil fu = new FileUploadUtil();
		String file_name = fu.uploadFile(req, CommonUtil.M_IMG_UPLOAD_PATH);
		
		// 휴대전화
		String m_phone1 = req.getParameter("m_phone1");
		String m_phone2 = req.getParameter("m_phone2");
		String m_phone3 = req.getParameter("m_phone3");
		String m_phone = m_phone1.concat("-").concat(m_phone2).concat("-").concat(m_phone3);
		logger.info("m_phone >>> : " + m_phone);
		logger.info("m_phone.length() >>> : " + m_phone.length());
		
		
		// 주소
		String m_addr1 = req.getParameter("m_addr1");
		String m_addr2 = req.getParameter("m_addr2");
		String m_addr = m_addr1.concat(" ").concat(m_addr2);
		
		mvo.setM_id(req.getParameter("m_id"));
		mvo.setM_email(req.getParameter("m_email"));
		mvo.setM_name(req.getParameter("m_name"));
		mvo.setM_nick(req.getParameter("m_nick"));
		mvo.setM_photo(file_name);
		mvo.setM_phone(m_phone);
		mvo.setM_addr(m_addr);
		
		int nCnt = memberService.memberUpdate(mvo);
		logger.info("컨트롤러 memberUpdate / nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			List<MemberVO> selectList = memberService.memberSelect(mvo);
			m.addAttribute("selectList", selectList);
			return "/member/memberUpdate";
			}
		else {return "/member/memberSelect";}
		//return "/member/memberUpdate";
	}
	
	// 회원정보 삭제  ---------------------------------------------
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	//@ResponseBody // VO 객체를 JSON으로 바꿔서 HTTP body에 담는 스프링 어노테이션.
	public String memberDelete (MemberVO mvo) {
		logger.info("Controller memberDelete() 함수 진입 성공");
		
		logger.info("mvo.getM_num() >>> : " + mvo.getM_num());
		int nCnt = memberService.memberDelete(mvo);
		logger.info("memberDelete nCnt >>> : " + nCnt);
		
		return "/member/memberDelete";
	}
}
