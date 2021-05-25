package com.jin.CommBoard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ICommBoardDao {
	public List<CommBoard> SelectBoard(Map<String, Object> boardMap);
	public void Insert(CommBoard commboard);
	public int boardCount();
	public CommBoard detailRead(int writeNo);
	public int BoardCount(Map<String, Object> boardMap);
}
