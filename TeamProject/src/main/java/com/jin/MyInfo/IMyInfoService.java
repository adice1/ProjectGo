package com.jin.MyInfo;

import java.util.List;

import com.jin.Member.Member;
import com.jin.Member.Postcode;

public interface IMyInfoService {
	public int MyAuth(String pw);
	public String MyAuthOk(String authNum, String authNumOk);
	public Postcode MyPostSelect();
}
