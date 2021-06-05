package com.jin.TeamProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.Member.Member;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private HttpSession session;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("formpath", "home");
		return "index";
	}
	@RequestMapping(value = "/index")
	public String index(Model model,
			@RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "index";
	}
	@RequestMapping(value = "/home")
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/fee")
	public String fee() {
		return "Fee/feeForm";
	}	
	@RequestMapping(value = "/login")
	public String login() {
		return "Member/loginForm";
	}
	@RequestMapping(value = "/logout")
	public String logout() {
		return "forward:/Member/loginForm";
	}
	@RequestMapping(value = "/member")
	public String member(Model model, Member member) {
		Boolean authState = (Boolean)session.getAttribute("authState");
//		logger.warn(authState+"");
		
		if(authState==null)
			session.setAttribute("authState", false);
		return "Member/membershipForm";
	}
	
	@RequestMapping(value = "/QuestionBoard")
	public String QuestionBoard() {
		return "Board/questionboardForm";
	}
	
	@RequestMapping(value = "/questionwrite")
	public String QuestionWrite() {
		return "Board/questionwriteForm";
	}
	
	@RequestMapping(value = "/questionaswrite")
	public String QuestionasWrite() {
		return "Board/questionreplywriteForm";
	}
	
	@RequestMapping(value = "/questionview")
	public String QuestionReplyWrite() {
		return "Board/questionviewForm";
	}
	
	//--자유 게시판 영역--
	@RequestMapping(value = "/commboard")
	public String freeBoard() {
		return "CommBoard/boardForm";
	}
	@RequestMapping(value = "/commboardwrite")
	public String commboardwrite() {
		return "CommBoard/writeForm";
	}
	@RequestMapping(value = "/commboardview")
	public String detailRead() {
		return "CommBoard/viewForm";
	}
	// --자유게시판 영역--
	@RequestMapping(value = "/yearExam")
	public String yearExam() {
		return "Exam/yearExamForm";
	}
	@RequestMapping(value = "/smartExam")
	public String smartExam() {
		return "Exam/smartExamForm";
	}
	@RequestMapping(value = "/randExam")
	public String randExam() {
		return "Exam/randExamForm";
	}
	@RequestMapping(value = "/videoLecture")
	public String videoLecture() {
		return "videoLecture/videoLectureForm";
	}
	@RequestMapping(value = "/selfStudy")
	public String studyroom() {
		return "selfStudy/selfStudyForm";
	}
	@RequestMapping(value = "/myInfo")
	public String myInfo() {
		return "MyInfo/myInfoForm";
	}
	@RequestMapping(value = "/videoLst")
	public String videoLst() {
		return "MyInfo/videoLstForm";
	}
		
}