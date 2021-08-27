package spring.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.web.model.Reservation;

@Repository("reservationDAO")
public class ReservationDAO extends AbstractReservationDAO {
	
	private static final String MapperNameSpace = "spring.web.mapper.ReservationMapper.";
	
	public Reservation selectRoom(String queryId, Object params) {
		return super.selectRoom(MapperNameSpace+"selectRoom", params);
	}
	
	public Reservation selectReservationDetail(String queryId, Object params) {
		return super.selectReservationDetail(MapperNameSpace+"selectReservationDetail", params);
	}
	
	public Object roomPrice(String queryId, Object params) {
		return super.roomPrice(MapperNameSpace+"roomPrice", params);
	}
	
	public Object packagePrice(String queryId, Object params) {
		return super.packagePrice(MapperNameSpace+"packagePrice", params);
	}
	
	public Object insertReservation(String queryId, Object params) {
		return super.insertReservation(MapperNameSpace+"insertReservation", params);
	}
	
	public List selectRoomAll(String queryId, Object params) {		
		return super.selectRoomAll(MapperNameSpace+"selectRoomAll", params);
	}
	
	public List selectRoomType(String queryId, Object params) {		
		return super.selectRoomType(MapperNameSpace+"selectRoomType", params);
	}
	
	public List selectPackageAll(String queryId, Object params) {		
		return super.selectPackageAll(MapperNameSpace+"selectPackageAll", params);
	}
	
	public List selectPackageType(String queryId, Object params) {		
		return super.selectPackageType(MapperNameSpace+"selectPackageType", params);
	}
	
	public List selectReservation(String queryId, Object params) {		
		return super.selectReservation(MapperNameSpace+"selectReservation", params);
	}
	
	public Object reservationCancel(String queryId, Object params) {
		return super.reservationCancel(MapperNameSpace+"reservationCancel", params);
	}
	
}
