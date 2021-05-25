package com.jin.CommBoard;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.Login.ILoginService;
import com.jin.Login.Login;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "commboard")
public class CommBoardController {
	private static final Logger logger = LoggerFactory.getLogger(CommBoardController.class);
	
	@Autowired
	private ICommBoardService iServ;
	
	
	@RequestMapping(value = "commboardProc")
	public String commboardProc(Model model, HttpServletRequest request) {
		
			List<CommBoard> boardLst = iServ.SelectBoard(request);
			int cnt = iServ.boardCount();
			model.addAttribute("boardLst", boardLst);
			model.addAttribute("navi", iServ.getNavi(request));
			
			logger.warn("자유게시판 연결 성공");
			return "forward:/index?formpath=commboard";
		}
	
	@RequestMapping(value = "write")
	public String commboardwrite(Model model, HttpSession session) {	
		
			logger.warn("글쓰기 연결 성공");
			model.addAttribute("usrId", session.getAttribute("id"));
			model.addAttribute("btnName", "글쓰기");
			model.addAttribute("proc", "writeProc");
			return "forward:/index?formpath=commboardwrite";
		}
	
	@RequestMapping(value = "writeProc")
	public String commboardwriteProc(CommBoard board, HttpServletRequest request) {
		iServ.Write(board, request);
			return "forward:/commboard/commboardProc";
		}
	
	@RequestMapping(value = "modify")
	public String modify(Model model, HttpSession session, CommBoard board) {
		model.addAttribute("usrId", session.getAttribute("id"));
		model.addAttribute("btnName", "수정");
		model.addAttribute("proc", "modifyProc");
		return "forward:/index?formpath=commboardwrite";
	}
	
	@RequestMapping(value = "modifyProc")
	public String modifyProc(CommBoard board) {
		iServ.Modify(board);
		return "forward:/board/boardProc";
	}
	
	@RequestMapping(value = "detailRead")
	public String detailRead(Model model, @RequestParam int writeNo) {
		
		
		logger.warn(writeNo+"입니다.");
		model.addAttribute("board", iServ.detailRead(writeNo));
		return "forward:/index?formpath=detailRead";
	}


	
}
