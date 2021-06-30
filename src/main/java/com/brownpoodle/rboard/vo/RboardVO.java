package com.brownpoodle.rboard.vo;

public class RboardVO {

	private String rb_num;
	private String b_num;
	private String rb_name;
	private String rb_content;
	private String rb_deleteyn;
	private String rb_insertdate;
	private String rb_updatedate;
	
	public RboardVO() {	}
	
	public RboardVO(String rb_num, String b_num, String rb_name,
					String rb_content, String rb_deleteyn,
					String rb_insertdate, String rb_updatedate) {
		this.rb_num = rb_num;
		this.b_num = b_num;
		this.rb_name = rb_name;
		this.rb_content = rb_content;
		this.rb_deleteyn = rb_deleteyn;
		this.rb_insertdate = rb_insertdate;
		this.rb_updatedate = rb_updatedate;
	}

	public String getRb_num() {
		return rb_num;
	}

	public String getB_num() {
		return b_num;
	}

	public String getRb_name() {
		return rb_name;
	}

	public String getRb_content() {
		return rb_content;
	}

	public String getRb_deleteyn() {
		return rb_deleteyn;
	}

	public String getRb_insertdate() {
		return rb_insertdate;
	}

	public String getRb_updatedate() {
		return rb_updatedate;
	}

	public void setRb_num(String rb_num) {
		this.rb_num = rb_num;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public void setRb_name(String rb_name) {
		this.rb_name = rb_name;
	}

	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}

	public void setRb_deleteyn(String rb_deleteyn) {
		this.rb_deleteyn = rb_deleteyn;
	}

	public void setRb_insertdate(String rb_insertdate) {
		this.rb_insertdate = rb_insertdate;
	}

	public void setRb_updatedate(String rb_updatedate) {
		this.rb_updatedate = rb_updatedate;
	}
	
	
}
