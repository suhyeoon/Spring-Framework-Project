package spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.web.model.Reservation;

public class AbstractReservationDAO {

	// application-config 에서 생성한 SqlSessionTemplate 객체를 자동 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Reservation selectRoom(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Reservation selectReservationDetail(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object roomPrice(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object packagePrice(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectRoomAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectPackageAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectRoomType(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectPackageType(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectReservation(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	public Object insertReservation(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object reservationCancel(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

}




