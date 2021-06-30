package com.brownpoodle.member.service;

import java.util.List;

import com.brownpoodle.member.vo.MemberVO;

public interface MemberService {
	
	public int memberInsert(MemberVO mvo);
	public List<MemberVO> memberSelect(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberDelete(MemberVO mvo);
	
	public int memberIdCheck(MemberVO mvo);
}
