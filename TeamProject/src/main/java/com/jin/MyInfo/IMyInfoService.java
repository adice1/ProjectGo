package com.jin.MyInfo;

import java.util.List;

import com.jin.Member.Member;
import com.jin.Member.Postcode;
import com.jin.Member.Zipcode;

public interface IMyInfoService {
	public int MyAuth(String pw);
	public String MyAuthOk(String authNum, String authNumOk);
	public List<Postcode> MyPostSelect();
	public List<Zipcode> zipModifySelect(String addr);
	public void MyInfoProc(String zipcode, String addr1, String addr2, String newPw);
}
