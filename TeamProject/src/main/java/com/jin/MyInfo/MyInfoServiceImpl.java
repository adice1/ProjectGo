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
	public void MyInfoProc(String zipcode, String addr1, String addr2, String newPw) {
		String sessionId = (String)session.getAttribute("id");
		SHA sha = new SHA();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", sessionId);
		map.put("zipcode", zipcode);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("newPw", sha.encryptSHA512(newPw));
		
		iMyInfoDao.MyInfoProcPost(map);
		iMyInfoDao.MyInfoProcPw(map);
		
	}
}
