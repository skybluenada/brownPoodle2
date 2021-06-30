package com.brownpoodle.rboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.rboard.dao.RboardDAO;
import com.brownpoodle.rboard.vo.RboardVO;

@Service
@Transactional
public class RboardServiceImpl implements RboardService {

	// service DAO연결 
	private RboardDAO rboardDAO;
	
	// 생성자에 DI
	@Autowired(required = false)
	public RboardServiceImpl(RboardDAO rboardDAO) {
		this.rboardDAO = rboardDAO;
	}

	@Override
	public List<RboardVO> rboardSelectAll(RboardVO rbvo) {
		return rboardDAO.rboardSelectAll(rbvo);
	}
	
	@Override
	public List<RboardVO> rboardSelect(RboardVO rbvo) {
		return rboardDAO.rboardSelect(rbvo);
	}

	@Override
	public int rboardInsert(RboardVO rbvo) {
		return rboardDAO.rboardInsert(rbvo);
	}

	@Override
	public int rboardUpdate(RboardVO rbvo) {
		return rboardDAO.rboardUpdate(rbvo);
	}

	@Override
	public int rboardDelete(RboardVO rbvo) {
		return rboardDAO.rboardDelete(rbvo);
	}

	

}
