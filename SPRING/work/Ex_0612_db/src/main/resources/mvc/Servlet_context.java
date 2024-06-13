package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.db.DeptController;
import com.korea.db.EmployeeController;

import dao.DeptDAO;
import dao.EmployeeDAO;

@Configuration
@EnableWebMvc
@ComponentScan(".com.korea.db")
public class Servlet_context implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resouces/**").addResourceLocations("/resources/");
	}
	//수동객체 생성
	@Bean
	public DeptController deptController(DeptDAO dept_dao) {
		return new DeptController(dept_dao);
	}
	
	@Bean
	public EmployeeController employeeController(EmployeeDAO employee_dao) {
		return new EmployeeController(employee_dao);
	}
}
