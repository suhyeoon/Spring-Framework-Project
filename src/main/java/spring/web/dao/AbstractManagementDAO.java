package spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.web.model.Management;
import spring.web.model.Reservation;

public class AbstractManagementDAO {

	// application-config 에서 생성한 SqlSessionTemplate 객체를 자동 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Object searchCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectAll(String queryId , Object params) {
		return sqlSession.selectList(queryId, params);
	}
	
	public Management select(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}
	
	public Reservation select_res(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}

	public Object update(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params) {
		return sqlSession.delete(queryId, params);
	}
	
	public Object insert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	// notice
	
	public Object noticeCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object noticeInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object noticeUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object noticeUpdateCount(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object noticeDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List noticeSelectAll(String queryId, Object params) {
		return sqlSession.selectList(queryId, params);
	}
	
	
	
}




