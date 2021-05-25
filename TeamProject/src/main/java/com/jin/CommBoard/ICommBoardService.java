package com.jin.CommBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ICommBoardService {
	
	public List<CommBoard> select();
	public void Insert(CommBoard commboard);
	public int boardCount();
	public void boardPage();
}
