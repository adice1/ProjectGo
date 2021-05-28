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
	public int authNum() { //인증번호 생성
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
		logger.warn(authPwState+"");
		
		if(myCnt == 1) {
			session.setAttribute("authPwState", true);
			logger.warn(authPwState+"MyAuth > authPwState");
			int authNum = authNum();
			return authNum;
		}
		
		return 0;
	}

	@Override
	public String MyAuthOk(String authNumProc, String authNumOk) {
		logger.warn("서비스 임플 :"+authNumProc);
		logger.warn("서비스 임플 :"+authNumOk);
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
		logger.warn(authPwState+"authPwState");
		logger.warn(authPwOk+"authPwOk");
		if(authPwState == false)
			return "비밀번호 인증번호를 생성해주세요";
			if(authNumProc.contentEquals(authNumOk)) {
				session.setAttribute("authPwOk", true);
				return "인증 확인되었습니다.";
			}
		return "다시 인증해주세요";
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
//		SHA sha = new SHA();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", sessionId);
		map.put("zipcode", zipcode);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
//		map.put("newPw", sha.encryptSHA512(newPw));

		iMyInfoDao.MyInfoProcPost(map);
//		iMyInfoDao.MyInfoProcPw(map);
	}

	@Override
	public void MyInfoProcPw(String newPw) {
		Boolean authPwState = (Boolean)session.getAttribute("authPwState");
		Boolean authPwOk = (Boolean)session.getAttribute("authPwOk");
//		if(authPwState == false) return "인증번호를 생성하세요";
		logger.warn(authPwState+"MyInfoProcPw");
		logger.warn(authPwOk+"MyInfoProcPw");
		String sessionId = (String)session.getAttribute("id");
		SHA sha = new SHA();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", sessionId);
		map.put("newPw", sha.encryptSHA512(newPw));
		iMyInfoDao.MyInfoProcPw(map);
		
	}
	
}
