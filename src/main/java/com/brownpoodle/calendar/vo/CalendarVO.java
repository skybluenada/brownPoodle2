package com.brownpoodle.calendar.vo;

public class CalendarVO {

	private String cal_no;				// 1
	private String cal_title;			// 2
	private String cal_startdate;		// 3
	private String cal_enddate;			// 4
	private String cal_description;		// 5
	private String cal_type;			// 6
	private String cal_backgroundColor;	// 7
	private String cal_textColor;		// 8
	private String cal_allDay;			// 9
	private String cal_insertdate;		// 10
	private String cal_updatedate;		// 11
	private String cal_deleteyn;		// 12
	private String m_id;				// 13
	
	// 생성자 1
	public CalendarVO(){}
	
	// 생성자 2
	public CalendarVO(String cal_no, String cal_title, String cal_startdate, 
					  String cal_enddate, String cal_description, String cal_type, 
					  String cal_backgroundColor, String cal_textColor, String cal_allDay, 
					  String cal_insertdate, String cal_updatedate, String cal_deleteyn, 
					  String m_id) {
		this.cal_no = cal_no;
		this.cal_title = cal_title;
		this.cal_startdate = cal_startdate;
		this.cal_enddate = cal_enddate;
		this.cal_description = cal_description;
		this.cal_type = cal_type;
		this.cal_backgroundColor = cal_backgroundColor;
		this.cal_textColor = cal_textColor;
		this.cal_allDay = cal_allDay;
		this.cal_insertdate = cal_insertdate;
		this.cal_updatedate = cal_updatedate;
		this.cal_deleteyn = cal_deleteyn;
		this.m_id = m_id;
	}
	
	public static void printCalendarVO(CalendarVO cvo){
		System.out.println("cvo.getCal_no() >>> : " + cvo.getCal_no());								// 1
		System.out.println("cvo.getCal_title()) >>> : " + cvo.getCal_title());						// 2
		System.out.println("cvo.getCal_startdate() >>> : " + cvo.getCal_startdate());				// 3
		System.out.println("cvo.getCal_enddate() >>> : " + cvo.getCal_enddate());					// 4
		System.out.println("cvo.getCal_description() >>> : " + cvo.getCal_description());			// 5
		System.out.println("cvo.getCal_type() >>> : " + cvo.getCal_type());							// 6
		System.out.println("cvo.getCal_backgroundColor() >>> : " + cvo.getCal_backgroundColor());	// 7
		System.out.println("cvo.getcal_textColor() >>> : " + cvo.getCal_textColor());				// 8
		System.out.println("cvo.getCal_allDay() >>> : " + cvo.getCal_allDay());						// 9
		System.out.println("cvo.getCal_insertdate() >>> : " + cvo.getCal_insertdate());				// 10
		System.out.println("cvo.getCal_updatedate() >>> : " + cvo.getCal_updatedate());				// 11
		System.out.println("cvo.getCal_deleteyn() >>> : " + cvo.getCal_deleteyn());					// 12
		System.out.println("cvo.getM_id() >>> : " + cvo.getM_id());									// 13
	}

	
	public String getCal_no() {
		return cal_no;
	}

	public String getCal_title() {
		return cal_title;
	}

	public String getCal_startdate() {
		return cal_startdate;
	}

	public String getCal_enddate() {
		return cal_enddate;
	}

	public String getCal_description() {
		return cal_description;
	}

	public String getCal_type() {
		return cal_type;
	}

	public String getCal_backgroundColor() {
		return cal_backgroundColor;
	}

	public String getCal_textColor() {
		return cal_textColor;
	}

	public String getCal_allDay() {
		return cal_allDay;
	}

	public String getCal_insertdate() {
		return cal_insertdate;
	}

	public String getCal_updatedate() {
		return cal_updatedate;
	}

	public String getCal_deleteyn() {
		return cal_deleteyn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setCal_no(String cal_no) {
		this.cal_no = cal_no;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public void setCal_startdate(String cal_startdate) {
		this.cal_startdate = cal_startdate;
	}

	public void setCal_enddate(String cal_enddate) {
		this.cal_enddate = cal_enddate;
	}

	public void setCal_description(String cal_description) {
		this.cal_description = cal_description;
	}

	public void setCal_type(String cal_type) {
		this.cal_type = cal_type;
	}

	public void setCal_backgroundColor(String cal_backgroundColor) {
		this.cal_backgroundColor = cal_backgroundColor;
	}

	public void setCal_textColor(String cal_textColor) {
		this.cal_textColor = cal_textColor;
	}

	public void setCal_allDay(String cal_allDay) {
		this.cal_allDay = cal_allDay;
	}

	public void setCal_insertdate(String cal_insertdate) {
		this.cal_insertdate = cal_insertdate;
	}

	public void setCal_updatedate(String cal_updatedate) {
		this.cal_updatedate = cal_updatedate;
	}

	public void setCal_deleteyn(String cal_deleteyn) {
		this.cal_deleteyn = cal_deleteyn;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
}
