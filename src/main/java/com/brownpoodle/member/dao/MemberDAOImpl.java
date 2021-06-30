package com.brownpoodle.member.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.member.service.MemberServiceImpl;
import com.brownpoodle.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	Logger logger = Logger.getLogger(MemberDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int memberInsert(MemberVO mvo) {
		logger.info("MemberDAOImpl memberInsert() >>> : ");
		return sqlSession.insert("memberInsert", mvo);
	}

	@Override
	public List<MemberVO> memberSelect(MemberVO mvo) {
		logger.info("MemberDAOImpl memberSelect() >>> : ");
		//return sqlSession.selectOne("memberSelect", mvo);
		return sqlSession.selectList("memberSelect", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		logger.info("MemberDAOImpl memberUpdate() >>> : ");
		return sqlSession.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(MemberVO mvo) {
		logger.info("MemberDAOImpl memberDelete() >>> : ");
		return sqlSession.delete("memberDelete", mvo);
	}

	@Override
	public int memberIdCheck(MemberVO mvo) {
		logger.info("MemberDAOImpl memberIdCheck() >>> : ");
		return sqlSession.selectOne("memberIdCheck", mvo);
	}

}
