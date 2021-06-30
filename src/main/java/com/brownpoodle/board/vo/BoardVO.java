package com.brownpoodle.board.vo;

public class BoardVO {
	
	private String b_num;
	private String b_subject;
	private String b_name;
	private String b_content;
	private String b_file;
	private String b_hate;
	private String b_like;
	private String b_deleteyn;
	private String b_insertdate;
	private String b_updatedate;
	
	// 페이징 처리 변수
	private String pagesize;	// 한 페이지당 보여줄 게시글 수
	private String groupsize;	// 한 그룹당 표시할 페이지 수
	private String curpage;		// 현재 페이지
	private String totalcount;	// 전체 게시글 수
	
	// 검색 구분자 및 검색어
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;
	
	// 좋아요 관련 변수 추가 
	private String like_num;		// 좋아요 번호 : L0001
	private String m_num;			// 회원번호
	private String like_deleteyn;   // 좋아요 취소 여부
	private String like_img;
	
	// constructor 
	public BoardVO() {	}

	public BoardVO(String b_num, String b_subject, String b_name, String b_content,
					String b_file, String b_hate, String b_like, String b_deleteyn,
					String b_insertdate, String b_updatedate, String pagesize, String groupsize,
					String curpage, String totalcount, String keyfilter, String keyword,
					String startdate, String enddate, String like_num, String m_num,
					String like_deleteyn, String like_img) {
		this.b_num = b_num;
		this.b_subject = b_subject;
		this.b_name = b_name;
		this.b_content = b_content;
		this.b_file = b_file;
		this.b_hate = b_hate;
		this.b_like = b_like;
		this.b_deleteyn = b_deleteyn;
		this.b_insertdate = b_insertdate;
		this.b_updatedate = b_updatedate;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.like_num = like_num;
		this.m_num = m_num;
		this.like_deleteyn = like_deleteyn;
		this.like_img = like_img;
		
	}

	// getter and setter
	public String getB_num() {
		return b_num;
	}

	public String getB_subject() {
		return b_subject;
	}

	public String getB_name() {
		return b_name;
	}

	public String getB_content() {
		return b_content;
	}

	public String getB_file() {
		return b_file;
	}

	public String getB_hate() {
		return b_hate;
	}

	public String getB_like() {
		return b_like;
	}

	public String getB_deleteyn() {
		return b_deleteyn;
	}

	public String getB_insertdate() {
		return b_insertdate;
	}

	public String getB_updatedate() {
		return b_updatedate;
	}

	public String getPagesize() {
		return pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public void setB_hate(String b_hate) {
		this.b_hate = b_hate;
	}

	public void setB_like(String b_like) {
		this.b_like = b_like;
	}

	public void setB_deleteyn(String b_deleteyn) {
		this.b_deleteyn = b_deleteyn;
	}

	public void setB_insertdate(String b_insertdate) {
		this.b_insertdate = b_insertdate;
	}

	public void setB_updatedate(String b_updatedate) {
		this.b_updatedate = b_updatedate;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getLike_num() {
		return like_num;
	}

	public String getM_num() {
		return m_num;
	}

	public String getLike_deleteyn() {
		return like_deleteyn;
	}

	public void setLike_num(String like_num) {
		this.like_num = like_num;
	}

	public void setM_num(String m_num) {
		this.m_num = m_num;
	}

	public void setLike_deleteyn(String like_deleteyn) {
		this.like_deleteyn = like_deleteyn;
	}

	public String getLike_img() {
		return like_img;
	}

	public void setLike_img(String like_img) {
		this.like_img = like_img;
	}

}
