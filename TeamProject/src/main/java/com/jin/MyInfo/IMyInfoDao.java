package com.jin.MyInfo;

import java.util.List;
import java.util.Map;

import com.jin.Member.Postcode;
import com.jin.Member.Zipcode;

public interface IMyInfoDao {
	public int MyAuth(Map<String, String> myLst);
	public List<Postcode> MyPostSelect(String id);
	public List<Zipcode> zipModifySelect(String addr);
	public void MyInfoProcPost(Map<String, String> map);
	public void MyInfoProcPw(Map<String, String> map);
	 
}
