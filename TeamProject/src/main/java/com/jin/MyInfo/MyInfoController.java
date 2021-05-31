package com.jin.MyInfo;

import java.util.List;

import javax.mail.Session;
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
import com.jin.Member.Zipcode;

@Controller
@RequestMapping(value = "myInfo")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Autowired private IMyInfoService iMyInfoServ;
	@Autowired private HttpSession session;
	@RequestMapping(value = "MyInfoFormProc")
	public String MyInfoFormProc(Postcode postcode, Model model) {
		List<Postcode> myPost = iMyInfoServ.MyPostSelect();
		model.addAttribute("myPost", myPost);
		
		 session.setAttribute("authPwState", false);
		 session.setAttribute("authPwOk", false);
		 
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(@RequestParam String zipcode, @RequestParam String addr1, @RequestParam String addr2) {
		iMyInfoServ.MyInfoProc(zipcode, addr1, addr2);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "MyAuth") // 비밀번호 일치 비교
	public String MyAuth(HttpSession session, @RequestParam String pw, Model model ) {
		String id = (String)session.getAttribute("id");
		int authNum = iMyInfoServ.MyAuth(pw);
		
		if(authNum == 0)
			model.addAttribute("authNum", "비밀번호 다시 입력");
		else
			model.addAttribute("authNum",authNum);
		
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "MyAuthOk") //인증 값 일치 비교
	public String MyAuthOk(@RequestParam String authNumProc, @RequestParam String authNumOk, Model model) {
		
		model.addAttribute("authNum", iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "passModify")	//비밀번호 팝업 창
	public String passModify() {
		
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
		if(authPwState == null || authPwState == false)
			session.setAttribute("authPwState", false);
		if(authPwOk == null || authPwOk == false)
			session.setAttribute("authPwOk", false);
		
		return "MyInfo/passModifyForm";
	}
	@RequestMapping(value = "MyInfoProcPw")//비밀번호 수정 
	public String MyInfoProcPw(String newPw, Model model) {
		iMyInfoServ.MyInfoProcPw(newPw);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "postModify")	//주소 팝업 창
	public String postModify() {
		return "MyInfo/postModifyForm";
	}
	@RequestMapping(value = "postModifySelect") //주소 셀렉트 값
	public String postModifySelect(Model model ,@RequestParam String addr) {
		List<Zipcode> zipLst = iMyInfoServ.zipModifySelect(addr);
		model.addAttribute("zipLst", zipLst);
		return "MyInfo/postModifyForm";
	} 
}