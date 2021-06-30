package com.brownpoodle.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.member.dao.MemberDAO;
import com.brownpoodle.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	private MemberDAO memberDAO;
	
	@Autowired(required = false)
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		logger.info("MemberServiceImpl memberInsert() >>> : ");
		return memberDAO.memberInsert(mvo);
	}

	@Override
	public List<MemberVO> memberSelect(MemberVO mvo) {
		logger.info("MemberServiceImpl memberSelect() >>> : ");
		return memberDAO.memberSelect(mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		logger.info("MemberServiceImpl memberUpdate() >>> : ");
		return memberDAO.memberUpdate(mvo);
	}

	@Override
	public int memberDelete(MemberVO mvo) {
		logger.info("MemberServiceImpl memberDelete() >>> : ");
		return memberDAO.memberDelete(mvo);
	}

	@Override
	public int memberIdCheck(MemberVO mvo) {
		logger.info("MemberServiceImpl memberIdCheck() >>> : ");
		return memberDAO.memberIdCheck(mvo);
	}

}
