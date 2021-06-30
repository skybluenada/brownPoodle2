package com.brownpoodle.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.member.vo.MemberVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 게시글 상세 조회 
	@Override
	public List<BoardVO> boardSelect(BoardVO bvo) {
		return sqlSessionTemplate.selectList("BoardSelect", bvo);
	}

	// 게시글 전체 조회 + 검색 + paging
	@Override
	public List<BoardVO> boardSelectAll(BoardVO bvo) {
		return sqlSessionTemplate.selectList("boardSelectAll", bvo);
	}
	
	// ●게시판 글쓰기
	@Override
	public int boardInsert(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.insert("boardInsert", bvo);
	}

	// ●게시판 글수정
	@Override
	public int boardUpdate(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardUpdate", bvo);
	}

	// ●게시판 글삭제 
	@Override
	public int boardDelete(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardDelete", bvo);
	}

	//===========================좋아요============================
	// 좋아요 수 출력 : selectAll과 합치기
	@Override
	public List<BoardVO> boardLikeSelect(BoardVO bvo) {
		return sqlSessionTemplate.selectList("boardLikeSelect", bvo);
	}

	// 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
	@Override
	public List<BoardVO> boardLikeCheck(BoardVO bvo) {
		return sqlSessionTemplate.selectList("boardLikeCheck", bvo);
	}

	// 처음으로 좋아요 눌렀을 때, 좋아요 테이블 인서트
	@Override
	public int boardLikeInsert(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.insert("boardLikeInsert", bvo);
	}

	// BOARD 테이블의 B_LIKE +1 업데이트
	@Override
	public int boardLikePlus(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardLikePlus", bvo);
	}

	// 취소했다가 다시 좋아요 눌렀을 때, 좋아요 테이블 업데이트
	// 좋아요 취소하면, 좋아요 테이블 업데이트
	@Override
	public int boardLikeUpdateY(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardLikeUpdateY", bvo);
	}

	@Override
	public int boardLikeUpdateN(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardLikeUpdateN", bvo);
	}

	// BOARD 테이블의 B_LIKE -1업데이트
	@Override
	public int boardLikeMinus(BoardVO bvo) {
		return (Integer)sqlSessionTemplate.update("boardLikeMinus", bvo);
	}

}
