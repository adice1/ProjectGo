package com.jin.Board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
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
	private final String UPLOADPATH = "/resources/upload/";
	
	private final int PAGEBLOCK = 10;

	@Override
	public void Write(Board board, HttpServletRequest request) {
		Date writedate = new Date(System.currentTimeMillis());
		board.setWritedate(writedate);
		iBoardDao.Write(board);
		
		List<Map<String, String>> fileLst = Upload(request);
		
		for(Map<String, String> fileMap : fileLst) {
			fileMap.put("fno", board.getNo().toString());
			iBoardDao.AttachFile(fileMap);	
		}
		
		if(!"".contentEquals(request.getParameter("pno"))) {
			Map<String, Integer> replyMap = new HashMap<String, Integer>();
			replyMap.put("no", board.getNo());
			replyMap.put("pno", Integer.parseInt(request.getParameter("pno")));
			iBoardDao.InsertReply(replyMap);
		}
	}
	private List<Map<String, String>> Upload(HttpServletRequest request) {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multiRequest.getFileNames();
		MultipartFile multipartFile = null;
		List<Map<String, String>>fileLst = new ArrayList<Map<String,String>>();
//		logger.warn("Upload");
		while(iterator.hasNext()){
			String fieldName = iterator.next();
			logger.warn("fieldName : "+fieldName);
			multipartFile = multiRequest.getFile(fieldName);
	        
			if(multipartFile.isEmpty() == false){
				Map<String, String>fileMap = new HashMap<String, String>();
				
				String originFile = multipartFile.getOriginalFilename();
				String systemFile = originFile+System.currentTimeMillis();
				fileMap.put("attacheFile", originFile);
				fileMap.put("filepath", systemFile);
				fileLst.add(fileMap);
				String filePath = multiRequest.getSession().getServletContext().getRealPath("/");
				
				try {
					
					DownloadFile(multipartFile.getInputStream(),filePath, multipartFile.getOriginalFilename());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return fileLst;
	}
	private void DownloadFile(InputStream inputStream, String filePath, String fileName) {
		File file = new File(filePath + UPLOADPATH + fileName);	
		try {
			Files.copy(inputStream, file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		

	

	@Override
	public Map<String, Object> DetailRead(String writeNo) {
		Map<String, Object>boardMap = new HashMap<String, Object>();
		boardMap.put("board", iBoardDao.DetailRead(writeNo));
		boardMap.put("attachLst", iBoardDao.DetailreadAttach(writeNo));
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
		if(param!=null)	currentPage = Integer.parseInt(param);
		
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
		
		int totalPage = iBoardDao.BoardCount(boardMap);
		String url = request.getContextPath()+"QuestionBoard/boardProc?";
		if(boardMap.get("searchName")!=null){
			url+="searchName="+boardMap.get("searchName");
			url+="searchWord="+boardMap.get("searchWord");
		}
		url+="currentPage=";
		String tag = BoardTools.getNavi(currentPage, PAGEBLOCK, totalPage, url);
		return tag;
	}
}

