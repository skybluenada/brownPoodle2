package com.brownpoodle.calendar.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brownpoodle.calendar.vo.CalendarVO;
import com.brownpoodle.walk.vo.WalkVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {

	Logger logger = Logger.getLogger(CalendarDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	// 캘린더 전체조회
	@Override
	public List<CalendarVO> calendarSelectAll(CalendarVO cvo) {
		logger.info("CalendarDAOImpl calendarSelectAll 진입 성공 >>> :");
		logger.debug("selectList(calendarSelectAll);"+ sqlSession.selectList("calendarSelectAll"));
		//logger.info("");
		
		return sqlSession.selectList("calendarSelectAll");
	}

	// 캘린더 입력
	@Override
	public int calendarInsert(CalendarVO cvo) {
		logger.info("CalendarDAOImpl calendarInsert 진입 성공 >>> :");
		
		return sqlSession.insert("calendarInsert");
	}

	// 캘린더 수정
	@Override
	public int calendarUpdate(CalendarVO cvo) {
		logger.info("CalendarDAOImpl calendarUpdate 진입 성공 >>> :");
		
		return sqlSession.update("calendarUpdate");
	}

	// 캘린더 삭제
	@Override
	public int calendarDelete(CalendarVO cvo) {
		logger.info("CalendarDAOImpl calendarDelete 진입 성공 >>> :");
		
		return sqlSession.delete("calendarDelete");
	}

	// 산책정보 전체 조회
	@Override
	public List<WalkVO> walkSelectAll(WalkVO wvo) {
		logger.info("CalendarDAOImpl walkSelectAll 진입 성공 >>> :");
		
		return sqlSession.selectList("walkSelectAll");
	}

	// 캘린더 드래그앤드롭으로 수정
	@Override
	public int calendarDragAndDrop(CalendarVO cvo) {
		logger.info("CalendarDAOImpl calendarDragAndDrop 진입 성공 >>> : ");
		
		
		return sqlSession.update("calendarDragAndDrop");
	}

}
