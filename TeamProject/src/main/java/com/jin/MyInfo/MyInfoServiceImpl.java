package com.jin.MyInfo;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.Login.Login;
import com.jin.Member.Member;
import com.jin.mail.SHA;

@Service
public class MyInfoServiceImpl implements IMyInfoService{
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
		sha.encryptSHA512(pw);
		int myCnt = iMyInfoDao.MyAuth(sha.encryptSHA512(pw), sessionId); //참 1, 거짓 0
		if(myCnt == 1) {
			int authNum = authNum();
			return authNum;
		}
		return 123;
	}

}
