package com.jin.Member;

import java.util.List;

import com.jin.Login.Login;

public interface IMemberDao {
	public int IsExistID(String id);
	public void InsertLogin(Login login);
	public void InsertMember(Member member);
	public List<Zipcode> SearchZipcode(String addr);
	public void InsertPostcode(Postcode postcode);
}
