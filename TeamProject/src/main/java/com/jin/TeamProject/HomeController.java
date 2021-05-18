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

import com.jin.Login.ILoginService;
import com.jin.Login.Login;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	@RequestMapping(value = "/intro")
	public String intro() {
		return "intro";
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
	public String member() {
		return "Member/membershipForm";
	}
	@RequestMapping(value = "/studyroom")
	public String Studyroom() {
		return "Studyroom/studyroomForm";
	}
	@RequestMapping(value = "/board")
	public String board() {
		return "Board/boardForm";
	}
	@RequestMapping(value = "/preQuestions")
	public String preQuestions() {
		return "";
	}	
}
