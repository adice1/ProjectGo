package com.jin.Member;

import com.jin.Login.Login;

//회원 선택 정보 
public class Member extends Login{
	// 아이디
//	private String id;
	// 성별
	private String gender;
	// 이메일
	private String email;

//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
