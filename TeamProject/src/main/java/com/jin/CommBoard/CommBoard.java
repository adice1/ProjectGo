package com.jin.CommBoard;

import java.sql.Date;

// 자유 게시판 
public class CommBoard {

	private Integer no;

    private String id;

    private String title;

    private String contents;

    private Date writedate;
  //클릭수
  	private int hit;
  	
  	public int getHit() {
  		return hit;
  	}

  	public void setHit(int hit) {
  		this.hit = hit;
  	}

    public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

}
	
