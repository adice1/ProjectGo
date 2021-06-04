package com.jin.SelfStudy;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.mail.SHA;

@Service
public class SelfStudyServiceImpl implements ISelfStudyService {
	@Autowired private ISelfStudyDao iSelfStudyDao;
	
	@Override
	public void InsertSelfStudy(SelfStudy selfstudy) {
		iSelfStudyDao.InsertSelfStudy(selfstudy);
	}

	@Override
	public List<SelfStudy> SelectSelfStudy(SelfStudy selfstudy) {
		return iSelfStudyDao.SelectSelfStudy(selfstudy);
	}
	
}
