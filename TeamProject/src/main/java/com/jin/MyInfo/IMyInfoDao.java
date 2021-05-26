package com.jin.MyInfo;

import java.util.Map;

import com.jin.Member.Postcode;

public interface IMyInfoDao {
	public int MyAuth(Map<String, String> myLst);
	public Postcode MyPostSelect(String id);
}
