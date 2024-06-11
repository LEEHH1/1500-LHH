package com.korea.first;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YoilTellerMVC {
 @RequestMapping("/getYoil") // getYoil?year=2024&month=7&day=1
 public String main(int year,int month, int day,Model model) throws IOException{
	 //요청이 들어오면 값들이 자동으로 매개변수로 매핑이 되고 타입 변환 까지 해준다.
	 //1. 입력
// 	String year = request.getParameter("year");
// 	String month = request.getParameter("month");
// 	String day = request.getParameter("day");
// 	
// 	int yyyy = Integer.parseInt(year);
// 	int mm = Integer.parseInt(month);
// 	int dd = Integer.parseInt(day);
 	
 	// 2. 처리
// 	Calendar cal = Calendar.getInstance();
// 	cal.set(yyyy,mm-1, dd);
// 	
// 	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 일요일1, 월요일2, 화요일3,...
// 	
// 	char yoil = " 일월화수목금토".charAt(dayOfWeek);// 일요일 옆에 한칸 뜀 일요일은 1이라
 	
	 // 유효성 검사
	 if(!isValid(year,month,day)) {
		 return "yoiilError";
	 }
	 char yoil = getYoil(year,month,day);
	 model.addAttribute("year",year);
	 model.addAttribute("month",month);
	 model.addAttribute("day",day);
	 model.addAttribute("yoil",yoil);

	 return "yoil";
 	// 3. 출력
// 	response.setContentType("text/html"); // 응답 형식을 html 로 지정
// 	response.setCharacterEncoding("utf-8"); // 응답 인코딩을 utf-8로 지정
// 	PrintWriter out = response.getWriter(); // 브라우저로의 출력 스트림(out)을 얻는다
// 		out.println("<html>");
// 		out.println("<head>");
// 		out.println("</head>");
// 		out.println("<body>");
// 		out.println(year + "년" + month +"월" + day +"일은 ");
// 		out.println(yoil + "요일 입니다.");
// 		out.println("</body>");
// 		out.println("</html>");
// 		out.close();


 		
 		




 }
 private boolean isValid(int year,int month,int day) {
	 if(year < 0 || month < 0  || day < 0) {
		 return false;
	 }
	 return (1<=month && month <= 12) &&(1<=day && day<=31);
 }
 private char getYoil(int year, int month, int day) {
	 Calendar cal = Calendar.getInstance();
	 	cal.set(year,month-1, day);
	 	
	 	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 일요일1, 월요일2, 화요일3,...
	 	
	 	char yoil = " 일월화수목금토".charAt(dayOfWeek);// 일요일 옆에 한칸 뜀 일요일은 1이라
	 	return yoil;
 }
 	
}
