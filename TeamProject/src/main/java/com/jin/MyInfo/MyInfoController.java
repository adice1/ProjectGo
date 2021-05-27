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
import com.jin.Member.Zipcode;

@Controller
@RequestMapping(value = "myInfo")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Autowired private IMyInfoService iMyInfoServ;
	@RequestMapping(value = "MyInfoFormProc")
	public String MyInfoFormProc(Postcode postcode, Model model) {
		List<Postcode> myPost = iMyInfoServ.MyPostSelect();
		model.addAttribute("myPost", myPost);
		logger.warn("�� ������ �������");
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(@RequestParam String zipcode, @RequestParam String addr1, @RequestParam String addr2, @RequestParam String newPw) {
		logger.warn("�� ���� ������Ʈ");
		iMyInfoServ.MyInfoProc(zipcode, addr1, addr2, newPw);
		
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "MyAuth")
	public String MyAuth(HttpSession session, @RequestParam String pw, Model model ) {
		String id = (String)session.getAttribute("id");
		int authNum = iMyInfoServ.MyAuth(pw);
		logger.warn("��й�ȣ DB : "+authNum);
		logger.warn("����id"+id);
		if(authNum == 0)
			model.addAttribute("authNum", "��й�ȣ �ٽ� �Է�");
		else
			model.addAttribute("authNum",authNum);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "MyAuthOk")
	public String MyAuthOk(@RequestParam String authNumProc, @RequestParam String authNumOk, Model model) {
		logger.warn("��Ʈ�ѷ�"+authNumOk);
		logger.warn("��Ʈ�ѷ�"+authNumProc);
		logger.warn(iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		
		model.addAttribute("authNum", iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "postModify")	//�ּ� �˾� â
	public String postModify() {
		return "MyInfo/postModifyForm";
	}
	@RequestMapping(value = "postModifySelect")
	public String postModifySelect(Model model ,@RequestParam String addr) {
		logger.warn("addr"+ addr);
		List<Zipcode> zipLst = iMyInfoServ.zipModifySelect(addr);
		model.addAttribute("zipLst", zipLst);
		return "MyInfo/postModifyForm";
	}
	

	

	
}