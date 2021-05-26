package com.jin.CommBoardComment;

import java.sql.Date;

public class CommBoardComment {

    private Double boardno;

    private Double commentno;

    private String commentcontents;

    private String commentid;

    private Date commentdate;

    public Double getBoardno() {
        return boardno;
    }

    public void setBoardno(Double boardno) {
        this.boardno = boardno;
    }

    public Double getCommentno() {
        return commentno;
    }

    public void setCommentno(Double commentno) {
        this.commentno = commentno;
    }

    public String getCommentcontents() {
        return commentcontents;
    }

    public void setCommentcontents(String commentcontents) {
        this.commentcontents = commentcontents;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public Date getCommentdate() {
        return commentdate;
    }

    public void setCommentdate(Date commentdate) {
        this.commentdate = commentdate;
    }

}
