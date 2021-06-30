package com.brownpoodle.pet.vo;

public class PetVO {
	
	private String p_num;		// 1. 동물 번호
	private String m_num;		// 
	private String p_name;		// 2. 동물 이름
	private String p_age;		// 3. 동물 나이
	private String p_gender;	// 4. 동물 성별
	private String p_type;		// 5. 동물 종류 - 강아지/고양이/기타
	private String p_variety;	// 6. 동물 품종
	private String p_photo;		// 7. 동물 사진
	private String p_regnum;	// 8. 동물 등록번호
	private String p_deleteyn;	// 9. 동물정보 삭제여부
	private String p_insertdate;// 10.동물정보 등록일자
	private String p_updatedate;// 11.동물정보 수정일자 
	
	
	public PetVO() {
		
	}


	public PetVO(String p_num, String m_num, String p_name, String p_age, String p_gender, String p_type,
			String p_variety, String p_photo, String p_regnum, String p_deleteyn, String p_insertdate,
			String p_updatedate) {
		this.p_num = p_num;
		this.m_num = m_num;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_type = p_type;
		this.p_variety = p_variety;
		this.p_photo = p_photo;
		this.p_regnum = p_regnum;
		this.p_deleteyn = p_deleteyn;
		this.p_insertdate = p_insertdate;
		this.p_updatedate = p_updatedate;
	}


	public String getP_num() {
		return p_num;
	}


	public void setP_num(String p_num) {
		this.p_num = p_num;
	}


	public String getM_num() {
		return m_num;
	}


	public void setM_num(String m_num) {
		this.m_num = m_num;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_age() {
		return p_age;
	}


	public void setP_age(String p_age) {
		this.p_age = p_age;
	}


	public String getP_gender() {
		return p_gender;
	}


	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}


	public String getP_type() {
		return p_type;
	}


	public void setP_type(String p_type) {
		this.p_type = p_type;
	}


	public String getP_variety() {
		return p_variety;
	}


	public void setP_variety(String p_variety) {
		this.p_variety = p_variety;
	}


	public String getP_photo() {
		return p_photo;
	}


	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}


	public String getP_regnum() {
		return p_regnum;
	}


	public void setP_regnum(String p_regnum) {
		this.p_regnum = p_regnum;
	}


	public String getP_deleteyn() {
		return p_deleteyn;
	}


	public void setP_deleteyn(String p_deleteyn) {
		this.p_deleteyn = p_deleteyn;
	}


	public String getP_insertdate() {
		return p_insertdate;
	}


	public void setP_insertdate(String p_insertdate) {
		this.p_insertdate = p_insertdate;
	}


	public String getP_updatedate() {
		return p_updatedate;
	}


	public void setP_updatedate(String p_updatedate) {
		this.p_updatedate = p_updatedate;
	}
	
	
}
