package com.jin.Login;

public interface ILoginDao {
	public int LoginProc(Login login);
	public int kakaoProc(String id);
	public void kakaoInsert(String id);
}
