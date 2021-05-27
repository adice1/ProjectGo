package com.jin.CommBoard;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jin.CommBoardComment.Comment;
import com.jin.CommBoardComment.ICommentService;
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
	@Autowired
	private ICommentService ICommentServ;
	
	
	@RequestMapping(value = "commboardProc")
	public String commboardProc(Model model, HttpServletRequest request) {
		
			List<CommBoard> boardLst = iServ.SelectBoard(request);
			model.addAttribute("boardLst", boardLst);
			model.addAttribute("navi", iServ.getNavi(request));
			
//			logger.warn("자유게시판 연결 성공");
			return "forward:/index?formpath=commboard";
		}
	
	@RequestMapping(value = "write")
	public String commboardwrite(Model model, HttpSession session) {	
//			logger.warn("글쓰기 연결 성공");
			model.addAttribute("usrId", session.getAttribute("id"));
			model.addAttribute("btnName", "글쓰기");
			model.addAttribute("proc", "writeProc");
			return "forward:/index?formpath=commboardwrite";
		}
	
	@RequestMapping(value = "writeProc")
	public String commboardwriteProc(CommBoard board, HttpServletRequest request) {
		logger.warn(board.getNo()+"");
		iServ.Write(board, request);
			return "forward:/commboard/commboardProc";
		}
	
	@RequestMapping(value = "modify")
	public String modify(Model model, HttpSession session, CommBoard board) {
		
		model.addAttribute("usrId", session.getAttribute("id"));
		model.addAttribute("board", board);
		model.addAttribute("btnName", "수정");
		model.addAttribute("proc", "modifyProc");
		return "forward:/index?formpath=commboardwrite";
	}
	
	@RequestMapping(value = "modifyProc")
	public String modifyProc(CommBoard board) {
		iServ.Modify(board);
		return "forward:/commboard/commboardProc";
	}
	
	@RequestMapping(value = "detailRead")
	public String detailRead(Model model, @RequestParam String writeNo) {
		Map<String, Object> boardMap = iServ.detailRead(writeNo);
		model.addAttribute("board", boardMap.get("board"));
		return "forward:/index?formpath=commboardview";
	}
	
	@RequestMapping(value = "reply")
	public String reply(Model model, @RequestParam String pno, HttpSession session) {
		model.addAttribute("usrId", session.getAttribute("id"));
		model.addAttribute("btnName", "글쓰기");
		model.addAttribute("proc", "writeProc");
		
		model.addAttribute("pno", pno);
		return "forward:/index?formpath=commboardwrite";
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String no) {
		iServ.Delete(no);
		return "forward:/commboard/commboardProc";
	}
	@RequestMapping(value = "deletes")
	public String deletes(HttpServletRequest reqeust) {
		String [] chkboxs = reqeust.getParameterValues("chkbox");
		iServ.Deletes(chkboxs);
		return "forward:/commboard/commboardProc";
	}
	@ResponseBody
	@RequestMapping(value = "test", method = RequestMethod.POST)
	public String test(Model model, CommBoard board, String name) {

		logger.warn(board.getNo() + "");
		logger.warn(board.getTitle());
		logger.warn(board.getContents());
		logger.warn(board.getWritedate()+"");
		
		return "forward:/index?formpath=commboardview";
	}
	
}
