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

@Controller
@RequestMapping("myInfo")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Autowired private IMyInfoService iMyInfoServ;
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(HttpSession session
	 ,@RequestParam String pw ) {
		String id = (String)session.getAttribute("id");
		logger.warn("id"+id);
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyAuth")
	public String MyAuth(HttpSession session, @RequestParam String pw) {
		String id = (String)session.getAttribute("id");
//		iMyInfoServ.MyAuth();
//		int authNum = iMyInfoServ.MyAuth(pw);
		logger.warn("인증id"+id);
//		logger.warn("비밀번호 DB : "+authNum);
		return "forward:/index?formpath=myInfo";
	}
	

	
}