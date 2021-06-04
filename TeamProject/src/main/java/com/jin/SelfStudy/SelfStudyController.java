package com.jin.SelfStudy;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jin.CommBoardComment.Comment;
import com.jin.CommBoardComment.ICommentService;
import com.jin.Login.ILoginService;
import com.jin.Login.Login;

@Controller
@RequestMapping(value = "selfstudy")
public class SelfStudyController {
	private static final Logger logger = LoggerFactory.getLogger(SelfStudyController.class);
	
	@Autowired private ISelfStudyService iSelfStudyServ;
	
	@ResponseBody
	@RequestMapping(value = "stopWatchInsert", produces="application/json", method = RequestMethod.POST)
	public void stopWatchInsert(String timer) {
		logger.warn("stopWatchInsert");		
	}
	
	@ResponseBody
	@RequestMapping(value = "InsertStudy", produces="application/json", method = RequestMethod.POST)
	public void InsertStudy(SelfStudy selfstudy) {
		iSelfStudyServ.InsertSelfStudy(selfstudy);
	}
	
	@ResponseBody
	@RequestMapping(value = "SelectStudy", produces="application/json", method = RequestMethod.POST)
	public List<SelfStudy> SelectStudy(SelfStudy selfstudy) {
		List<SelfStudy> selfstudylst = iSelfStudyServ.SelectSelfStudy(selfstudy);
		return selfstudylst;
	}
	
	

}
