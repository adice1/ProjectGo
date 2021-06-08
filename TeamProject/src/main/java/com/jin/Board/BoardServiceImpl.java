package com.jin.Board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jin.TeamProject.BoardTools;

@Service
public class BoardServiceImpl implements IBoardService{
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired private IBoardDao iBoardDao;
	
	private final int PAGEBLOCK = 10;

	@Override
	public void Write(Board board, HttpServletRequest request) {
		Date writedate = new Date(System.currentTimeMillis());
		board.setWritedate(writedate);
		iBoardDao.Write(board);
		
		
		if(!"".contentEquals(request.getParameter("pno"))) {
			Map<String, Integer> replyMap = new HashMap<String, Integer>();
			replyMap.put("no", board.getNo());
			replyMap.put("pno", Integer.parseInt(request.getParameter("pno")));
			iBoardDao.InsertReply(replyMap);
			
			
		}
	}

	@Override
	public Map<String, Object> DetailRead(String writeNo) {
		Map<String, Object>boardMap = new HashMap<String, Object>();
		boardMap.put("board", iBoardDao.DetailRead(writeNo));
		boardMap.put("attachLst", iBoardDao.DetailreadAttach(writeNo));
		
		Map<String, Integer> hitsMap = new HashMap<String, Integer>();
		hitsMap.put("no", Integer.parseInt(writeNo));
		iBoardDao.Hits(hitsMap);
	
		return boardMap;
	}
	@Override
	public void Delete(String no) {
		iBoardDao.Delete(no);
		
	}
	@Override
	public void Deletes(String[] chkboxs) {
		for(String no : chkboxs)
			iBoardDao.Delete(no);
		
	}
	@Override
	public List<Board> SelectBoard(HttpServletRequest request) {
		Map<String, Object> boardMap = getSearchMap(request);	
		int currentPage = getCurrentPage(request);
		
		boardMap.put("start", 1+PAGEBLOCK*(currentPage-1));
		boardMap.put("end", PAGEBLOCK*currentPage);

		return iBoardDao.SelectBoard(boardMap);
	}
	private int getCurrentPage(HttpServletRequest request) {
		int currentPage = 1;
		String param = request.getParameter("currentPage");
		if(param!=null)	
			currentPage = Integer.parseInt(param);
		
		return currentPage;
	}
	private Map<String, Object> getSearchMap(HttpServletRequest request) {
        Map<String, Object> boardMap = new HashMap<String, Object>();
		
		String searchName = request.getParameter("searchName");
		if(searchName != null) {
			boardMap.put("searchName", searchName);
			String searchWord = request.getParameter("searchWord");
			boardMap.put("searchWord", searchWord);
		}
		return boardMap;
	}
	@Override
	public String getNavi(HttpServletRequest request) {
		Map<String, Object> boardMap = getSearchMap(request);
		int currentPage = getCurrentPage(request);
		
		int totalPage=iBoardDao.BoardCount(boardMap);
		String url=request.getContextPath()+"/QuestionBoard/boardProc?";
		if(boardMap.get("searchName")!=null) {
			url+="searchName="+boardMap.get("searchName")+"&";
			url+="searchWord="+boardMap.get("searchWord")+"&";	
		}
		url+="currentPage=";
		
		String tag = BoardTools.getNavi(currentPage, PAGEBLOCK, totalPage, url);
		return tag;
	}

	@Override
	public List<Board> DetailReply(String writeNo) {
		// TODO Auto-generated method stub
		return iBoardDao.DetailReply(writeNo);
	}

}

