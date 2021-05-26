package com.jin.exam;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("Exam")
public class examController {
	@Autowired IExamService iServ;
	
	@RequestMapping(value="yearExamForm")
	public String yearEx(Model model) {
	String pageName = "<h3>연도별 기출문제 페이지입니다.</h3>";	
	
		model.addAttribute("pageName", pageName);
		model.addAttribute("exam", "exam");
		model.addAttribute("omr", "omr");
		return "yearExamForm";
	}
	
	@RequestMapping(value="yearExam")
	public String yearExam() {
		return "Exam/yearExamForm";
	}
	
	
	
	
	
	
	
//	@RequestMapping(value = "/yearExam")
//	public String yearExam() {
//		return "Exam/yearExamForm";
//	}
}
