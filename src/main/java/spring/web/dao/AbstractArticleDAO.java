package spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.web.model.Article;
import spring.web.model.Comment;

public class AbstractArticleDAO {

	// application-config 에서 생성한 SqlSessionTemplate 객체를 자동 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Object searchCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List searchSelectAll(String queryId, Object params) {
		return sqlSession.selectList(queryId, params);
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
	
	public Article noticeSelect(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}
	
	// event
	
	public Object eventCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object eventInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object eventUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object eventUpdateImage(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object eventUpdateCount(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object eventDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List eventSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	public Article eventSelect(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}

	//qna
	
	public Object qnaCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object qnaCommentCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object qnaInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object qnaCommentInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object qnaUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object qnaDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object qnaCommentDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List qnaSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List qnaCommentSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	public Article qnaSelect(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}
	
	// suggest
	
	public Object suggestCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object suggestCommentCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object suggestInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object suggestCommentInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object suggestUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object suggestDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object suggestCommentDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List suggestSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List suggestCommentSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	public Article suggestSelect(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object suggestUpdateCount(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	// review
	
	public Object reviewCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object reviewCommentCountAll(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}

	public Object reviewInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object reviewCommentInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object reviewUpdate(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object reviewUpdateImage(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public Object reviewDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object reviewCommentDelete(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List reviewSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List reviewCommentSelectAll(String queryId, Object params) {		
		return sqlSession.selectList(queryId, params);
	}
	
	public Article reviewSelect(String queryId, Object params) {		
		return sqlSession.selectOne(queryId, params);
	}
	
	public Object reviewUpdateCount(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object reviewRecommendUp(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object reviewRecommendDown(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}
	
	public Object recommendInsert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object recommendDelete(String queryId, Object params) {
		return sqlSession.delete(queryId, params);
	}
	
	public Object recommendSelect(String queryId, Object params) {
		return sqlSession.selectOne(queryId, params);
	}
}




