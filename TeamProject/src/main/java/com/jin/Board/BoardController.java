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
	public String writeas(Model model,
			HttpSession session) {
		model.addAttribute("btnName", "질문글쓰기");
		model.addAttribute("proc", "QuestionwriteProc");
		return "forward:/index?formpath=questionaswrite";
	}
	
	@RequestMapping(value = "QuestionwriteProc")
	public String writeProc(Board question, HttpServletRequest request) {
		
		String pno =  request.getParameter("pno");
		logger.warn(pno);
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
	public String detailRead(Model model, @RequestParam String writeNo,
			HttpSession session) {
		Map<String, Object>boardMap = iBoardServ.DetailRead(writeNo);
		List<Board> Replylist = iBoardServ.DetailReply(writeNo);
		model.addAttribute("btnName", "답변작성");
		model.addAttribute("board", boardMap.get("board"));
		model.addAttribute("Replylist", Replylist);
		model.addAttribute("attachLst", boardMap.get("attachLst"));
		
		
		return "forward:/index?formpath=questionview";
	}
	
	@RequestMapping(value = "replyProc")
	public String reply(Model model, @RequestParam String pno,
			@RequestParam String title,
			HttpSession session) {
		logger.warn(pno);
		model.addAttribute("pno", pno);
		model.addAttribute("btnName", "글쓰기");
		model.addAttribute("proc", "QuestionwriteProc");
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
