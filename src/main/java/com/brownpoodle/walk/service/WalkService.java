package com.brownpoodle.walk.service;

import java.util.List;

import com.brownpoodle.walk.vo.WalkVO;

public interface WalkService {

	// walkData 입력
	public int walkDataInsert(WalkVO wvo);
	
	// walkData 조회
	public List<String> walkSelectAll(WalkVO wvo);
	public List<WalkVO> walkSelect(WalkVO wvo);
	
	
	
}
