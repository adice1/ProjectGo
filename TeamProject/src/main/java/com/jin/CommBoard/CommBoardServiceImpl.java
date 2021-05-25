package com.jin.CommBoard;
import com.jin.TeamProject.BoardTools;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommBoardServiceImpl implements ICommBoardService{
	@Autowired private ICommBoardDao iCommBoardDao; 
	
	private final int PAGEBLOCK = 5;
	
	@Override
	public List<CommBoard> SelectBoard(HttpServletRequest request) {
		Map<String, Object> boardMap = getSearchMap(request);	
		int currentPage = getCurrentPage(request);
		
		boardMap.put("start", 1+PAGEBLOCK*(currentPage-1));
		boardMap.put("end", PAGEBLOCK*currentPage);
		
		return iCommBoardDao.SelectBoard(boardMap);
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
	
	private int getCurrentPage(HttpServletRequest request) {
		int currentPage = 1;
		String param = request.getParameter("currentPage");
		if(param!=null)	currentPage = Integer.parseInt(param);
		
		return currentPage;
	}
	
	@Override
	public String getNavi(HttpServletRequest request) {
		Map<String, Object> boardMap = getSearchMap(request);
		int currentPage = getCurrentPage(request);
		
		int totalPage = iCommBoardDao.BoardCount(boardMap);
		String url=request.getContextPath()+"/commboard/commboardProc?";
		if(boardMap.get("searchName")!=null) {
			url+="searchName="+boardMap.get("searchName")+"&";
			url+="searchWord="+boardMap.get("searchWord")+"&";	
		}
		url+="currentPage=";
		
		String tag = BoardTools.getNavi(currentPage, PAGEBLOCK, totalPage, url);
		return tag;
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
	public CommBoard detailRead(int writeNo) {
		return iCommBoardDao.detailRead(writeNo);
	}
	
}
