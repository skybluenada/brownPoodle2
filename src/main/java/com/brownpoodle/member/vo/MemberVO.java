package com.brownpoodle.member.vo;

public class MemberVO {

	private String m_num;		//1. 회원번호
	private String m_id;		//2. 아이디
	private String m_pw;		//3. 비밀번호
	private String m_email;		//4. 이메일 주소
	private String m_name;		//5. 이름
	private String m_nick;		//6. 닉네임
	private String m_photo;		//7. 프로필 사진
	private String m_phone;		//8. 휴대전화
	private String m_addr;		//9. 주소
	private String m_snstype;	//10. 소셜 타입
	private String m_snsid;		//11. 소셜 ID
	private String m_deleteyn;	//12. 회원 탈퇴 여부
	private String m_insertdate;//13. 회원 가입일자
	private String m_updatedate;//14. 회원정보 수정일자
	
	
	public MemberVO() {
	}


	public MemberVO(String m_num, String m_id, String m_pw, String m_email, String m_name, String m_nick,
			String m_photo, String m_phone, String m_addr, String m_snstype, String m_snsid, String m_deleteyn,
			String m_insertdate, String m_updatedate) {
		this.m_num = m_num;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_email = m_email;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_photo = m_photo;
		this.m_phone = m_phone;
		this.m_addr = m_addr;
		this.m_snstype = m_snstype;
		this.m_snsid = m_snsid;
		this.m_deleteyn = m_deleteyn;
		this.m_insertdate = m_insertdate;
		this.m_updatedate = m_updatedate;
	}


	public String getM_num() {
		return m_num;
	}


	public String getM_id() {
		return m_id;
	}


	public String getM_pw() {
		return m_pw;
	}


	public String getM_email() {
		return m_email;
	}


	public String getM_name() {
		return m_name;
	}


	public String getM_nick() {
		return m_nick;
	}


	public String getM_photo() {
		return m_photo;
	}


	public String getM_phone() {
		return m_phone;
	}


	public String getM_addr() {
		return m_addr;
	}


	public String getM_snstype() {
		return m_snstype;
	}


	public String getM_snsid() {
		return m_snsid;
	}


	public String getM_deleteyn() {
		return m_deleteyn;
	}


	public String getM_insertdate() {
		return m_insertdate;
	}


	public String getM_updatedate() {
		return m_updatedate;
	}


	public void setM_num(String m_num) {
		this.m_num = m_num;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}


	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}


	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}


	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}


	public void setM_snstype(String m_snstype) {
		this.m_snstype = m_snstype;
	}


	public void setM_snsid(String m_snsid) {
		this.m_snsid = m_snsid;
	}


	public void setM_deleteyn(String m_deleteyn) {
		this.m_deleteyn = m_deleteyn;
	}


	public void setM_insertdate(String m_insertdate) {
		this.m_insertdate = m_insertdate;
	}


	public void setM_updatedate(String m_updatedate) {
		this.m_updatedate = m_updatedate;
	}

	
}
