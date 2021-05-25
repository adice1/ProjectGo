package com.jin.CommBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ICommBoardService {
	
	public List<CommBoard> SelectBoard(HttpServletRequest request);
	public void Insert(CommBoard commboard);
	public int boardCount();
	public CommBoard detailRead(int writeNo);
	public String getNavi(HttpServletRequest request);
}
