package spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.web.model.Member;

public class AbstractMemberDAO {

	// application-config 에서 생성한 SqlSessionTemplate 객체를 자동 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectById(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Member selectByIdGrade(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object login(String queryId) {
		return sqlSession.selectOne(queryId);
	}

	public Object login(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object duplicateIdCheck(String queryId) {
		return sqlSession.selectOne(queryId);
	}
	
	public Object duplicateIdCheck(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object pwdSearch(String queryId) {
		return sqlSession.selectOne(queryId);
	}
	
	public Object pwdSearch(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {		
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List idSearch(String queryId) {		
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List idSearch(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}

	public Object insert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}

	public Object update(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object passwordUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object delete(String queryId, Object params) {
		return sqlSession.delete(queryId, params);
	}
	
	public Object dropUserReservationCancel(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

}




