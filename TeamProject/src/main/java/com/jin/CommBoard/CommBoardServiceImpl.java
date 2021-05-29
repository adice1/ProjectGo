package com.jin.CommBoard;
import com.jin.CommBoardComment.Comment;
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
			System.out.println(boardMap.get("searchName"));
			String searchWord = request.getParameter("searchWord");
			boardMap.put("searchWord", searchWord);
			System.out.println(boardMap.get("searchWord"));
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
	public int boardCount() {
		return iCommBoardDao.boardCount();
	}

	@Override
	public Map<String, Object> detailRead(String writeNo) {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("board", iCommBoardDao.detailRead(writeNo));
		
		Map<String, Integer> hitsMap = new HashMap<String, Integer>();
		hitsMap.put("no", Integer.parseInt(writeNo));
		iCommBoardDao.Hits(hitsMap);
		
		return boardMap;
	}

	@Override
	public void Write(CommBoard board, HttpServletRequest request) {
		Date writedate = new Date(System.currentTimeMillis());
		
		board.setWritedate(writedate);
		iCommBoardDao.Write(board);
		
		if(!"".contentEquals(request.getParameter("pno"))){
			/*현재 글번호 - baord.getNo(), 부모 글번호 - pno*/
			Map<String, Integer> replyMap = new HashMap<String, Integer>();
			replyMap.put("no", board.getNo());
			replyMap.put("pno", Integer.parseInt(request.getParameter("pno")) );
			iCommBoardDao.InsertReply(replyMap);
		}
		
	}

	@Override
	public void Modify(CommBoard board) {
//		System.out.println("보드 넘버 : " + board.getNo());
		iCommBoardDao.Modify(board);
	}

	@Override
	public void Delete(String no) {
		iCommBoardDao.Delete(no);
	}
	@Override
	public void Deletes(String[] chkboxs) {

		for(String no : chkboxs)
			iCommBoardDao.Delete(no);
	}


}
