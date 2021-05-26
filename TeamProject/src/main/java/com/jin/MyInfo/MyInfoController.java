package com.jin.MyInfo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.Member.Member;
import com.jin.Member.Postcode;

@Controller
@RequestMapping(value = "myInfo")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Autowired private IMyInfoService iMyInfoServ;
	@RequestMapping(value = "MyInfoFormProc")
	public String MyInfoFormProc(Postcode postcode, Model model) {
		Postcode myPost = iMyInfoServ.MyPostSelect();
		model.addAttribute("myPost"+myPost);
		logger.warn("내 정보에 어서오세요");
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(HttpSession session
	 ,@RequestParam String pw ) {
		String id = (String)session.getAttribute("id");
		logger.warn("id"+id);
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyAuth")
	public String MyAuth(HttpSession session, @RequestParam String pw, Model model ) {
		String id = (String)session.getAttribute("id");
		int authNum = iMyInfoServ.MyAuth(pw);
		logger.warn("비밀번호 DB : "+authNum);
		logger.warn("인증id"+id);
		if(authNum == 0)
			model.addAttribute("authNum", "비밀번호 다시 입력");
		else
			model.addAttribute("authNum",authNum);
		
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyAuthOk")
	public String MyAuthOk(@RequestParam String authNumProc, @RequestParam String authNumOk, Model model) {
		logger.warn("컨트롤러"+authNumOk);
		logger.warn("컨트롤러"+authNumProc);
		logger.warn(iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
//		iMyInfoServ.MyAuthOk(authNum, authNumOk);
		model.addAttribute("authNum", iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		return "forward:/index?formpath=myInfo";
	}
	
	

	

	
}