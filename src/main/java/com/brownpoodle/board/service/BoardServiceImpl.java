package com.brownpoodle.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.board.dao.BoardDAO;
import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.member.vo.MemberVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	// Service와 DAO 연결 
	private BoardDAO boardDAO;
	
	// 생성자에 DI
	@Autowired(required = false)
	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	@Override
	public List<BoardVO> boardSelect(BoardVO bvo) {
		return boardDAO.boardSelect(bvo);
	}

	@Override
	public List<BoardVO> boardSelectAll(BoardVO bvo) {
		return boardDAO.boardSelectAll(bvo);
	}

	// ●게시판 글쓰기
	@Override
	public int boardInsert(BoardVO bvo) {
		return boardDAO.boardInsert(bvo);
	}

	// ●게시판 글수정
	@Override
	public int boardUpdate(BoardVO bvo) {
		return boardDAO.boardUpdate(bvo);
	}

	// ●게시판 글삭제 
	@Override
	public int boardDelete(BoardVO bvo) {
		return boardDAO.boardDelete(bvo);
	}

	//===========================좋아요============================
	// 좋아요 수 출력 : selectAll과 합치기
	@Override
	public List<BoardVO> boardLikeSelect(BoardVO bvo) {
		return boardDAO.boardLikeSelect(bvo);
	}

	// 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
	@Override
	public List<BoardVO> boardLikeCheck(BoardVO bvo) {
		return boardDAO.boardLikeCheck(bvo);
	}

	// 처음으로 좋아요 눌렀을 때, 좋아요 테이블 인서트
	@Override
	public int boardLikeInsert(BoardVO bvo) {
		return boardDAO.boardLikeInsert(bvo);
	}

	// BOARD 테이블의 B_LIKE +1 업데이트
	@Override
	public int boardLikePlus(BoardVO bvo) {
		return boardDAO.boardLikePlus(bvo);
	}

	// 취소했다가 다시 좋아요 눌렀을 때, 좋아요 테이블 업데이트
	// 좋아요 취소하면, 좋아요 테이블 업데이트
	@Override
	public int boardLikeUpdateY(BoardVO bvo) {
		return boardDAO.boardLikeUpdateY(bvo);
	}
	
	@Override
	public int boardLikeUpdateN(BoardVO bvo) {
		return boardDAO.boardLikeUpdateN(bvo);
	}

	// BOARD 테이블의 B_LIKE -1업데이트
	@Override
	public int boardLikeMinus(BoardVO bvo) {
		return boardDAO.boardLikeMinus(bvo);
	}


}
