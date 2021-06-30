package com.brownpoodle.walk.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.login.dao.LoginDAOImpl;
import com.brownpoodle.walk.vo.WalkVO;

@Repository
public class WalkDAOImpl implements WalkDAO {
	
	Logger logger = Logger.getLogger(WalkDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int walkDataInsert(WalkVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("walkDataInsert", wvo);
	}

	@Override
	public List<String> walkSelectAll(WalkVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("walkSelectAll", wvo);
	}

	@Override
	public List<WalkVO> walkSelect(WalkVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("walkSelect", wvo);
	}

}
