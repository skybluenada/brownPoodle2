package com.brownpoodle.rboard.service;

import java.util.List;

import com.brownpoodle.board.vo.BoardVO;
import com.brownpoodle.rboard.vo.RboardVO;

public interface RboardService {

	public List<RboardVO> rboardSelectAll(RboardVO rbvo);
	public List<RboardVO> rboardSelect(RboardVO rbvo);
	public int rboardInsert(RboardVO rbvo);
	public int rboardUpdate(RboardVO rbvo);
	public int rboardDelete(RboardVO rbvo);
}
