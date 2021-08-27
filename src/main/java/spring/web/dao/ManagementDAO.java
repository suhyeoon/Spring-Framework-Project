package spring.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.web.model.Management;
import spring.web.model.Reservation;

@Repository("managementDAO")
public class ManagementDAO extends AbstractManagementDAO {
	
	private static final String MapperNameSpace = "spring.web.mapper.ManagementMapper.";

	public List selectPackageContentsAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectPackageContentsAll", params);
	}
	
	public List selectPackageNameAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectPackageNameAll", params);
	}
	
	public List selectCodeBigAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectCodeBigAll", params);
	}
	
	public List selectCodeSmallAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectCodeSmallAll", params);
	}
	
	public List selectMemberAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectMemberAll", params);
	}
	
	public List selectRoomAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectRoomAll", params);
	}
	
	public List selectPackageAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectPackageAll", params);
	}
	
	public List selectReservationAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectReservationAll", params);
	}
	
	public List selectStayAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectStayAll", params);
	}
	
	public List selectStayHistoryAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectStayHistoryAll", params);
	}
	
	public List selectStayDeletedAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectStayDeletedAll", params);
	}
	
	public List selectRoomCodeSmallAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectRoomCodeSmallAll", params);
	}
	
	public List selectMemberGradeAll(String queryId, Object params) {
		return super.selectAll(MapperNameSpace+"selectMemberGradeAll", params);
	}
	
	public Management selectCodeBig(String queryId, Object params) {
		return super.select(MapperNameSpace+"selectCodeBig", params);
	}
	
	public Management selectCodeSmall(String queryId, Object params) {
		return super.select(MapperNameSpace+"selectCodeSmall", params);
	}
	
	public Reservation selectReservation(String queryId, Object params) {
		return super.select_res(MapperNameSpace+"selectReservation", params);
	}
	
	public Reservation selectStay(String queryId, Object params) {
		return super.select_res(MapperNameSpace+"selectStay", params);
	}
	
	public Reservation selectStayHistory(String queryId, Object params) {
		return super.select_res(MapperNameSpace+"selectStayHistory", params);
	}
	
	public Reservation selectStayDeleted(String queryId, Object params) {
		return super.select_res(MapperNameSpace+"selectStayDeleted", params);
	}
	
	public Object updateCodeBig(String queryId, Object params) {
		return super.update(MapperNameSpace+"updateCodeBig", params);
	}
	
	public Object deleteCodeBig(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteCodeBig", params);
	}
	
	public Object insertCodeBig(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertCodeBig", params);
	}
	
	public Object insertPackageContents(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertPackageContents", params);
	}
	
	public Object updatePackageContents(String queryId, Object params) {
		return super.update(MapperNameSpace+"updatePackageContents", params);
	}
	
	public Object deletePackageContents(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deletePackageContents", params);
	}
	
	public Object updateCodeSmall(String queryId, Object params) {
		return super.update(MapperNameSpace+"updateCodeSmall", params);
	}
	
	public Object deleteCodeSmall(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteCodeSmall", params);
	}
	
	public Object insertCodeSmall(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertCodeSmall", params);
	}
	
	public Object updateMember(String queryId, Object params) {
		return super.update(MapperNameSpace+"updateMember", params);
	}
	
	public Object deleteMember(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteMember", params);
	}
	
	public Object insertRoom(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertRoom", params);
	}
	
	public Object updateRoom(String queryId, Object params) {
		return super.update(MapperNameSpace+"updateRoom", params);
	}
	
	public Object deleteRoom(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteRoom", params);
	}

	public Object insertPackage(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertPackage", params);
	}
	
	public Object updatePackage(String queryId, Object params) {
		return super.update(MapperNameSpace+"updatePackage", params);
	}
	
	public Object deletePackage(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deletePackage", params);
	}
	
	public Object insertReservation(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertReservation", params);
	}
	
	public Object insertStay(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertStay", params);
	}
	
	public Object insertStayHistory(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertStayHistory", params);
	}
	
	public Object insertStayDeleted(String queryId, Object params) {
		return super.insert(MapperNameSpace+"insertStayDeleted", params);
	}
	
	public Object deleteReservation(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteReservation", params);
	}
	
	public Object deleteStay(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteStay", params);
	}
	
	public Object deleteStayHistory(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteStayHistory", params);
	}
	
	public Object deleteStayDeleted(String queryId, Object params) {
		return super.delete(MapperNameSpace+"deleteStayDeleted", params);
	}
	
	public Object searchCount(String queryId, Object params) {
		return super.searchCountAll(MapperNameSpace+"searchCount", params);
	}
	
	public Object searchCountTitleContents(String queryId, Object params) {
		return super.searchCountAll(MapperNameSpace+"searchCount"+queryId, params);
	}
	
	
}
