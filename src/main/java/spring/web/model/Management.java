package spring.web.model;

import java.util.List;

public class Management {
	private String codeBig;
	private String nameBig;
	private String codeSmall;
	private String nameSmall;
	private String id;
	private String name;
	private String addr;
	private String gender;
	private String tel;
	private String email;
	private int mileage;
	private boolean dropped;
	private String status;
	private String strNo;
	private String roomNo;
	private int floor;
	private String roomGrade;
	private String roomLevel;
	private String roomType;
	private String roomView;
	private String roomSize;
	private int price;
	private String packageNo;
	private String startDate;
	private String endDate;
	private List<Management_Sub> sub;

	public Management(){}

	public Management(String codeBig, String nameBig, String codeSmall, String nameSmall, String id, String name,
			String addr, String gender, String tel, String email, int mileage, boolean dropped, String status,
			String strNo, String roomNo, int floor, String roomGrade, String roomLevel, String roomType,
			String roomView, String roomSize, int price, String packageNo, String startDate, String endDate,
			List<Management_Sub> sub) {
		super();
		this.codeBig = codeBig;
		this.nameBig = nameBig;
		this.codeSmall = codeSmall;
		this.nameSmall = nameSmall;
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.gender = gender;
		this.tel = tel;
		this.email = email;
		this.mileage = mileage;
		this.dropped = dropped;
		this.status = status;
		this.strNo = strNo;
		this.roomNo = roomNo;
		this.floor = floor;
		this.roomGrade = roomGrade;
		this.roomLevel = roomLevel;
		this.roomType = roomType;
		this.roomView = roomView;
		this.roomSize = roomSize;
		this.price = price;
		this.packageNo = packageNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.sub = sub;
	}

	public String getCodeBig() {
		return codeBig;
	}

	public void setCodeBig(String codeBig) {
		this.codeBig = codeBig;
	}

	public String getNameBig() {
		return nameBig;
	}

	public void setNameBig(String nameBig) {
		this.nameBig = nameBig;
	}

	public String getCodeSmall() {
		return codeSmall;
	}

	public void setCodeSmall(String codeSmall) {
		this.codeSmall = codeSmall;
	}

	public String getNameSmall() {
		return nameSmall;
	}

	public void setNameSmall(String nameSmall) {
		this.nameSmall = nameSmall;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public boolean isDropped() {
		return dropped;
	}

	public void setDropped(boolean dropped) {
		this.dropped = dropped;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStrNo() {
		return strNo;
	}

	public void setStrNo(String strNo) {
		this.strNo = strNo;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getRoomGrade() {
		return roomGrade;
	}

	public void setRoomGrade(String roomGrade) {
		this.roomGrade = roomGrade;
	}

	public String getRoomLevel() {
		return roomLevel;
	}

	public void setRoomLevel(String roomLevel) {
		this.roomLevel = roomLevel;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomView() {
		return roomView;
	}

	public void setRoomView(String roomView) {
		this.roomView = roomView;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(String packageNo) {
		this.packageNo = packageNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<Management_Sub> getSub() {
		return sub;
	}

	public void setSub(List<Management_Sub> sub) {
		this.sub = sub;
	}

}
