package com.brownpoodle.rboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.rboard.vo.RboardVO;

@Repository
public class RboardDAOImpl implements RboardDAO {
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<RboardVO> rboardSelectAll(RboardVO rbvo) {
		return sqlSessionTemplate.selectList("rboardSelectAll", rbvo);
	}

	@Override
	public List<RboardVO> rboardSelect(RboardVO rbvo) {
		return sqlSessionTemplate.selectList("rboardSelect", rbvo);
	}
	
	@Override
	public int rboardInsert(RboardVO rbvo) {
		return sqlSessionTemplate.insert("rboardInsert", rbvo);
	}

	@Override
	public int rboardUpdate(RboardVO rbvo) {
		return sqlSessionTemplate.update("rboardUpdate", rbvo);
	}

	@Override
	public int rboardDelete(RboardVO rbvo) {
		return sqlSessionTemplate.update("rboardDelete", rbvo);
	}

	


}
