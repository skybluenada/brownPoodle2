package com.brownpoodle.walk.service;

import java.util.List;

import com.brownpoodle.walk.vo.WalkVO;

public interface WalkService {

	// walkData ์๋ ฅ
	public int walkDataInsert(WalkVO wvo);
	
	// walkData ์กฐํ
	public List<String> walkSelectAll(WalkVO wvo);
	public List<WalkVO> walkSelect(WalkVO wvo);
	
	
	
}
