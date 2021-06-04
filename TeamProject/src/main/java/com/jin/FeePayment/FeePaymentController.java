package com.jin.FeePayment;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.Member.Member;
import com.jin.Member.Postcode;
import com.jin.Member.Zipcode;

@Controller
@RequestMapping(value = "Fee")
public class FeePaymentController {
	private static final Logger logger = LoggerFactory.getLogger(FeePaymentController.class);

	@RequestMapping(value = "feeProc")
	public String feeProc() {	 
		return "Fee/pamentForm";
	}
	@RequestMapping(value = "feePwProc")
	public String feePwProc() {	 
		return "Fee/pamentPwForm";
	}
	
}