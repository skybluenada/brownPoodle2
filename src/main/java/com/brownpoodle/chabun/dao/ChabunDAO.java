package com.brownpoodle.chabun.dao;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;
import com.brownpoodle.rboard.vo.RboardVO;

public interface ChabunDAO {

	// 필요한 채번 클래스 생성 
	public BoardVO getBoardChabun();
	public RboardVO getRboardChabun();
	public BoardVO getLikeChabun();
	
	// 필요한 채번 클래스 생성 
	public MemberVO getMemberChabun();
	public PetVO getPetChabun();
}
