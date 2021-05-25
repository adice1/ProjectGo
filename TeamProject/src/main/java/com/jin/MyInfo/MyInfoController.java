package com.jin.MyInfo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.Login.Login;
import com.jin.mail.SHA;

@Controller
@RequestMapping("myInfo")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	
	/*
	 * @RequestMapping(value = "myInfo") public String myInfo() { return
	 * "MyInfo/myInfoForm"; }
	 */
	
}