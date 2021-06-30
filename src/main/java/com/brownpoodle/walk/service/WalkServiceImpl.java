package com.brownpoodle.walk.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brownpoodle.login.dao.LoginDAO;
import com.brownpoodle.login.service.LoginServiceImpl;
import com.brownpoodle.walk.dao.WalkDAO;
import com.brownpoodle.walk.vo.WalkVO;

@Service
public class WalkServiceImpl implements WalkService {
	
	Logger logger = Logger.getLogger(WalkServiceImpl.class);

	private WalkDAO walkDAO;
	
	public WalkServiceImpl() {}
	
	@Autowired(required = false)
	public WalkServiceImpl(WalkDAO walkDAO) {
		this.walkDAO = walkDAO;
	}
	
	// DB 입력
	@Override
	public int walkDataInsert(WalkVO wvo) {
		logger.info("WalkServiceImpl walkDataInsert() >>> : ");
		return walkDAO.walkDataInsert(wvo);
	}

	@Override
	public List<String> walkSelectAll(WalkVO wvo) {
		logger.info("WalkServiceImpl walkSelect() >>> : ");
		return walkDAO.walkSelectAll(wvo);
	}

	@Override
	public List<WalkVO> walkSelect(WalkVO wvo) {
		logger.info("WalkServiceImpl walkSelectAll() >>> : ");
		return walkDAO.walkSelect(wvo);
	}

}
