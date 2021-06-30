package com.brownpoodle.board.service;

import java.util.List;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.member.vo.MemberVO;

public interface BoardService {

	public List<BoardVO> boardSelect(BoardVO bvo);
	public List<BoardVO> boardSelectAll(BoardVO bvo);
	public int boardInsert(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(BoardVO bvo);
	
	//====================좋아요====================
	public List<BoardVO> boardLikeSelect(BoardVO bvo);  // 좋아요 수 출력 : selectAll과 합치기
	public List<BoardVO> boardLikeCheck(BoardVO bvo);   // 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
	
	public int boardLikeInsert(BoardVO bvo);			// 처음으로 좋아요 눌렀을 때, 좋아요 테이블 인서트
	public int boardLikePlus(BoardVO bvo);				// BOARD 테이블의 B_LIKE +1 업데이트
	
	public int boardLikeUpdateY(BoardVO bvo);			// 취소했다가 다시 좋아요 눌렀을 때, 좋아요 테이블 업데이트
	public int boardLikeUpdateN(BoardVO bvo);
	
	public int boardLikeMinus(BoardVO bvo);				// BOARD 테이블의 B_LIKE -1업데이트
}
