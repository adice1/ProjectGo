package com.jin.CommBoard;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommBoardServiceImpl implements ICommBoardService{
	@Autowired private ICommBoardDao iCommBoardDao; 
	
	@Override
	public List<CommBoard> select() {
		return iCommBoardDao.select();
	}

	@Override
	public void Insert(CommBoard commboard) {
		Date writedate = new Date(System.currentTimeMillis());
		commboard.setWritedate(writedate);
		iCommBoardDao.Insert(commboard);
		
	}

	@Override
	public int boardCount() {
		
		return iCommBoardDao.boardCount();
	}

	@Override
	public void boardPage() {
		// TODO Auto-generated method stub
		
	}


	




}
