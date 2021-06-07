package com.jin.Board;

import java.util.List;
import java.util.Map;

public interface IBoardDao {

	

	public int Write(Board board);
	public void InsertReply(Map<String, Integer> replyMap);
	public List<Map<String, Object>> DetailreadAttach(String writeNo);
	public void Delete(String no);
	public List<Board> SelectBoard(Map<String, Object> boardMap);
	public int BoardCount(Map<String, Object> boardMap);
	public Board DetailRead(String writeNo);
	public void Hits(Map<String, Integer> hitsMap);
	public List<Board> DetailReply(String writeNo);
	
}
