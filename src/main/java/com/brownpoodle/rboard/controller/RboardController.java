package com.brownpoodle.rboard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brownpoodle.board.controller.BoardController;
import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.chabun.service.ChabunService;
import com.brownpoodle.common.ChaebunUtils;
import com.brownpoodle.rboard.service.RboardService;
import com.brownpoodle.rboard.vo.RboardVO;

@Controller
public class RboardController {

	private Logger logger = Logger.getLogger(BoardController.class);
	
	// Controller와 Service 연결
	private RboardService rboardService;
	private ChabunService chabunService;
	
	// 생성자에 DI 
	public RboardController(RboardService rboardService, ChabunService chabunService) {
		this.rboardService = rboardService;
		this.chabunService = chabunService;
	}
	
	// 댓글 전체 조회
	@RequestMapping(value = "rboardSelectAll", method = RequestMethod.POST)
	public @ResponseBody List<RboardVO> rboardSelectAll(RboardVO rbvo) {
		logger.info("[RboardController -> rboardSelectAll 함수 진입!]");
		
		logger.info("조회할 댓글의 게시글 번호:" + rbvo.getB_num());
		
		return rboardService.rboardSelectAll(rbvo);
	}
	
	// 댓글 상세 조회 
	@RequestMapping(value = "rboardSelect", method = RequestMethod.POST)
	public @ResponseBody List<RboardVO> rboardSelect(RboardVO rbvo) {
		logger.info("[RboardController -> rboardSelect 함수 진입!]");
		
		logger.info("조회할 댓글의 번호:" + rbvo.getRb_num());
		
		return rboardService.rboardSelect(rbvo);
	}
	
	// 댓글 전체 조회 테스트 페이지로 이동 
	@RequestMapping(value = "rboardSelectAllTest", method = RequestMethod.GET)
	public String goSelectAllPage() {
		return "rboard/rboardSelectAllTest";
	}
	
	// 댓글 작성 테스트 페이지로 이동 
	@RequestMapping(value = "rboardInsertTest", method = RequestMethod.GET)
	public String goInsertPage() {
		return "rboard/rboardInsertTest";
	}
	// 댓글 입력
	@RequestMapping(value = "rboardInsert", method = RequestMethod.POST)
	public @ResponseBody String rboardInsert(RboardVO rbvo) {
		logger.info("[RboardController -> rboardInsert 함수 진입!]");
		
		String num = ChaebunUtils.getRboardChaebun(chabunService.getRboardChabun().getRb_num());
		logger.info(" > rboard 채번 결과: " + num);
		
		// 채번 세팅
		rbvo.setRb_num(num);
		
		int nCnt = rboardService.rboardInsert(rbvo);
		if (nCnt > 0) {
			return "INSERT_SUCC";
		}
		
		return "INSERT_FAIL";
	}
	
	// 댓글 수정
	@RequestMapping(value = "rboardUpdate", method = RequestMethod.POST)
	public @ResponseBody String rboardUpdate(RboardVO rbvo) {
		logger.info("[RboardController -> rboardUpdate 함수 진입!]");
		
		logger.info(" > 수정할 댓글 번호: " + rbvo.getRb_num());
		
		int nCnt = rboardService.rboardUpdate(rbvo);
		if (nCnt > 0) return "UPDATE_SUCC";
		
		return "UPDATE_FAIL";
	}
	
	// 댓글 삭제
	@RequestMapping(value = "rboardDelete", method = RequestMethod.POST)
	public @ResponseBody String rboardDelete(RboardVO rbvo) {
		logger.info("[RboardController -> rboardDelete 함수 진입!]");
		
		logger.info(" > 삭제할 댓글 번호: " + rbvo.getRb_num());
		
		int nCnt = rboardService.rboardDelete(rbvo);
		if (nCnt > 0) return "DELETE_SUCC";
		
		return "DELETE_FAIL";
	}
	
	
}
