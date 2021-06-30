package com.brownpoodle.walk.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brownpoodle.login.service.LoginService;
import com.brownpoodle.walk.service.WalkService;
import com.brownpoodle.walk.vo.WalkVO;

@Controller
public class WalkController {
	Logger logger = Logger.getLogger(WalkController.class);
	
	private WalkService walkService;

	@Autowired(required = false)
	public WalkController(WalkService walkService) {
		this.walkService = walkService;
	}
	
	// 산책메인
	@RequestMapping(value = "walkMain", method = RequestMethod.GET)
	public String walkMain() {
		logger.info("WalkController.walkMain() >>> : ");
		return "walk/walk_main";
	}
	
	// 산책기록 목록조회
	@RequestMapping(value = "walkBoard", method = RequestMethod.GET)
	public String walkBoard(WalkVO wvo, Model model, HttpSession session) {
		logger.info("WalkController walkBoard() >>> : ");
		String m_id = (String)session.getAttribute("m_id");
		wvo.setM_id(m_id);
		
		
		List<String> wList = walkService.walkSelectAll(wvo);
		logger.info("wList  >>> : " + wList);
		
		model.addAttribute("wList", wList);
		
		return "walk/walkBoard";
	}

	
	// 안드로이드에서 데이터 받아서 DB에 저장
	@RequestMapping(value= "walkDataSave", method = RequestMethod.POST)
	public String walkDataSave(WalkVO wvo, Model model) {
		logger.info("WalkController.walkData() >>> : ");
		
		String m_id = wvo.getM_id();
		String longitude_str = wvo.getLongitude_str();
		String latitude_str = wvo.getLatitude_str();
		String walk_time = wvo.getWalk_time();
		
		logger.info("m_id >>> : " + m_id);
		logger.info("longitude_str >>> : " + longitude_str);
		logger.info("latitude_str >>> : " + latitude_str);
		logger.info("walk_time >>> : " + walk_time);
		
		// DB에 입력
		int result = walkService.walkDataInsert(wvo);
		logger.info("walkDataInsert.result >>> : " + result);
		logger.info("DB 입력 건 수 >>> : " + result);
		
		model.addAttribute("result", result);
		 
        return "walk/walkDataSaveResult";         
    }
	
	// 산책기록
	// 산책기록 목록에서 지도보기 클릭시
	@RequestMapping(value= "walkDataRead", method = RequestMethod.POST)
	public String walkDataRead(Model model, WalkVO wvo, HttpSession session) {
		logger.info("WalkController walkDataRead() >>> : ");
		String m_id = (String)session.getAttribute("m_id");
		
		logger.info("m_id  >>> : " + m_id );
		logger.info("wvo.getWalk_seq()  >>> : " + wvo.getWalk_seq());
		wvo.setM_id(m_id);
		
		
		List<WalkVO> list = walkService.walkSelect(wvo);
		logger.info("list  >>> : " + list);
		
		WalkVO _wvo = list.get(0);
		
		String[] lat = _wvo.getLatitude_str().split(",");
		String[] lon = _wvo.getLongitude_str().split(",");
		
		double[] latList = new double[lat.length]; 
		double[] lonList = new double[lon.length]; 
		
		for(int i = 0; i < lat.length; i++) {
			latList[i] = (Double.parseDouble(lat[i]));
			lonList[i] = (Double.parseDouble(lon[i]));
		}
		
		model.addAttribute("latitude", latList);
		model.addAttribute("longitude", lonList);
		
        return "walk/walkDataRead";         
    }

}
