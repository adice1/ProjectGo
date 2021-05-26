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
		
		if(myCnt == 1) {
			int authNum = authNum();
			return authNum;
		}
		
		return 0;
	}

	@Override
	public String MyAuthOk(String authNumProc, String authNumOk) {
		logger.warn("���� ���� :"+authNumProc);
		logger.warn("���� ���� :"+authNumOk);
		
		if(authNumProc.contentEquals(authNumOk))
			return "���� Ȯ�εǾ����ϴ�.";
		
		return "�ٽ� �������ּ���";
	}

	@Override
	public Postcode MyPostSelect() {
		String sessionId = (String)session.getAttribute("id");
		Postcode myPost = iMyInfoDao.MyPostSelect(sessionId);
		
		return myPost;
	}
}
