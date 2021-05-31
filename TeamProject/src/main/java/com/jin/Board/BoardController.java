package com.jin.Board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("QuestionBoard")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired private IBoardService iBoardServ;
	
	@RequestMapping(value = "QuestionWrite")
	public String write(Model model, HttpSession session) {
		model.addAttribute("usrId", session.getAttribute("id"));
		model.addAttribute("btnName", "±Û¾²±â");
		model.addAttribute("proc", "writePRoc");
		
		return "forward:/index?formpath=questionwrite";
	}
	
	
	@RequestMapping(value = "QuestionwriteProc")
	public String writeProc(Board question, HttpServletRequest request) {
		iBoardServ.Write(question, request);
		return "forward:/QuestionBoard/boardProc";
	}
	
	@RequestMapping(value = "boardProc")
	public String boardProc(Model model, HttpServletRequest request) {
		List<Board> boardLst = iBoardServ.SelectBoard(request);
		model.addAttribute("navi", iBoardServ.getNavi(request));
		model.addAttribute("boardLst", boardLst);
		return "forward:/index?formpath=QuestionBoard";
	}
	
	@RequestMapping(value = "detailRead")
	public String boardProc(Model model, @RequestParam String writeNo) {
		Map<String, Object>boardMap = iBoardServ.DetailRead(writeNo);
		model.addAttribute("board", boardMap.get("board"));
		model.addAttribute("attachLst", boardMap.get("attachLst"));
		return "forward:/index?formpath=questionview";
	}
	
	@RequestMapping(value = "reply")
	public String reply(Model model, @RequestParam String pno) {
		logger.warn(pno);
		model.addAttribute("pno", pno);
		return "forward:/index?formpath=questionwrite";
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String no) {
		logger.warn(no);
		iBoardServ.Delete(no);
		return "forward:/QuestionBoard/boardProc";
	}
	@RequestMapping(value = "deletes")
	public String deletes(HttpServletRequest reqeust) {
		String [] chkboxs = reqeust.getParameterValues("chkbox");
		iBoardServ.Deletes(chkboxs);
		return "forward:/QuestionBoard/boardProc";
	}

}
