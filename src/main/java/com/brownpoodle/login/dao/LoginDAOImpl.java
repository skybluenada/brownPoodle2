package com.brownpoodle.login.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.login.vo.ID_AuthNumVO;
import com.brownpoodle.login.vo.PW_AuthNumVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	Logger logger = Logger.getLogger(LoginDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl loginCheck() >>> : ");
		
		return sqlSession.selectOne("loginCheck", mvo);
	}
	
	@Override
	public List<MemberVO> loginData(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl loginData() >>> : ");
		return sqlSession.selectList("loginData", mvo);
	}
	
	@Override
	public List<PetVO> petData(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl petData() >>> : ");
		return sqlSession.selectList("petData", pvo);
	}

	@Override
	public int idAuthEmailCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthEmailCheck() >>> : ");
		return sqlSession.selectOne("idAuthEmailCheck", mvo);
	}

	@Override
	public List<ID_AuthNumVO> idAuthSeq() {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthSeq() >>> : ");
		return sqlSession.selectOne("idAuthSeq");
	}

	@Override
	public int idAuthInsert(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthInsert() >>> : ");
		return (Integer)sqlSession.insert("idAuthInsert", ivo);
	}

	@Override
	public int idAuthSelect(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthSelect() >>> : ");
		return sqlSession.selectOne("idAuthSelect", ivo);
	}

	@Override
	public List<MemberVO> idAuthEmailIdFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthEmailIdFind() >>> : ");
		return sqlSession.selectList("idAuthEmailIdFind", mvo);
		
	}
	
	@Override
	public int idAuthDelete(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginDAOImpl idAuthDelete() >>> : ");
		return sqlSession.delete("idAuthDelete", ivo);
	}
	
	//-----------------------------------------------------------------------------
	// PW find
	@Override
	public int idFindPw(MemberVO mvo) {
		logger.info("LoginDAOImpl idFindPw() >>> : ");
		return sqlSession.selectOne("idFindPw", mvo);
	}

	@Override
	public List<MemberVO> pwAuthEmailCheck(MemberVO mvo) {
		logger.info("LoginDAOImpl pwAuthEmailCheck() >>> : ");
		return sqlSession.selectList("pwAuthEmailCheck", mvo);
	}

	@Override
	public List<PW_AuthNumVO> pwAuthSeq() {
		logger.info("LoginDAOImpl pwAuthSeq() >>> : ");
		return (List) sqlSession.selectOne("pwAuthSeq");
	}

	@Override
	public int pwAuthInsert(PW_AuthNumVO pvo) {
		logger.info("LoginDAOImpl pwAuthInsert() >>> : ");
		return (Integer)sqlSession.insert("pwAuthInsert", pvo);
	}

	@Override
	public List<PW_AuthNumVO> pwAuthSelect(PW_AuthNumVO pvo) {
		logger.info("LoginDAOImpl pwAuthSelect() >>> : ");
		return sqlSession.selectOne("pwAuthSelect", pvo);
	}

	@Override
	public int pwDel(PW_AuthNumVO pvo) {
		logger.info("LoginDAOImpl pwDel() >>> : ");
		return sqlSession.selectOne("pwDel", pvo);
	}
	
	@Override
	public int pwChange(MemberVO mvo) {
		logger.info("LoginDAOImpl pwChange() >>> : ");		
		return sqlSession.selectOne("pwChange", mvo);
	}

	//-----------------------------------------------------------------------------
	// NAVER 

	@Override
	public int naverInsert(MemberVO memberVO) {
		logger.info("LoginDAOImpl naverInsert() >>> : ");
		
		return sqlSession.insert("naverInsert");
	}



	@Override
	public MemberVO naverLogin(MemberVO mvo) {
		logger.info("LoginDAOImpl naverLogin() >>> : ");
		
		return sqlSession.selectOne("naverLogin");
	}



	@Override
	public MemberVO naverSelect(MemberVO mvo) {
		logger.info("LoginDAOImpl naverSelect() >>> : ");
		
		return sqlSession.selectOne("naverSelect");
	}

//	------------------------------------------------------------------------------------------------------
// 	KAKAO
	@Override
	public int kakaoInsert(MemberVO mvo) {
		logger.info("LoginDAOImpl kakaoInsert() >>> : ");
		
		return sqlSession.insert("kakaoInsert");
	}



	@Override
	public MemberVO kakaoLogin(MemberVO mvo) {
		logger.info("LoginDAOImpl kakaoLogin() >>> : ");
		
		return sqlSession.selectOne("kakaoLogin");
	}



	@Override
	public MemberVO kakaoSelect(MemberVO mvo) {
		logger.info("LoginDAOImpl kakaoSelect() >>> : ");
		
		return sqlSession.selectOne("kakaoSelect");
	}




}
