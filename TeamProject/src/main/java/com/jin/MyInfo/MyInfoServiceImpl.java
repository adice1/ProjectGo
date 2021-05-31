package com.jin.MyInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.Login.Login;
import com.jin.Member.Member;
import com.jin.Member.Postcode;
import com.jin.Member.Zipcode;
import com.jin.mail.SHA;

@Service
public class MyInfoServiceImpl implements IMyInfoService{
	private static final Logger logger = LoggerFactory.getLogger(MyInfoServiceImpl.class);
	@Autowired private IMyInfoDao iMyInfoDao;
	@Autowired private HttpSession session;
	public int authNum() { //������ȣ ����
		Random rand = new Random();
		return rand.nextInt(10000);
	}

	@Override
	public int MyAuth(String pw) {
		String sessionId = (String)session.getAttribute("id");
		SHA sha = new SHA();
		String pwCnt = sha.encryptSHA512(pw);
		Map<String, String> myLst = new HashMap<String, String>();
		
		myLst.put("id", sessionId);
		myLst.put("pw", pwCnt);
		
		int myCnt = iMyInfoDao.MyAuth(myLst);
		
		Boolean authPwState =(Boolean) session.getAttribute("authPwState");
		
		if(myCnt == 1) {
			session.setAttribute("authPwState", true);
			int authNum = authNum();
			return authNum;
		}
		
		return 0;
	}
	@Override
	public String MyAuthOk(String authNumProc, String authNumOk) {
		
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
		
		if(authPwState == false) {
			return "��й�ȣ ������ȣ�� �������ּ���";
		}
		
		if(authNumProc.contentEquals(authNumOk)) {
				session.setAttribute("authPwOk", true);
				return "���� Ȯ�εǾ����ϴ�.";
				
		}
		
		return "�ٽ� �������ּ���";
	}

	@Override
	public List<Postcode> MyPostSelect() {
		String id = (String)session.getAttribute("id");
		List<Postcode> myPost = iMyInfoDao.MyPostSelect(id);
		
		return myPost;
	}

	@Override
	public List<Zipcode> zipModifySelect(String addr) {
		return iMyInfoDao.zipModifySelect(addr);
	}

	@Override
	public void MyInfoProc(String zipcode, String addr1, String addr2) {
		String sessionId = (String)session.getAttribute("id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", sessionId);
		map.put("zipcode", zipcode);
		map.put("addr1", addr1);
		map.put("addr2", addr2);

		iMyInfoDao.MyInfoProcPost(map);
	}

	@Override
	public void MyInfoProcPw(String newPw) {
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");

		if(authPwState == true && authPwOk == true) {
		String sessionId = (String)session.getAttribute("id");
		SHA sha = new SHA();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", sessionId);
		map.put("newPw", sha.encryptSHA512(newPw));
		iMyInfoDao.MyInfoProcPw(map);
		logger.warn("��й�ȣ ���� ����");
		}
		else
		logger.warn("��й�ȣ ���� ����");
	}
}
