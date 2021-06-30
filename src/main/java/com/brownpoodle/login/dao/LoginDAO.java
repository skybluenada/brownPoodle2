package com.brownpoodle.login.dao;

import java.util.List;

import com.brownpoodle.login.vo.ID_AuthNumVO;
import com.brownpoodle.login.vo.PW_AuthNumVO;
import com.brownpoodle.member.vo.MemberVO;
import com.brownpoodle.pet.vo.PetVO;

public interface LoginDAO {
	public int loginCheck(MemberVO mvo);	// 로그인 체크 - ID,PW DB와 대조 맞으면 로그인 성공
	public List<MemberVO> loginData(MemberVO mvo);
	public List<PetVO> petData(PetVO pvo);
	
	public int idAuthEmailCheck(MemberVO mvo);	// 인증번호 이메일 체크 - 이름, 이메일로 DB 조회 성공시 인증번호
	public List<ID_AuthNumVO> idAuthSeq();// 인증번호 SEQ - 인증번호 생성로직
	public int idAuthInsert(ID_AuthNumVO ivo);// 인증번호 입력 - 생성된 인증번호 DB에 Insert
	public int idAuthSelect(ID_AuthNumVO ivo);// Insert한 인증번호 조회
	public List<MemberVO> idAuthEmailIdFind(MemberVO mvo); //이메일로 아이디 찾기
	public int idAuthDelete(ID_AuthNumVO ivo);
	

	// PW 찾기 ID 확인 -------------------------------------
	public int idFindPw(MemberVO mvo);
	
	// PW 찾기 인증번호
	public List<MemberVO> pwAuthEmailCheck(MemberVO mvo);
	
	// PW 인증번호 SEQ
	public List<PW_AuthNumVO> pwAuthSeq(); 
	
	// PW 인증번호 입력
	public int pwAuthInsert(PW_AuthNumVO pvo);
	
	// PW 인증번호 조회
	public List<PW_AuthNumVO> pwAuthSelect(PW_AuthNumVO pvo);
	
	// PW 인증번호 삭제
	public int pwDel(PW_AuthNumVO pvo);
	
	// PW 새로입력
	public int pwChange(MemberVO mvo);
	
	// NAVER 회원가입
	public int naverInsert(MemberVO memberVO);
		
	// NAVER 로그인
	public MemberVO naverLogin(MemberVO mvo);
		
	// NAVER 로그인
	public MemberVO naverSelect(MemberVO mvo);
	
	// KAKAO 회원가입
	public int kakaoInsert(MemberVO mvo);
		
	// KAKAO 로그인
	public MemberVO kakaoLogin(MemberVO mvo);
		
	// KAKAO 조회
	public MemberVO kakaoSelect(MemberVO mvo);
}
