package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.DeptDAO;
import dao.EmployeeDAO;

@Configuration
public class Context_2_dao {
	//프로젝트를 실행하면 Webinitializer가 실행이 되고
	// 모든 Context를 읽으며 메모리에 객체를 미리 올려놓습니다.
	// 우리는필요할 때 호출만 하여 이미 올라간 메모리를 필드에 주입한다.
	
	@Bean
	public DeptDAO dept_dao(SqlSession sqlSession) {
		return new DeptDAO(sqlSession);
	}
	
	@Bean
	public EmployeeDAO employee_dao(SqlSession sqlSession) {
		return new EmployeeDAO(sqlSession);
	}
	
}
