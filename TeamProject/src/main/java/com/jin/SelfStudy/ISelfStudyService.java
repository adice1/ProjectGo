package com.jin.SelfStudy;

import java.util.List;

public interface ISelfStudyService {
	public void InsertSelfStudy(SelfStudy selfstudy);
	public List<SelfStudy> SelectSelfStudy(SelfStudy selfstudy);
}
