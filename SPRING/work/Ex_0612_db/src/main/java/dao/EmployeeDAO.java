package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.RequiredArgsConstructor;
import vo.EmployeeVO;

@RequiredArgsConstructor
public class EmployeeDAO {
	final SqlSession sqlSession;
	
	
	//전체사원조회
	public List<EmployeeVO> selectList(){
//		List<EmployeeVO> list = sqlSession.selectList("employee.employee_list");
//		return list;
		return sqlSession.selectList("employee.employee_list");
	}
}
