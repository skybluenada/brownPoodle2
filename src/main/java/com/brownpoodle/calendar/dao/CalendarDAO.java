package com.brownpoodle.calendar.dao;

import java.util.List;

import com.brownpoodle.calendar.vo.CalendarVO;
import com.brownpoodle.walk.vo.WalkVO;


public interface CalendarDAO {
	
	// 캘린더 전체조회
	public List<CalendarVO> calendarSelectAll(CalendarVO cvo);
	
	// 캘린더 입력
	public int calendarInsert(CalendarVO cvo);
	
	// 캘린더 수정
	public int calendarUpdate(CalendarVO cvo);
	
	// 캘린더 삭제
	public int calendarDelete(CalendarVO cvo);
	
	// 산책정보 전체조회
	public List<WalkVO> walkSelectAll(WalkVO wvo);
	
	// 캘린더 드래그앤드롭으로 수정
	public int calendarDragAndDrop(CalendarVO cvo);
	
}
