package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.RequiredArgsConstructor;
import vo.DeptVO;

@RequiredArgsConstructor
public class DeptDAO {
	
	
	
	final SqlSession sqlSession; // 필드
	//setter를 통해서 넣는다.
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}

// 생성자를 통해 넣는다.

//	public DeptDAO(SqlSession sqlSession) {
//		super();
//		this.sqlSession = sqlSession;
//	}
	
	//전체부서 조회하기
	public List<DeptVO> selectList(){
		List<DeptVO> list = sqlSession.selectList("dept.dept_list");
		return list;
	}
	
	
	
}
