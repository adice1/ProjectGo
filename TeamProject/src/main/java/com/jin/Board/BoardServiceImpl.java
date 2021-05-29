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

@Service
public class BoardServiceImpl implements IBoardService{
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired private IBoardDao iBoardDao;
	private final String UPLOADPATH = "/resources/upload/";

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
//			logger.warn("fieldName : "+fieldName);
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
	public List<Board> SelectBoard() {
		
		return iBoardDao.SelectBoard();
	}

	@Override
	public Map<String, Object> DetailRead(String writeNo) {
		Map<String, Object>boardMap = new HashMap<String, Object>();
		boardMap.put("board", iBoardDao.DetailRead(writeNo));
		boardMap.put("attachLst", iBoardDao.DetailreadAttach(writeNo));
		return boardMap;
	}

}
