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
		logger.warn("�� ������ �������");
		return "forward:/index?formpath=myInfo";
	}
	@RequestMapping(value = "MyInfoProc")
	public String MyInfoProc(@RequestParam String zipcode, @RequestParam String addr1, @RequestParam String addr2) {
		logger.warn("�� ���� ������Ʈ");
		logger.warn("â�� ���ƽ��ϴ�.");
		iMyInfoServ.MyInfoProc(zipcode, addr1, addr2);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "MyAuth") // ��й�ȣ ��ġ ��
	public String MyAuth(HttpSession session, @RequestParam String pw, Model model ) {
		String id = (String)session.getAttribute("id");
		
		int authNum = iMyInfoServ.MyAuth(pw);
		logger.warn("��й�ȣ DB : "+authNum);
		logger.warn("����id"+id);
		if(authNum == 0)
			model.addAttribute("authNum", "��й�ȣ �ٽ� �Է�");
		else
			model.addAttribute("authNum",authNum);
		
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "MyAuthOk") //���� �� ��ġ ��
	public String MyAuthOk(@RequestParam String authNumProc, @RequestParam String authNumOk, Model model) {
		logger.warn("��Ʈ�ѷ�"+authNumOk);
		logger.warn("��Ʈ�ѷ�"+authNumProc);
		logger.warn(iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		
		model.addAttribute("authNum", iMyInfoServ.MyAuthOk(authNumProc, authNumOk));
		return "forward:/myInfo/passModify";
	}
	@RequestMapping(value = "passModify")	//��й�ȣ �˾� â
	public String passModify() {
		logger.warn("��й�ȣ �˾� â�Դϴ�.");
		
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
		if(authPwState == null || authPwState == false)
			session.setAttribute("authPwState", false);
		if(authPwOk == null || authPwOk == false)
			session.setAttribute("authPwOk", false);
		
		return "MyInfo/passModifyForm";
	}
	@RequestMapping(value = "MyInfoProcPw")//��й�ȣ ���� 
	public String MyInfoProcPw(String newPw) {
		logger.warn("��й�ȣ �������Դϴ�.");
		logger.warn("newPw"+newPw);
		iMyInfoServ.MyInfoProcPw(newPw);
		
		return "forward:/myInfo/MyInfoFormProc";
	}
	@RequestMapping(value = "postModify")	//�ּ� �˾� â
	public String postModify() {
		return "MyInfo/postModifyForm";
	}
	@RequestMapping(value = "postModifySelect") //�ּ� ����Ʈ ��
	public String postModifySelect(Model model ,@RequestParam String addr) {
		logger.warn("addr"+ addr);
		List<Zipcode> zipLst = iMyInfoServ.zipModifySelect(addr);
		model.addAttribute("zipLst", zipLst);
		return "MyInfo/postModifyForm";
	}
	
	

	

	
}