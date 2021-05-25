package com.jin.CommBoard;

import java.util.List;

public interface ICommBoardDao {
	public List<CommBoard> select();
	public void Insert(CommBoard commboard);
	public int boardCount();
}
