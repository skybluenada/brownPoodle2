package com.brownpoodle.login.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.login.dao.LoginDAO;
import com.brownpoodle.login.vo.ID_AuthNumVO;
import com.brownpoodle.login.vo.PW_AuthNumVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;


@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	Logger logger = Logger.getLogger(LoginServiceImpl.class);
	
	private LoginDAO loginDAO;
	
	public LoginServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired(required = false)
	public LoginServiceImpl(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}
	
	
	@Override
	public int loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl loginCheck() >>> : ");
		return loginDAO.loginCheck(mvo);
	}
	
	@Override
	public List<MemberVO> loginData(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl loginData() >>> : ");
		return loginDAO.loginData(mvo);
	}
	
	@Override
	public List<PetVO> petData(PetVO pvo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl petData() >>> : ");
		return loginDAO.petData(pvo);
	}
	

	@Override
	public int idAuthEmailCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthEmailCheck() >>> : ");
		return loginDAO.idAuthEmailCheck(mvo);
	}

	@Override
	public List<ID_AuthNumVO> idAuthSeq() {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthSeq() >>> : ");
		return loginDAO.idAuthSeq();
	}

	@Override
	public int idAuthInsert(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthInsert() >>> : ");
		return loginDAO.idAuthInsert(ivo);
	}

	@Override
	public int idAuthSelect(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthSelect() >>> : ");
		return loginDAO.idAuthSelect(ivo);
	}

	@Override
	public List<MemberVO> idAuthEmailIdFind(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthEmailIdFind() >>> : ");
		return loginDAO.idAuthEmailIdFind(mvo);
	}

	@Override
	public int idAuthDelete(ID_AuthNumVO ivo) {
		// TODO Auto-generated method stub
		logger.info("LoginServiceImpl idAuthDelete() >>> : ");
		return loginDAO.idAuthDelete(ivo);
	}
	
	//------------------------------------------------------------------------------


	@Override
	public int idFindPw(MemberVO mvo) {
		logger.info("LoginServiceImpl idFindPw() >>> : ");
		return loginDAO.idFindPw(mvo);
	}
	
	@Override
	public List<MemberVO> pwAuthEmailCheck(MemberVO mvo) {
		logger.info("LoginServiceImpl pwAuthEmailCheck() >>> : ");
		return loginDAO.pwAuthEmailCheck(mvo);
	}

	@Override
	public List<PW_AuthNumVO> pwAuthSeq() {
		logger.info("LoginServiceImpl pwAuthSeq() >>> : ");
		return loginDAO.pwAuthSeq();
	}

	@Override
	public int pwAuthInsert(PW_AuthNumVO pvo) {
		logger.info("LoginServiceImpl pwAuthInsert() >>> : ");
		return loginDAO.pwAuthInsert(pvo);
	}

	@Override
	public List<PW_AuthNumVO> pwAuthSelect(PW_AuthNumVO pvo) {
		logger.info("LoginServiceImpl pwAuthSelect() >>> : ");
		return loginDAO.pwAuthSelect(pvo);
	}

	@Override
	public int pwDel(PW_AuthNumVO pvo) {
		logger.info("LoginServiceImpl pwDel() >>> : ");
		return loginDAO.pwDel(pvo);
	}
	
	@Override
	public int pwChange(MemberVO mvo) {
		logger.info("LoginServiceImpl pwChange() >>> : ");
		return loginDAO.pwChange(mvo);
	}

	
//-----------  네이버 -------------------------------------------------------------------------------------------
	@Override
	public int naverInsert(MemberVO mvo) {
		logger.info("LoginServiceImpl naverInsert() >>> : ");
		
		return loginDAO.naverInsert(mvo);
	}

	@Override
	public MemberVO naverLogin(MemberVO mvo) {
		logger.info("LoginServiceImpl naverLogin() >>> : ");
		
		return loginDAO.naverLogin(mvo);
	}

	@Override
	public MemberVO naverSelect(MemberVO mvo) {
		logger.info("LoginServiceImpl naverSelect() >>> : ");
		
		return loginDAO.naverSelect(mvo);
	}

//	-----------  카카오 -------------------------------------------------------------------------------------------
	@Override
	public int kakaoInsert(MemberVO mvo) {
		logger.info("LoginServiceImpl kakaoInsert() >>> : ");
		return loginDAO.kakaoInsert(mvo);
	}

	@Override
	public MemberVO kakaoLogin(MemberVO mvo) {
		logger.info("LoginServiceImpl kakaoLogin() >>> : ");
		return loginDAO.kakaoLogin(mvo);
	}

	@Override
	public MemberVO kakaoSelect(MemberVO mvo) {
		logger.info("LoginServiceImpl kakaoSelect() >>> : ");
		return loginDAO.kakaoSelect(mvo);
	}

	

}
