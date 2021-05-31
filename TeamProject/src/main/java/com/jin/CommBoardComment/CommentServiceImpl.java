package com.jin.CommBoardComment;

import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements ICommentService{
	
	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Autowired private ICommentDao icommentDao;
	
	@SuppressWarnings("deprecation")
	@Override
	public void Insert(Comment comment) {
		Date writedate = new Date(System.currentTimeMillis());
		comment.setComment_writedate(writedate);
		
		icommentDao.Insert(comment);
	}

	@Override
	public List<Comment> SelectComment(String writeNo) {
		return icommentDao.SelectComment(writeNo);
	}

	@Override
	public void ModifyComment(Comment comment) {
		Date writedate = new Date(System.currentTimeMillis());
		comment.setComment_writedate(writedate);
		icommentDao.ModifyComment(comment);
		
	}

	@Override
	public void DeleteComment(Comment comment) {
		icommentDao.DeleteComment(comment);
	}
	
}
