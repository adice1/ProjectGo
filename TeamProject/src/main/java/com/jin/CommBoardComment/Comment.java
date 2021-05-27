package com.jin.CommBoardComment;

import java.sql.Date;

public class Comment {

    private Integer Comment_bno;

    private Integer comment_no;

    private String comment_contents;

    private String comment_id;

    private Date comment_writedate;

	public Integer getComment_bno() {
		return Comment_bno;
	}

	public void setComment_bno(Integer comment_bno) {
		Comment_bno = comment_bno;
	}

	public Integer getComment_no() {
		return comment_no;
	}

	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_contents() {
		return comment_contents;
	}

	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public Date getComment_writedate() {
		return comment_writedate;
	}

	public void setComment_writedate(Date comment_writedate) {
		this.comment_writedate = comment_writedate;
	}

   
 
}
