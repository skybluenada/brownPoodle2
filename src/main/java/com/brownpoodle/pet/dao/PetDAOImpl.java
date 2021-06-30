package com.brownpoodle.pet.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.member.dao.MemberDAOImpl;
import com.brownpoodle.pet.vo.PetVO;

@Repository
public class PetDAOImpl implements PetDAO {
	Logger logger = Logger.getLogger(PetDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int petInsert(PetVO pvo) {
		logger.info("PetDAOImpl petInsert() >>> : ");
		return sqlSession.insert("petInsert", pvo);
	}

	@Override
	public List<PetVO> petSelect(PetVO pvo) {
		logger.info("PetDAOImpl petSelect() >>> : ");
		return sqlSession.selectList("petSelect", pvo);
	}

	@Override
	public int petUpdate(PetVO pvo) {
		logger.info("PetDAOImpl petUpdate() >>> : ");
		return sqlSession.update("petUpdate", pvo);
	}

	@Override
	public int petDelete(PetVO pvo) {
		logger.info("PetDAOImpl petDelete() >>> : ");
		return sqlSession.delete("petDelete", pvo);
	}

}
