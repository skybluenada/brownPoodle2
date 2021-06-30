package com.brownpoodle.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.brownpoodle.board.service.BoardService;
import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.chabun.service.ChabunService;
import com.brownpoodle.common.ChaebunUtils;
import com.brownpoodle.common.CommonUtil;
import com.brownpoodle.common.FileUploadUtil;

@Controller
public class BoardController {

	private Logger logger = Logger.getLogger(BoardController.class);
	
	// Controller와 Service 연결
	private BoardService boardService;
	private ChabunService chabunService;
	
	// 생성자에 DI
	@Autowired(required = false)
	public BoardController(BoardService boardService, ChabunService chabunService) {
		this.boardService = boardService;
		this.chabunService = chabunService;
	}
	
	// 게시글 전체 조회
	@RequestMapping(value = "boardSelectAll", method = RequestMethod.GET)
	public String boardSelectAll(@RequestParam(value = "curPage", defaultValue = "1") String curPage, 
								BoardVO bvo, Model model, HttpSession session) {
		
		logger.info("[BoardController -> boardSelectAll 진입!]");
		
		// 검색 조건
		logger.info("* 넘어온 getKeyfilter : " + bvo.getKeyfilter());
		logger.info("* 넘어온 getKeyword : " + bvo.getKeyword());
		logger.info("* 넘어온 getStartdate : " + bvo.getStartdate());
		logger.info("* 넘어온 getEnddate : " + bvo.getEnddate());
		
		logger.info("* 현재 페이지 : " + bvo.getCurpage());
		
		// 가장 마지막 페이지: 전체 게시글 수 / 페이지 사이즈 반올림 
		
		// paging 관련 변수 선언 및 초기화
		String pagesize = CommonUtil.B_PAGE_SIZE;		// 한 페이지당 보여줄 게시글 수
		String curpage = CommonUtil.B_CUR_PAGE;			// 현재 페이지
		String totalcount = CommonUtil.B_TOTAL_COUNT;	// 전체 게시글 수
	
		// jsp와 데이터 주고받으면서 현재 페이지가 달라졌다면 값 갱신해줌
		logger.info(" * 넘어온 curPage : " + curPage);
		if (curPage != null) curpage = curPage;
		
		bvo.setPagesize(pagesize);
		bvo.setCurpage(curpage);
		bvo.setTotalcount(totalcount);
		
		logger.info("*** 초기화한 getPagesize : " + bvo.getPagesize());
		logger.info("*** 초기화한 getCurpage : " + bvo.getCurpage());
		logger.info("*** 초기화한 getTotalcount : " + bvo.getTotalcount());
		
		String mnum = null;
		String mnick = null;
		//session.setAttribute("m_num", "M0002");
		
		// session 받아오기 
		if (session != null) {
			mnum  = (String) session.getAttribute("m_num");
			mnick = (String) session.getAttribute("m_nick");
			bvo.setM_num(mnum);
		}
//		
		// 멤버 번호 세팅
//		bvo.setM_num(mnum);
		bvo.setM_num("M0002");
		
		// 전체 게시글 조회한 결과, 검색 결과 담기
		List<BoardVO> listAll = boardService.boardSelectAll(bvo);
		
		model.addAttribute("listAll", listAll);
		model.addAttribute("search", bvo);
		
//		session.setAttribute("m_num", "M0002");
//		session.setAttribute("m_nick", "홍홍이");
//		

		return "board/boardSelectAll";
	}
	
	// 게시판 전체 조회 + 페이징 (json 으로 response - pom.xml 에 의존성 추가 필요)
	@RequestMapping(value = "boardSelectPaging", method = RequestMethod.GET)
	public @ResponseBody List<BoardVO> infiniteScroll(@RequestParam(value = "curPage", defaultValue = "1") String curPage,
//													@RequestParam(value = "keyfilter", defaultValue = "") String kfilter,
//													@RequestParam(value = "keyword", defaultValue = "") String kword,
//													@RequestParam(value = "startdate", defaultValue = "") String sdate,
//													@RequestParam(value = "enddate", defaultValue = "") String edate,
													BoardVO bvo) {
		logger.info("[BoardController -> infiniteScroll 진입!]");
		
		// jsp와 데이터 주고받으면서 현재 페이지가 달라졌다면 값 갱신해줌
		logger.info(" * 넘어온 curPage : " + curPage);
		String curpage = CommonUtil.B_CUR_PAGE;
		if (curPage != null) curpage = curPage;
		
		bvo.setPagesize(CommonUtil.B_PAGE_SIZE);
		bvo.setCurpage(curpage);
		
		logger.info(" * 넘어온 kfilter : " + bvo.getKeyfilter());
		logger.info(" * 넘어온 kword : " + bvo.getKeyword());
		logger.info(" * 넘어온 sdate : " + bvo.getStartdate());
		logger.info(" * 넘어온 edate : " + bvo.getEnddate());
		
//		bvo.setKeyfilter(kfilter);
//		bvo.setKeyword(kword);
//		bvo.setStartdate(sdate);
//		bvo.setEnddate(edate);		
		
		return boardService.boardSelectAll(bvo);
	}
	
	// 게시글 상세 조회 
	// session 처리 필요
	@RequestMapping(value = "boardSelect", method = RequestMethod.GET)
	public String boardSelect(BoardVO bvo, Model model, HttpSession session) {
		logger.info("[BoardController -> boardSelect 진입!]");
		
		logger.info(" * 상세 조회할 게시글 번호:" + bvo.getB_num());
		
		List<BoardVO> listS = boardService.boardSelect(bvo);
		model.addAttribute("listS", listS);
		
		// login 상태인지 확인
		if (session == null) {
			System.out.println("session null 입니다. ");
		}
		
		// test 세션 설정 
		//session.setAttribute("m_id", "user01");
		//session.setAttribute("m_nick", "홍홍이");
		//session.setAttribute("m_num", "M0002");
		
		String mnum = null;
		String mnick = null;
		//session.setAttribute("m_num", "M0002");
		
		// session 받아오기 
		if (session != null) {
			mnum  = (String) session.getAttribute("m_num");
			mnick = (String) session.getAttribute("m_nick");
			bvo.setM_num(mnum);
		}
//		
		// 멤버 번호 세팅
//		bvo.setM_num(mnum);
		bvo.setM_num("M0002");
		
		bvo.setM_num("M0002");// 회원번호 임의로 세팅★★★
		System.out.println("BoardController boardLikeSelect bvo.getB_num() >>> :" + bvo.getB_num());
		
		List<BoardVO> likeSelect = boardService.boardLikeSelect(bvo);
		int flag = 0;
		
		if(likeSelect.size()==1) {	// 좋아요 수 select
			model.addAttribute("likeSelect", likeSelect);
			List<BoardVO> likeCheck = boardService.boardLikeCheck(bvo);
			System.out.println("BoardController boardLikeSelect likeCheck >>> : " + likeCheck);
			System.out.println("BoardController boardLikeSelect likeCheck.size() >>> : " + likeCheck.size());
			
			if(likeCheck.size() == 0 || likeCheck.get(0).getLike_deleteyn().equals("N")) { // 좋아요 여부 확인 : 좋아요 테이블에서 
				flag = 0;	// 좋아요를 누르지 않은 경우 
			}else {
				flag = 1;	// 좋아요를 누른 경우 
			}
		}
		
		model.addAttribute("likeCheck", flag);
		
		return "board/boardSelect";
	}
	
	// ●게시판 글쓰기 페이지로 이동
	@RequestMapping(value = "boardInsertForm", method = RequestMethod.GET)
	public String goInsertForm(Model model, HttpSession session) {
		logger.info("[BoardController -> goInsertForm 진입!]");
		// login 상태인지 확인
		if (session == null) {
			System.out.println("session null 입니다. ");
		}
		
		// test 세션 설정 
//		session.setAttribute("m_id", "user01");
//		session.setAttribute("m_nick", "홍홍이");
		
		return "board/boardInsertForm";
	}
	
	// ●게시판 글쓰기 
	@RequestMapping(value = "boardInsert", method=RequestMethod.POST)
	public String boardInsert(MultipartHttpServletRequest request, HttpSession session) { // MultipartHttpServletRequest -> HttpServletRequest
		logger.info("BoardController boardInsert 함수 진입 >>> : ");
		
		// 채번 구하기
		System.out.println("chabunService.getBoardChabun().getB_num() : " + chabunService.getBoardChabun().getB_num());
		String b_num = ChaebunUtils.getBoardChaebun(chabunService.getBoardChabun().getB_num());
		logger.info("BoardController boardInsert b_num >>> : " + b_num);
		
		// 이미지 업로드 
		FileUploadUtil fu = new FileUploadUtil();
		// 이미지 파일 원본 사이즈 크기 조절 하기
		// boolean bool = fu.uploadFile(request, "boardimg"); // request -> mpRequest
		// logger.info("BoardController boardInsert bool >>> : " + bool);
	
		// 수정 !!!
		String file_name = fu.uploadFile(request, CommonUtil.B_IMG_UPLOAD_PATH);
		if (file_name != null) { 
			
			// 채번, 이미지 업로드 성공하면 VO 세팅하기
			BoardVO _bvo = null;
			_bvo = new BoardVO();
			
			// ===================수정!!!=========================
			_bvo.setB_num(b_num);
			_bvo.setB_subject(request.getParameter("b_subject"));
			_bvo.setB_name(request.getParameter("b_name"));
			_bvo.setB_content(request.getParameter("b_content"));
			_bvo.setB_file(file_name);
			// ===================수정=========================
			
			logger.info("BoardController boardInsert _bvo.getB_num() >>> : " + _bvo.getB_num());
			logger.info("BoardController boardInsert _bvo.getB_name() >>> : " + _bvo.getB_name());
			logger.info("BoardController boardInsert _bvo.getB_file() >>> : " + _bvo.getB_file());
			
			int nCnt = boardService.boardInsert(_bvo);
			logger.info("BoardController boardInsert nCnt >>> : " + nCnt);
			
			if (nCnt > 0) {
				return "board/boardInsert";
			}
			
		} else {
			System.out.println("BoardController boardInsert file_name >>> " + file_name);
		} // end of out if
		
		return "board/boardInsertForm";
		
	}
	
	// ●게시판 글수정 페이지로 이동
	@RequestMapping(value = "boardUpdateForm", method = RequestMethod.GET)
	public String goUpdateForm(BoardVO bvo, Model model, HttpSession session) {
		logger.info("[BoardController -> goUpdateForm 진입!]");
		
		logger.info(" * 상세 조회할 게시글 번호:" + bvo.getB_num());
		
		List<BoardVO> listS = boardService.boardSelect(bvo);
		model.addAttribute("listS", listS);
		
		// login 상태인지 확인
		if (session == null) {
			System.out.println("session null 입니다. ");
		}
		
		// test 세션 설정 
		//session.setAttribute("m_id", "user01");
		//session.setAttribute("m_nick", "홍홍이");
		
		return "board/boardUpdateForm";
	}
	
	
	// ●게시판 글수정
	@RequestMapping(value = "boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardVO bvo, Model model, HttpSession session) {
		logger.info("BoardController boardUpdate 함수 진입 >>> : ");
		
		logger.info("BoardController boardUpdate bvo.getB_num() >>> : " + bvo.getB_num());
		logger.info("BoardController boardUpdate bvo.getB_content() >>> :" + bvo.getB_content());
		
		int nCnt = boardService.boardUpdate(bvo);
		logger.info("BoardController boardUpdate nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			return "board/boardUpdate";
		}
		
		return "board/boardSelectAll";
	}
	
	// ●게시판 글삭제  : ajax로 처리
	@RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(BoardVO bvo, HttpSession session) {
		logger.info("BoardController boardDelete 함수진입 >>> : ");
		
		logger.info("BoardController boardDelete bvo.getB_num() >>> : " + bvo.getB_num());
		int nCnt = boardService.boardDelete(bvo);
		logger.info("BoardController boardDelete nCnt >>> : " + nCnt);
		
		String msg = "";
		if(nCnt > 0) {
			msg = "DELETE_OK";
		}else {
			msg = "DELETE_FAIL";
		}
		
		return msg;
	}
	
	// ============================Update, Delete 디버깅=================================
	// ●디버깅 페이지로 이동
		@RequestMapping(value = "boardDebugForm", method=RequestMethod.GET)
		public String boardDebugForm() {
			return "board/boardDebugForm";
		}
	// ================================================================================

    // ============================좋아요 Toy 프로젝트======================================
		
		// 좋아요 를 눌렀을 때 : ajax 통신 =======> 여기부터 !!!!!
		@RequestMapping(value = "boardLikeCheck", method = RequestMethod.POST) // ★수정수정 : POST -> GET
		@ResponseBody
		public Map<String,Object> boardLikeCheck(BoardVO bvo) { 
			logger.info("BoardController boardLikeCheck 함수 진입 >>> :");
			
			int resultCheck = 1; // -> 1이면 ♥ / 0이면 ♡  /  -1이면 에러  
			Map<String, Object> resultMap = new HashMap<>();
			
			// bvo.setB_num("B0003");// 글번호 임의로 세팅★★★ ?? view에서 받아오기 ?
			// bvo.setM_num("M0001");// 회원번호 임의로 세팅★★★ ?? view에서 받아오기 ?
			System.out.println("BoardController boardLikeCheck bvo.getB_num() >>> :" + bvo.getB_num());
			System.out.println("BoardController boardLikeCheck bvo.getM_num() >>> :" + bvo.getM_num());
			
			try {
				// 처음 좋아요 누른건지 체크
				List<BoardVO> listCheck = boardService.boardLikeCheck(bvo);
				if(listCheck.size() == 0) { // 처음 좋아요 누른 경우
					System.out.println("BoardController boardLikeCheck listCheck.size() == 0 진입 >>>");
					System.out.println("BoardController boardLikeCheck bvo.getB_num() >>> :" + bvo.getB_num());
					System.out.println("BoardController boardLikeCheck bvo.getM_num() >>> :" + bvo.getM_num());
					
					// 좋아요 테이블에 insert : 좋아요 채번!!! + 회원번호랑 게시글번호 임의지정해서 INSERT
					// String b_num = ChaebunUtils.getBoardChaebun(chabunService.getBoardChabun().getB_num());
					String lnum = ChaebunUtils.getLikeChaebun(chabunService.getLikeChabun().getLike_num());
					bvo.setLike_num(lnum); // ★수정수정 
					System.out.println("BoardController boardLikeCheck bvo.getLike_num() >>> : " + bvo.getLike_num());
					
					boardService.boardLikeInsert(bvo);
					
					// BOARD 테이블의 B_LIKE +1 업데이트 : boardLikePlus
					boardService.boardLikePlus(bvo);
					resultCheck = 1; // -> 1이면 ♥
					
				}else if(listCheck.get(0).getLike_deleteyn().equals("N")) { // 취소했다가 다시 눌렀을 경우 
					System.out.println("BoardController boardLikeCheck listCheck.get(0).getLike_deleteyn().equals(N) 진입 >>>");
					System.out.println("BoardController boardLikeCheck bvo.getB_num() >>> :" + bvo.getB_num());
					System.out.println("BoardController boardLikeCheck bvo.getM_num() >>> :" + bvo.getM_num());
					
					// 좋아요 테이블 업데이트 : boardLikeUpdate
					boardService.boardLikeUpdateY(bvo);
					
					// BOARD 테이블의 B_LIKE +1 업데이트 : boardLikePlus
					boardService.boardLikePlus(bvo);
					resultCheck = 1; // -> 1이면 ♥
				
				}else { // 좋아요 취소 했을 경우
					System.out.println("BoardController boardLikeCheck else 진입 >>>");
					System.out.println("BoardController boardLikeCheck bvo.getB_num() >>> :" + bvo.getB_num());
					System.out.println("BoardController boardLikeCheck bvo.getM_num() >>> :" + bvo.getM_num());
					
					// 좋아요 취소하면, 좋아요 테이블 업데이트 : boardLikeUpdate
					boardService.boardLikeUpdateN(bvo);
					
					// BOARD 테이블의 B_LIKE -1업데이트 : boardLikeMinus
					boardService.boardLikeMinus(bvo);
					resultCheck = 0; // -> 0이면 ♡
				}
				// update가 모두 끝난 후, 해당 게시글 테이블의 좋아요수(b_like)가져오기
				List<BoardVO> likeSelect = boardService.boardLikeSelect(bvo);
				String b_like = likeSelect.get(0).getB_like();
				System.out.println("BoardController boardLikeCheck b_like >>> : " + b_like);
				resultMap.put("b_like", b_like); 
				
			}catch(Exception e) {
				logger.info("BoardController boardLikeCheck error >>> : " + e.getMessage());
				resultCheck = -1; // -> -1이면 error
			}
			
			System.out.println("BoardController boardLikeCheck resultCheck >>> : " + resultCheck); 
			resultMap.put("resultCheck", resultCheck); 
			
			return resultMap; // 1:♥, 0:♡, -1:에러   /  b_like 정보가 들어있는 map을 return 
		}


}
