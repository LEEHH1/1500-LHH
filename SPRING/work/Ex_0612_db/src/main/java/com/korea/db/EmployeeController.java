package com.korea.db;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import dao.EmployeeDAO;
import lombok.RequiredArgsConstructor;
import vo.EmployeeVO;

@Controller
//생성자주입
@RequiredArgsConstructor
public class EmployeeController {
	public static final String VIEW_PATH = "/WEB-INF/views/dept/";
	final EmployeeDAO employee_dao;
	
	@RequestMapping("employee_list")
	public String list(Model model) {
		List<EmployeeVO> list = employee_dao.selectList();
		model.addAttribute("list",list);
		return VIEW_PATH +"employee_list.jsp";
	}
}
