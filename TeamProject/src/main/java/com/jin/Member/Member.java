package com.jin.Member;

import com.jin.Login.Login;

//ȸ�� ���� ���� 
public class Member extends Login{
	// ���̵�
//	private String id;
	// ����
	private String gender;
	// �̸���
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