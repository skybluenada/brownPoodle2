package com.brownpoodle.login.vo;

public class PW_AuthNumVO {
	private String pw_num;
	private String pw_auth_num;
	private String m_id;
	private String pw_auth_insertdate;

	
	public PW_AuthNumVO() {
	}


	public PW_AuthNumVO(String pw_num, String pw_auth_num, String m_id, String pw_auth_insertdate) {
		this.pw_num = pw_num;
		this.pw_auth_num = pw_auth_num;
		this.m_id = m_id;
		this.pw_auth_insertdate = pw_auth_insertdate;
	}


	public String getPw_num() {
		return pw_num;
	}


	public String getPw_auth_num() {
		return pw_auth_num;
	}


	public String getM_id() {
		return m_id;
	}


	public String getPw_auth_insertdate() {
		return pw_auth_insertdate;
	}


	public void setPw_num(String pw_num) {
		this.pw_num = pw_num;
	}


	public void setPw_auth_num(String pw_auth_num) {
		this.pw_auth_num = pw_auth_num;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public void setPw_auth_insertdate(String pw_auth_insertdate) {
		this.pw_auth_insertdate = pw_auth_insertdate;
	}

	
	
	
}
