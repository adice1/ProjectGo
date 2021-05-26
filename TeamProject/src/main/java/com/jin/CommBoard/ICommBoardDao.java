package com.jin.CommBoard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ICommBoardDao {
	public List<CommBoard> SelectBoard(Map<String, Object> boardMap);
	public int boardCount();
	public CommBoard detailRead(String writeNo);
	public int BoardCount(Map<String, Object> boardMap);
	public int Write(CommBoard board);
	public void InsertReply(Map<String, Integer> replyMap);
	public void Modify(CommBoard board);
	public void Hits(Map<String, Integer> hitsMap);
	public void Delete(String no);
}
