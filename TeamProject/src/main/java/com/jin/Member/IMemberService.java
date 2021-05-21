package com.jin.Member;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import com.jin.Login.Login;

public interface IMemberService {
	public String IsExistID(Login login);
	public void sendAuth(Member member);
	public String authConfirm(String authNum/* , HttpSession session */);
	public String MemberProc(Member member, Postcode postcode);
	public List<Zipcode> SearchZipcode(String addr);
}
