package spring.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.web.model.Article;
import spring.web.model.Comment;

@Repository("articleDAO")
public class ArticleDAO extends AbstractArticleDAO {
	
	private static final String MapperNameSpace = "spring.web.mapper.ArticleMapper.";
	
	// notice
	
	public Object noticeInsert(String queryId, Object params) {
		return super.noticeInsert(MapperNameSpace+"noticeInsert", params);
	}
	
	public Object noticeCountAll(String queryId, Object params) {
		return super.noticeCountAll(MapperNameSpace+"noticeCountAll", params);
	}
	
	public Object noticeUpdate(String queryId, Object params) {
		return super.noticeUpdate(MapperNameSpace+"noticeUpdate", params);
	}
	
	public Object noticeUpdateCount(String queryId, Object params) {
		return super.noticeUpdateCount(MapperNameSpace+"noticeUpdateCount", params);
	}

	public Object noticeDelete(String queryId, Object params) {
		return super.noticeDelete(MapperNameSpace+"noticeDelete", params);
	}
	
	public Article noticeSelect(String queryId, Object params) {
		return super.noticeSelect(MapperNameSpace+"noticeSelect", params);
	}
	
	public List noticeSelectAll(String queryId, Object params) {		
		return super.noticeSelectAll(MapperNameSpace+"noticeSelectAll", params);
	}
	
	// 검색
	// 쿼리문만 바꿔서 모든 값을 뽑아낼 것이기 때문에 여기까지만 고치면 된다고 판단.
	public List search(String queryId, Object params) {
		return super.searchSelectAll(MapperNameSpace+"search", params);
	}
	
	public List searchtitleContents(String queryId, Object params) {
		return super.searchSelectAll(MapperNameSpace+"search"+queryId, params);
	}
	
	public Object searchCount(String queryId, Object params) {
		return super.searchCountAll(MapperNameSpace+"searchCount", params);
	}
	
	public Object searchCountTitleContents(String queryId, Object params) {
		return super.searchCountAll(MapperNameSpace+"searchCount"+queryId, params);
	}
	
	// event
	
	public Object eventInsert(String queryId, Object params) {
		return super.eventInsert(MapperNameSpace+"eventInsert", params);
	}
	
	public Object eventCountOngoing(String queryId, Object params) {
		return super.eventCountAll(MapperNameSpace+"eventCountOngoing", params);
	}
	
	public Object eventCountEnd(String queryId, Object params) {
		return super.eventCountAll(MapperNameSpace+"eventCountEnd", params);
	}
	
	public Object eventUpdate(String queryId, Object params) {
		return super.eventUpdate(MapperNameSpace+"eventUpdate", params);
	}
	
	public Object eventUpdateImage(String queryId, Object params) {
		return super.eventUpdateImage(MapperNameSpace+"eventUpdateImage", params);
	}
	
	public Object eventUpdateCount(String queryId, Object params) {
		return super.eventUpdateCount(MapperNameSpace+"eventUpdateCount", params);
	}

	public Object eventDelete(String queryId, Object params) {
		return super.eventDelete(MapperNameSpace+"eventDelete", params);
	}
	
	public Article eventSelect(String queryId, Object params) {
		return super.eventSelect(MapperNameSpace+"eventSelect", params);
	}
	
	public List eventOngoing(String queryId, Object params) {		
		return super.eventSelectAll(MapperNameSpace+"eventOngoing", params);
	}
	
	public List eventEnd(String queryId, Object params) {		
		return super.eventSelectAll(MapperNameSpace+"eventEnd", params);
	}
	
	// qna
	
	public Object qnaInsert(String queryId, Object params) {
		return super.qnaInsert(MapperNameSpace+"qnaInsert", params);
	}
	
	public Object qnaCommentInsert(String queryId, Object params) {
		return super.qnaCommentInsert(MapperNameSpace+"qnaCommentInsert", params);
	}
	
	public Object qnaCountAll(String queryId, Object params) {
		return super.qnaCountAll(MapperNameSpace+"qnaCountAll", params);
	}
	
	public Object qnaCommentCountAll(String queryId, Object params) {
		return super.qnaCommentCountAll(MapperNameSpace+"qnaCommentCountAll", params);
	}
	
	public Object qnaUpdate(String queryId, Object params) {
		return super.qnaUpdate(MapperNameSpace+"qnaUpdate", params);
	}

	public Object qnaDelete(String queryId, Object params) {
		return super.qnaDelete(MapperNameSpace+"qnaDelete", params);
	}
	
	public Object qnaCommentDelete(String queryId, Object params) {
		return super.qnaCommentDelete(MapperNameSpace+"qnaCommentDelete", params);
	}
	
	public Article qnaSelect(String queryId, Object params) {
		return super.qnaSelect(MapperNameSpace+"qnaSelect", params);
	}
	
	public List qnaSelectAll(String queryId, Object params) {		
		return super.qnaSelectAll(MapperNameSpace+"qnaSelectAll", params);
	}
	
	public List qnaCommentSelectAll(String queryId, Object params) {		
		return super.qnaCommentSelectAll(MapperNameSpace+"qnaCommentSelectAll", params);
	}

	// suggest
	
	public Object suggestInsert(String queryId, Object params) {
		return super.suggestInsert(MapperNameSpace+"suggestInsert", params);
	}
	
	public Object suggestCommentInsert(String queryId, Object params) {
		return super.suggestCommentInsert(MapperNameSpace+"suggestCommentInsert", params);
	}
	
	public Object suggestCountAll(String queryId, Object params) {
		return super.suggestCountAll(MapperNameSpace+"suggestCountAll", params);
	}
	
	public Object suggestCommentCountAll(String queryId, Object params) {
		return super.suggestCommentCountAll(MapperNameSpace+"suggestCommentCountAll", params);
	}
	
	public Object suggestUpdate(String queryId, Object params) {
		return super.suggestUpdate(MapperNameSpace+"suggestUpdate", params);
	}

	public Object suggestDelete(String queryId, Object params) {
		return super.suggestDelete(MapperNameSpace+"suggestDelete", params);
	}
	
	public Object suggestCommentDelete(String queryId, Object params) {
		return super.suggestCommentDelete(MapperNameSpace+"suggestCommentDelete", params);
	}
	
	public Article suggestSelect(String queryId, Object params) {
		return super.suggestSelect(MapperNameSpace+"suggestSelect", params);
	}
	
	public List suggestSelectAll(String queryId, Object params) {		
		return super.suggestSelectAll(MapperNameSpace+"suggestSelectAll", params);
	}
	
	public List suggestCommentSelectAll(String queryId, Object params) {		
		return super.suggestCommentSelectAll(MapperNameSpace+"suggestCommentSelectAll", params);
	}
	
	public Object suggestUpdateCount(String queryId, Object params) {
		return super.suggestUpdateCount(MapperNameSpace+"suggestUpdateCount", params);
	}
	
	// review
	
	public Object reviewInsert(String queryId, Object params) {
		return super.reviewInsert(MapperNameSpace+"reviewInsert", params);
	}
	
	public Object reviewCommentInsert(String queryId, Object params) {
		return super.reviewCommentInsert(MapperNameSpace+"reviewCommentInsert", params);
	}
	
	public Object reviewCountAll(String queryId, Object params) {
		return super.reviewCountAll(MapperNameSpace+"reviewCountAll", params);
	}
	
	public Object reviewCommentCountAll(String queryId, Object params) {
		return super.reviewCommentCountAll(MapperNameSpace+"reviewCommentCountAll", params);
	}
	
	public Object reviewUpdate(String queryId, Object params) {
		return super.reviewUpdate(MapperNameSpace+"reviewUpdate", params);
	}
	
	public Object reviewUpdateImage(String queryId, Object params) {
		return super.reviewUpdateImage(MapperNameSpace+"reviewUpdateImage", params);
	}
	
	public Object reviewUpdateImage1(String queryId, Object params) {
		return super.reviewUpdateImage(MapperNameSpace+"reviewUpdateImage1", params);
	}
	
	public Object reviewUpdateImage2(String queryId, Object params) {
		return super.reviewUpdateImage(MapperNameSpace+"reviewUpdateImage2", params);
	}
	
	public Object reviewUpdateImage3(String queryId, Object params) {
		return super.reviewUpdateImage(MapperNameSpace+"reviewUpdateImage3", params);
	}

	public Object reviewDelete(String queryId, Object params) {
		return super.reviewDelete(MapperNameSpace+"reviewDelete", params);
	}
	
	public Object reviewCommentDelete(String queryId, Object params) {
		return super.reviewCommentDelete(MapperNameSpace+"reviewCommentDelete", params);
	}
	
	public Article reviewSelect(String queryId, Object params) {
		return super.reviewSelect(MapperNameSpace+"reviewSelect", params);
	}
	
	public List reviewSelectAll(String queryId, Object params) {		
		return super.reviewSelectAll(MapperNameSpace+"reviewSelectAll", params);
	}
	
	public List reviewCommentSelectAll(String queryId, Object params) {		
		return super.reviewCommentSelectAll(MapperNameSpace+"reviewCommentSelectAll", params);
	}
	
	public Object reviewUpdateCount(String queryId, Object params) {
		return super.reviewUpdateCount(MapperNameSpace+"reviewUpdateCount", params);
	}
	
	public Object reviewRecommendUp(String queryId, Object params) {
		return super.reviewRecommendUp(MapperNameSpace+"reviewRecommendUp", params);
	}
	
	public Object reviewRecommendDown(String queryId, Object params) {
		return super.reviewRecommendDown(MapperNameSpace+"reviewRecommendDown", params);
	}
	
	public Object recommendSelect(String queryId, Object params) {
		return super.recommendSelect(MapperNameSpace+"recommendSelect", params);
	}
	
	public Object recommendInsert(String queryId, Object params) {
		return super.recommendInsert(MapperNameSpace+"recommendInsert", params);
	}
	
	public Object recommendDelete(String queryId, Object params) {
		return super.recommendDelete(MapperNameSpace+"recommendDelete", params);
	}
	
}
