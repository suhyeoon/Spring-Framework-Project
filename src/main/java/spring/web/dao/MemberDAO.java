package spring.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.web.model.Member;

@Repository("memberDAO")
public class MemberDAO extends AbstractMemberDAO {
	
	private static final String MapperNameSpace = "spring.web.mapper.MemberMapper.";
	
	public Object login(String queryId, Object params) {
		return super.login(MapperNameSpace+"login", params);
	}
	
	public Member selectById(String queryId, Object params) {
		return super.selectById(MapperNameSpace+"selectById", params);
	}
	
	public Member selectByIdGrade(String queryId, Object params) {
		return super.selectByIdGrade(MapperNameSpace+"selectByIdGrade", params);
	}
	
	public Object duplicateIdCheck(String queryId, Object params) {
		return super.duplicateIdCheck(MapperNameSpace+"duplicateIdCheck", params);
	}
	
	public Object insert(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insert", params);
	}

	public Object update(String queryId, Object params) {
		return super.update(MapperNameSpace+"update", params);
	}
	
	public Object drop(String queryId, Object params) {
		return super.update(MapperNameSpace+"drop", params);
	}
	
	public Object passwordUpdate(String queryId, Object params) {
		return super.update(MapperNameSpace+"passwordUpdate", params);
	}

	public Object delete(String queryId, Object params) {
		return super.delete(MapperNameSpace+"delete", params);
	}
	
	public List idSearch(String queryId, Object params) {		
		return super.idSearch(MapperNameSpace+"idSearch", params);
	}
	
	public Object pwdSearch(String queryId, Object params) {
		return super.pwdSearch(MapperNameSpace+"pwdSearch", params);
	}
	
	public Object dropUserReservationCancel(String queryId, Object params) {
		return super.dropUserReservationCancel(MapperNameSpace+"dropUserReservationCancel", params);
	}
}
