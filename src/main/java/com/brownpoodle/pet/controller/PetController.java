package com.brownpoodle.pet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.brownpoodle.chabun.service.ChabunService;
import com.brownpoodle.common.ChaebunUtils;
import com.brownpoodle.common.CommonUtil;
import com.brownpoodle.common.FileUploadUtil;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.service.PetService;
import com.brownpoodle.pet.vo.PetVO;
import com.sun.istack.internal.logging.Logger;

@Controller
public class PetController {
	Logger logger = Logger.getLogger(PetController.class);
	
	private PetService petService;
	private ChabunService chabunService;
	
	@Autowired(required = false)
	public PetController(PetService petService,
						 ChabunService chabunService) {
		this.petService = petService;
		this.chabunService = chabunService;
	}
	
	// 반려동물 등록 폼으로 가기 ------------------------------------
	@RequestMapping("petForm")
	public String petForm() {
		logger.info("Controller petForm() 함수 진입 성공  ");
		return "/pet/petForm";
	}
	// 반려동물 등록  ----------------------------------------------
	@RequestMapping(value = "petInsert", method = RequestMethod.POST)
	public String petInsert (MultipartHttpServletRequest req) {
		logger.info("Controller petInsert() 함수 진입 성공");
		
		PetVO pvo = null;
		pvo = new PetVO();
		MemberVO mvo = new MemberVO();
		
		
		//동물번호 채번로직
		String p_num = ChaebunUtils.getPetChaebun(chabunService.getPetChabun().getP_num());
		pvo.setP_num(p_num);
		logger.info("컨트롤러 동물번호 채번 >>> : " + p_num);
		
		// 이미지 업로드
		FileUploadUtil fu = new FileUploadUtil();
		String file_name = fu.uploadFile(req, CommonUtil.P_IMG_UPLOAD_PATH);
		
		pvo.setM_num(req.getParameter("m_num"));
		pvo.setP_name(req.getParameter("p_name"));
		pvo.setP_age(req.getParameter("p_age"));
		pvo.setP_gender(req.getParameter("p_gender"));
		pvo.setP_type(req.getParameter("p_type"));
		pvo.setP_variety(req.getParameter("p_variety"));
		pvo.setP_photo(file_name);
		pvo.setP_regnum(req.getParameter("p_regnum"));
		
		logger.info("pvo.getP_name()" + pvo.getP_name());
		logger.info("pvo.getP_age()" + pvo.getP_age());
		
		int nCnt = petService.petInsert(pvo);
		logger.info("컨트롤러 petInsert / nCnt >>> : " + nCnt);
		if(nCnt > 0) {return "/pet/petInsert";	
		}else {return "/pet/petForm";}
	}
	
	// 반려동물 조회  ----------------------------------------------
	@RequestMapping(value = "petSelect", method = RequestMethod.GET)
	public String petSelect(PetVO pvo, Model m) {
		logger.info("Controller petSelect() 함수 진입 성공");
		
		PetVO _pvo = new PetVO();
		_pvo.setM_num(pvo.getM_num());
		
		List<PetVO> selectList = petService.petSelect(pvo);
		if(selectList.size() > 0) {
			logger.info("동물 셀렉트 selectList.size() >>> : " + selectList.size());
			m.addAttribute("selectList", selectList);
			return "/pet/petSelect";
		}else {return "/pet/petForm";}
		
	}
	
	// 반려동물 수정  ----------------------------------------------
	@RequestMapping("petUpdate")
	public String petUpdate(MultipartHttpServletRequest req, Model m) {
		logger.info("Controller petUpdate() 함수 진입 성공");
		
		//PetVO pvo = new PetVO();
		PetVO pvo = null;
		pvo = new PetVO();
		
		pvo.setP_num(req.getParameter("p_num"));
		logger.info("pvo.getP_num() >>> : " + pvo.getP_num());
		
		// 이미지 업로드
		FileUploadUtil fu = new FileUploadUtil();
		String file_name = fu.uploadFile(req, CommonUtil.P_IMG_UPLOAD_PATH);
				
		pvo.setP_name(req.getParameter("p_name"));
		pvo.setP_age(req.getParameter("p_age"));
		pvo.setP_gender(req.getParameter("p_gender"));
		pvo.setP_type(req.getParameter("p_type"));
		pvo.setP_variety(req.getParameter("p_variety"));
		pvo.setP_photo(file_name);
		pvo.setP_regnum(req.getParameter("p_regnum"));
		
		int nCnt = petService.petUpdate(pvo);
		logger.info("petUpdate nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			List<PetVO> selectList = petService.petSelect(pvo);
			m.addAttribute("selectList", selectList);
			logger.info("동물정보 수정 성공");
			return "/pet/petSelect";
			
		}else {return "/pet/petSelect";}
		
		//return "/pet/petUpdate";
	}
	
	// 반려동물 삭제  ----------------------------------------------
	@RequestMapping("petDelete")
	public String petDelete(PetVO pvo) {
		logger.info("Controller petDelete() 함수 진입 성공");
		
		logger.info("pvo.getP_num() >>> : " + pvo.getP_num());
		int nCnt = petService.petDelete(pvo);
		logger.info("petDelete nCnt >>> : " + nCnt);
		
		String msg = "";
		if (nCnt > 0) {
			msg = "DELETE_OK";
		}else {
			msg = "DELETE_FAIL";
		}
		return "/pet/petDelete";
	}

	
}
