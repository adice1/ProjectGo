package com.jin.exam; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamServiceImpl implements IExamService{
	
	@Autowired private IExamDao iDao;

	
	@Override
	public String PrevExamOption() {
		String examOption;
		examOption = "<html>\r\n"
				+ "<head>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "    <form action=\"\">\r\n"
				+ "<center>\r\n"
				+ "<table  style=\"margin-top: 45%;\">\r\n"
				+ "    <tr>\r\n"
				+ "        <td  style=\"font-size: 24px;\">연도별 기출문제</td>\r\n"
				+ "        \r\n"
				+ "        <td>\r\n"
				+ "            <select name=\"year\" style=\"text-algin:right; width:150px; font-size: 24px;\" >\r\n"
				+ "                <option value=\"2015\">2015</option>\r\n"
				+ "                <option value=\"2016\">2016</option>\r\n"
				+ "                <option value=\"2017\">2017</option>\r\n"
				+ "                <option value=\"2018\">2018</option>\r\n"
				+ "                <option value=\"2019\">2019</option>\r\n"
				+ "                <option value=\"2020\">2020</option>\r\n"
				+ "                <option value=\"2021\">2021</option>\r\n"
				+ "            </select>\r\n"
				+ "\r\n"
				+ "        </td><td><button formaction=\"\" id=\"select\" style=\"width:150px; height:32px; font-size: 20px;\">선택</button></td></tr>\r\n"
				+ "   \r\n"
				+ "</table></center></form>\r\n"
				+ "</body>\r\n"
				+ "</html>";
		
		return examOption;
	}


	public IExamDao getiDao() {
		return iDao;
	}


	public void setiDao(IExamDao iDao) {
		this.iDao = iDao;
	}

}
