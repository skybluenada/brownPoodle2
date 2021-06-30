package com.brownpoodle.pet.dao;

import java.util.List;

import com.brownpoodle.pet.vo.PetVO;

public interface PetDAO {
	
	public int petInsert(PetVO pvo);
	public List<PetVO> petSelect(PetVO pvo);
	public int petUpdate(PetVO pvo);
	public int petDelete(PetVO pvo);

}
