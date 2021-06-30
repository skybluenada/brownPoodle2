package com.brownpoodle.calendar.controller;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brownpoodle.calendar.service.CalendarService;
import com.brownpoodle.calendar.vo.CalendarVO;
import com.brownpoodle.walk.vo.WalkVO;


@Controller
public class CalendarController {

	Logger logger = Logger.getLogger(CalendarController.class);
	
	@Autowired(required=false)
	private CalendarService calendarService;

	
	
	@RequestMapping(value="calendar", method=RequestMethod.GET)
	public String calendar() {
		
		return "calendar/calendar";
	}
	
	// 캘린더 전체조회
	@RequestMapping(value="/calendarSelectAll.bp", method=RequestMethod.GET)
	public String calendarSelectAll(CalendarVO cvo, WalkVO wvo, 
									Model model, HttpSession session) {

		logger.info("CalendarController calendarSelectAll 진입 성공 >>> : ");
		
//		--------- 캘린더 정보조회 ---------
		
		// 세션 아이디값 
		String m_id = (String)session.getAttribute("m_id");
//		cvo.setM_id(m_id);
		logger.info("m_id >>> : " + m_id);
		
		cvo.setM_id(m_id);
		logger.info("cvo.getM_id() >>> : " + cvo.getM_id());
		
		List<CalendarVO> aList = calendarService.calendarSelectAll(cvo);
			
		
		JSONArray jsonCalendar = new JSONArray();
		
		for(int i = 0 ; i < aList.size();i++){
			CalendarVO cvo_1 = aList.get(i);
			JSONObject jobj = new JSONObject();
			jobj.put("_id", cvo_1.getCal_no());
			jobj.put("title", cvo_1.getCal_title());
			jobj.put("description", cvo_1.getCal_description());
			jobj.put("start", cvo_1.getCal_startdate());
			jobj.put("end", cvo_1.getCal_enddate());
			jobj.put("type", cvo_1.getCal_type());
			jobj.put("username", cvo_1.getM_id());
			jobj.put("backgroundColor", cvo_1.getCal_backgroundColor());
			jobj.put("textColor", cvo_1.getCal_textColor());
			boolean bool = false;
			if("true".equals(cvo_1.getCal_allDay())){
				bool = true;
			}
			jobj.put("allDay", bool);
			
			jsonCalendar.add(jobj);
		}
//		--------- 산책정보 ---------------------------
		
		//wvo.setM_id(m_id);
		wvo.setM_id(m_id);
		
		String m_nick = (String)session.getAttribute("m_nick");
		
		// 산책 정보 받아왔습니다.
		List<WalkVO> asList = calendarService.walkSelectAll(wvo);
		logger.info("asList >>> : " + asList);
		
		for(int i = 0; i< asList.size(); i++) {
			WalkVO wvo_1 = asList.get(i);
			JSONObject jobj = new JSONObject();
			jobj.put("_id", wvo_1.getWalk_seq());
			jobj.put("title", m_nick + "님이 산책한 날");
			//jobj.put("title", "산책");
			jobj.put("description", "금일은 " + wvo_1.getWalk_time() +"이나 산책하셨습니다");
			jobj.put("start", wvo_1.getWalk_date());
			jobj.put("end", wvo_1.getWalk_date());
			jobj.put("type", "카테고리1");
			jobj.put("username", wvo_1.getM_id());
			jobj.put("backgroundColor", "#DCFFE4");
			jobj.put("textColor", "#4A00FF");
			jobj.put("allDay", true);
			
			jsonCalendar.add(jobj);
		}
		
		model.addAttribute("jsonCalendar", jsonCalendar);
		
		return "calendar/calendarData";
	}
	
	// 캘린더 수정
	@RequestMapping(value="/calendarUpdate.bp", method=RequestMethod.GET)
	public String calendarUpdate(CalendarVO cvo, Model model, HttpSession session) {
		logger.info("CalendarController calendarUpdate 진입 성공 >>> : ");
		logger.info("cvo >>> : " + cvo);
		
		// 세션 아이디값 
		String m_id = (String)session.getAttribute("m_id");
		cvo.setM_id(m_id);

		
		int nCnt = calendarService.calendarUpdate(cvo);
		logger.info("nCnt >>> : " + nCnt);
		
		return "calendar/calendarData";
	}
	
	// 캘린더 입력
	@RequestMapping(value="/calendarInsert.bp", method=RequestMethod.GET)
	public String calendarInsert(CalendarVO cvo, Model model, HttpSession session) {
		logger.info("CalendarController calendarInsert 진입 성공 >>> : ");
		
		// 세션 아이디값 
		String m_id = (String)session.getAttribute("m_id");
		cvo.setM_id(m_id);
		
		logger.info("cvo.getM_id >>> : " + cvo.getM_id());
		
		int nCnt = calendarService.calendarInsert(cvo);
		
		return "calendar/calendarData";
	}
	
	// 캘린더 삭제
	@RequestMapping(value="/calendarDelete.bp", method=RequestMethod.GET)
	public String calendarDelete(CalendarVO cvo, Model model, HttpSession session) {
		logger.info("CalendarController calendarDelete 진입 성공 >>> : ");
		
		// 세션 아이디값 
		String m_id = (String)session.getAttribute("m_id");
		cvo.setM_id(m_id);
		
		int nCnt = calendarService.calendarDelete(cvo);
		
		return "calendar/calendarData";
	}
	
	// 캘린더 드래그 앤 드롭 이벤트 발생시
	@RequestMapping(value="/calendarDragAndDrop.bp", method=RequestMethod.GET)
	public String calendarDragAndDrop(CalendarVO cvo, Model model, HttpSession session) {
		logger.info("CalendarController calendarDragAndDrop 진입 성공 >>> : ");
		
		logger.info("cvo.getCal_no() >>> : " + cvo.getCal_no());
		logger.info("cvo.getM_id() >>> : " + cvo.getM_id());
		logger.info("cvo.getCal_startdate() >>> : " + cvo.getCal_startdate());
		logger.info("cvo.getCal_enddate() >>> : " + cvo.getCal_enddate());
		
		// 세션 아이디값 
		String m_id = (String)session.getAttribute("m_id");
		cvo.setM_id(m_id);
		
		int nCnt = calendarService.calendarDragAndDrop(cvo);
		logger.info("드로그앤드롭 성공여부 nCnt >>> : " + nCnt);
		
		return "calendar/calendarData";
	}
}
