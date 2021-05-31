package com.jin.CommBoardComment;

import java.util.List;

public interface ICommentService {
	public void Insert(Comment comment);
	public List<Comment> SelectComment(String writeNo);
	public void ModifyComment(Comment comment);
	public void DeleteComment(Comment comment);
}
