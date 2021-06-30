package com.brownpoodle.login.vo;

public class ID_AuthNumVO {

	private String id_num;
	private String id_auth_num;
	private String m_email;
	private String id_auth_insertdate;
	
	
	public ID_AuthNumVO() {
	}


	public ID_AuthNumVO(String id_num, String id_auth_num, String m_email, String id_auth_insertdate) {
		this.id_num = id_num;
		this.id_auth_num = id_auth_num;
		this.m_email = m_email;
		this.id_auth_insertdate = id_auth_insertdate;
	}


	public String getId_num() {
		return id_num;
	}


	public String getId_auth_num() {
		return id_auth_num;
	}


	public String getM_email() {
		return m_email;
	}


	public String getId_auth_insertdate() {
		return id_auth_insertdate;
	}


	public void setId_num(String id_num) {
		this.id_num = id_num;
	}


	public void setId_auth_num(String id_auth_num) {
		this.id_auth_num = id_auth_num;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	public void setId_auth_insertdate(String id_auth_insertdate) {
		this.id_auth_insertdate = id_auth_insertdate;
	}
	
	

	
}
