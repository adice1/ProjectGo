package com.jin.Login;

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
@RequestMapping(value = "login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private ILoginService iLoginServ;

	@RequestMapping(value = "/loginProc")
	public String loginProc(Login login, Model model) {
		int loginCnt = iLoginServ.LoginProc(login);
		if(loginCnt == 1) {
			logger.warn("로그인 성공");
			return "forward:/index?formpath=home";
		}
		model.addAttribute("msg", "다시 로그인해주세요");
		return "forward:/index?formpath=login"; 
	}
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:/index?formpath=home";
	}
	
	
}
