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
	public String commboardProc(Model model) {
		
			List<CommBoard> board = iServ.select();
			int cnt = iServ.boardCount();
			logger.warn("�Խñ� �� ���� = "+cnt);
			model.addAttribute("boardLst", board);
			
			logger.warn("�����Խ��� ���� ����");
			return "forward:/index?formpath=commboard";
		}
	
	@RequestMapping(value = "write")
	public String commboardwrite(Model model, HttpSession session) {	
			String id = (String) session.getAttribute("id");
		
			logger.warn("�۾��� ���� ����");
			model.addAttribute("usrId", id);
			model.addAttribute("btnName", "�۾���");
			return "forward:/index?formpath=commboardwrite";
		}
	
	@RequestMapping(value = "writeProc")
	public String commboardwriteProc(Model model,
			@RequestParam String id,
			@RequestParam String contents,
			@RequestParam String title) {

			CommBoard commboard = new CommBoard();
		
//			logger.warn("�ۼ��� : "+id);
//			logger.warn("���� : "+title);
//			logger.warn("���� : "+contents);
			
			commboard.setId(id);
			commboard.setTitle(title);
			commboard.setContents(contents);
			
			iServ.Insert(commboard);
			
			logger.warn("�����Խ��� �ۼ� ����");
			return "forward:/index?formpath=commboard";
		}


	
}
