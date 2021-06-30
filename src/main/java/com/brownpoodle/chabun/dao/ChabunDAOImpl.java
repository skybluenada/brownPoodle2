package com.brownpoodle.chabun.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;
import com.brownpoodle.rboard.vo.RboardVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {

	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public BoardVO getBoardChabun() {
		return sqlSession.selectOne("getBoardChabun");
	}

	@Override
	public RboardVO getRboardChabun() {
		return sqlSession.selectOne("getRboardChabun");
	}

	@Override
	public BoardVO getLikeChabun() {
		return sqlSession.selectOne("getLikeChabun");
	}

	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getMemberChabun");
	}

	@Override
	public PetVO getPetChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getPetChabun");
	}

}
