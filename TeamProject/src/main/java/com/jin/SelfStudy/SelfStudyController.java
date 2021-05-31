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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "selfstudy")
public class SelfStudyController {
	private static final Logger logger = LoggerFactory.getLogger(SelfStudyController.class);
	
	@RequestMapping(value = "test")
	public String test(String tv) {	
			logger.warn(tv);
			logger.warn("테스트가 실행 되었습니다.");
			return "forward:/index?formpath=home";
		}
	

}
