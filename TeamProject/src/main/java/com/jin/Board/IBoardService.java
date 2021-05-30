package com.jin.Board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface IBoardService {

	public void Write(Board question, HttpServletRequest request);

	public List<Board> SelectBoard();

	public Map<String, Object> DetailRead(String writeNo);

	public void Delete(String no);

	public void Deletes(String[] chkboxs);

}
