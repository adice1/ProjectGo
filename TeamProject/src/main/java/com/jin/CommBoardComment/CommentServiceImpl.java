package com.jin.CommBoardComment;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements ICommentService{
	
	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Autowired private ICommentDao iBoardDao;
	
	@Override
	public void Insert(Comment comment) {
		iBoardDao.Insert(comment);
	}
	
}
