package context;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class Context_1_mybatis {
	@Bean
	public DataSource ds() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		ds.setUsername("hr");
		ds.setPassword("hr");
		
		return ds;
				
	}
	@Bean
	public SqlSessionFactory factoryBean() throws Exception{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(ds());
		//추가적인 mybatis 설정
		factoryBean.setConfigLocation(new ClassPathResource("mybatis/config/mybatis-config.xml"));
		return factoryBean.getObject();
	}
	
	//SqlSession을 생성하기 위해 SqlSessionFactory 객체를 사용했다.
	//Mybatis Spring 연동모듈을 사용하면 SqlSessionFactory를 직접 사용할 필요가 없다.
	
	//SqlSessionTemplate 클래스는 SqlSessin을 구현하고 코드에서 SqlSession을 대체하는
	// 역할을 한다.
	
	@Bean
	public SqlSessionTemplate sqlSessionBean(SqlSessionFactory factoryBean) {
		return new SqlSessionTemplate(factoryBean);
	}
}

