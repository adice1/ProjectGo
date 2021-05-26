package com.jin.CommBoard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ICommBoardService {
	
	public List<CommBoard> SelectBoard(HttpServletRequest request);
	public int boardCount();
	public Map<String, Object> detailRead(String writeNo);
	public String getNavi(HttpServletRequest request);
	public void Write(CommBoard board, HttpServletRequest request);
	public void Modify(CommBoard board);
	public void Delete(String no);
	public void Deletes(String[] chkboxs);
}
