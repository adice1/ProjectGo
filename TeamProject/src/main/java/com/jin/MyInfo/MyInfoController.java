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
		logger.warn("내 정보에 어서오세요");
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(@RequestParam String zipcode, @RequestParam String addr1, @RequestParam String addr2) {
		logger.warn("내 정보 업데이트");
		logger.warn("창이 닫쳤습니다.");
		iMyInfoServ.MyInfoProc(zipcode, addr1, addr2);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "MyAuth") // 비밀번호 일치 비교
	public String MyAuth(HttpSession session, @RequestParam String pw, Model model ) {
		String id = (String)session.getAttribute("id");
		
		int authNum = iMyInfoServ.MyAuth(pw);
		logger.warn("비밀번호 DB : "+authNum);
		logger.warn("인증id"+id);
		if(authNum == 0)
			model.addAttribute("authNum", "비밀번호 다시 입력");
		else
			model.addAttribute("authNum",authNum);
		
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "MyAuthOk") //인증 값 일치 비교
	public String MyAuthOk(@RequestParam String authNumProc, @RequestParam String authNumOk, Model model) {
		logger.warn("컨트롤러"+authNumOk);
		logger.warn("컨트롤러"+authNumProc);
		logger.warn(iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		
		model.addAttribute("authNum", iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "passModify")	//비밀번호 팝업 창
	public String passModify() {
		logger.warn("비밀번호 팝업 창입니다.");
		
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
		if(authPwState == null || authPwState == false)
			session.setAttribute("authPwState", false);
		if(authPwOk == null || authPwOk == false)
			session.setAttribute("authPwOk", false);
		
		return "MyInfo/passModifyForm";
	}
	@RequestMapping(value = "MyInfoProcPw")//비밀번호 수정 
	public String MyInfoProcPw(String newPw) {
		logger.warn("비밀번호 수정중입니다.");
		logger.warn("newPw"+newPw);
		iMyInfoServ.MyInfoProcPw(newPw);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "postModify")	//주소 팝업 창
	public String postModify() {
		return "MyInfo/postModifyForm";
	}
	@RequestMapping(value = "postModifySelect") //주소 셀렉트 값
	public String postModifySelect(Model model ,@RequestParam String addr) {
		logger.warn("addr"+ addr);
		List<Zipcode> zipLst = iMyInfoServ.zipModifySelect(addr);
		model.addAttribute("zipLst", zipLst);
		return "MyInfo/postModifyForm";
	}
	
	

	

	
}