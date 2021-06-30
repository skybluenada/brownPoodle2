package com.brownpoodle.walk.vo;

import java.util.List;

import org.json.simple.JSONArray;

public class WalkVO {
	
	String walk_seq;
	String m_id;
	String walk_date;
	String walk_time;
	String longitude_str;
	String latitude_str;
	
	public WalkVO() {}

	public String getWalk_seq() {
		return walk_seq;
	}


	public String getM_id() {
		return m_id;
	}


	public String getWalk_date() {
		return walk_date;
	}


	public String getWalk_time() {
		return walk_time;
	}


	public String getLongitude_str() {
		return longitude_str;
	}


	public String getLatitude_str() {
		return latitude_str;
	}


	public void setWalk_seq(String walk_seq) {
		this.walk_seq = walk_seq;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public void setWalk_date(String walk_date) {
		this.walk_date = walk_date;
	}


	public void setWalk_time(String walk_time) {
		this.walk_time = walk_time;
	}


	public void setLongitude_str(String longitude_str) {
		this.longitude_str = longitude_str;
	}


	public void setLatitude_str(String latitude_str) {
		this.latitude_str = latitude_str;
	}
}
