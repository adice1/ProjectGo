package com.jin.Board;

import java.util.List;
import java.util.Map;

public interface IBoardDao {

	

	public int Write(Board board);

	public void AttachFile(Map<String, String> fileMap);

	public void InsertReply(Map<String, Integer> replyMap);

	public List<Board> SelectBoard();

	public Board DetailRead(String writeNo);

	public List<Map<String, Object>> DetailreadAttach(String writeNo);

}
