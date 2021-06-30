package com.brownpoodle.calendar.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brownpoodle.calendar.dao.CalendarDAO;
import com.brownpoodle.calendar.dao.CalendarDAOImpl;
import com.brownpoodle.calendar.vo.CalendarVO;
import com.brownpoodle.walk.vo.WalkVO;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService{

	Logger logger = Logger.getLogger(CalendarServiceImpl.class);
	
	@Autowired(required = false)
	private CalendarDAO calendarDAO;
	
	
	// 캘린더 전체조회
	@Override
	public List<CalendarVO> calendarSelectAll(CalendarVO cvo) {
		logger.info("CalendarServiceImpl calendarSelectAll 진입 성공 >>> : ");
		
		return calendarDAO.calendarSelectAll(cvo);
	}

	// 캘린더 입력
	@Override
	public int calendarInsert(CalendarVO cvo) {
		logger.info("CalendarServiceImpl calendarInsert 진입 성공 >>> : ");
		
		return calendarDAO.calendarInsert(cvo);
	}

	// 캘린더 수정
	@Override
	public int calendarUpdate(CalendarVO cvo) {
		logger.info("CalendarServiceImpl calendarUpdate 진입 성공 >>> : ");

		return calendarDAO.calendarUpdate(cvo);
	}

	// 캘린더 삭제
	@Override
	public int calendarDelete(CalendarVO cvo) {
		logger.info("CalendarServiceImpl calendarDelete 진입 성공 >>> : ");
		
		return calendarDAO.calendarDelete(cvo);
	}

	// 산책정보 전체 조회
	@Override
	public List<WalkVO> walkSelectAll(WalkVO wvo) {
		logger.info("CalendarServiceImpl walkSelectAll 진입 성공 >>> : ");
		
		return calendarDAO.walkSelectAll(wvo);
	}

	// 캘린더 드래그앤드롭으로 수정
	@Override
	public int calendarDragAndDrop(CalendarVO cvo) {
		logger.info("CalendarServiceImpl calendarDragAndDrop 진입 성공 >>> : ");
		
		return calendarDAO.calendarDragAndDrop(cvo);
	}

}
