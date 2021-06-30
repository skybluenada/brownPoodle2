package com.brownpoodle.pet.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.member.dao.MemberDAO;
import com.brownpoodle.pet.dao.PetDAO;
import com.brownpoodle.pet.dao.PetDAOImpl;
import com.brownpoodle.pet.vo.PetVO;

@Service
@Transactional
public class PetServiceImpl implements PetService {
	Logger logger = Logger.getLogger(PetServiceImpl.class);
	
	private PetDAO petDAO;
	
	@Autowired(required = false)
	public PetServiceImpl(PetDAO petDAO) {
		this.petDAO = petDAO;
	}
	
	@Override
	public int petInsert(PetVO pvo) {
		logger.info("PetServiceImpl petInsert() >>> : ");
		return petDAO.petInsert(pvo);
	}

	@Override
	public List<PetVO> petSelect(PetVO pvo) {
		logger.info("PetServiceImpl petSelect() >>> : ");
		return petDAO.petSelect(pvo);
	}

	@Override
	public int petUpdate(PetVO pvo) {
		logger.info("PetServiceImpl petUpdate() >>> : ");
		return petDAO.petUpdate(pvo);
	}

	@Override
	public int petDelete(PetVO pvo) {
		logger.info("PetServiceImpl petDelete() >>> : ");
		return petDAO.petDelete(pvo);
	}

}
