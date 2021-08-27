package spring.web.model;

public class Reservation {
	private int no;
	private String id;
	private String roomNo;
	private int floor;
	private String roomGrade;
	private String roomLevel;
	private String roomType;
	private String roomView;
	private String roomSize;
	private String startDate;
	private String endDate;
	private String reservationDate;
	private String packageNo;
	private String name;
	private String memo;
	private String card;
	private String cardType;
	private String cardNum;
	private String cardEndDate;
	private int dateCnt;
	private String strBed;
	private boolean addBed;
	private int adultBreakfast;
	private int childBreakfast;
	private int price;
	private String sPrice;
	private int adultCnt;
	private int childCnt;
	private boolean isCanceled;
	private String status;
	private String beforeTable;

	public Reservation(){}

	public Reservation(int no, String id, String roomNo, int floor, String roomGrade, String roomLevel, String roomType,
			String roomView, String roomSize, String startDate, String endDate, String reservationDate,
			String packageNo, String name, String memo, String card, String cardType, String cardNum,
			String cardEndDate, int dateCnt, String strBed, boolean addBed, int adultBreakfast, int childBreakfast,
			int price, String sPrice, int adultCnt, int childCnt, boolean isCanceled, String status,
			String beforeTable) {
		super();
		this.no = no;
		this.id = id;
		this.roomNo = roomNo;
		this.floor = floor;
		this.roomGrade = roomGrade;
		this.roomLevel = roomLevel;
		this.roomType = roomType;
		this.roomView = roomView;
		this.roomSize = roomSize;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservationDate = reservationDate;
		this.packageNo = packageNo;
		this.name = name;
		this.memo = memo;
		this.card = card;
		this.cardType = cardType;
		this.cardNum = cardNum;
		this.cardEndDate = cardEndDate;
		this.dateCnt = dateCnt;
		this.strBed = strBed;
		this.addBed = addBed;
		this.adultBreakfast = adultBreakfast;
		this.childBreakfast = childBreakfast;
		this.price = price;
		this.sPrice = sPrice;
		this.adultCnt = adultCnt;
		this.childCnt = childCnt;
		this.isCanceled = isCanceled;
		this.status = status;
		this.beforeTable = beforeTable;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(String packageNo) {
		this.packageNo = packageNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getCardEndDate() {
		return cardEndDate;
	}

	public void setCardEndDate(String cardEndDate) {
		this.cardEndDate = cardEndDate;
	}

	public int getDateCnt() {
		return dateCnt;
	}

	public void setDateCnt(int dateCnt) {
		this.dateCnt = dateCnt;
	}

	public String getStrBed() {
		return strBed;
	}

	public void setStrBed(String strBed) {
		this.strBed = strBed;
	}

	public boolean isAddBed() {
		return addBed;
	}

	public void setAddBed(boolean addBed) {
		this.addBed = addBed;
	}

	public int getAdultBreakfast() {
		return adultBreakfast;
	}

	public void setAdultBreakfast(int adultBreakfast) {
		this.adultBreakfast = adultBreakfast;
	}

	public int getChildBreakfast() {
		return childBreakfast;
	}

	public void setChildBreakfast(int childBreakfast) {
		this.childBreakfast = childBreakfast;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getsPrice() {
		return sPrice;
	}

	public void setsPrice(String sPrice) {
		this.sPrice = sPrice;
	}

	public int getAdultCnt() {
		return adultCnt;
	}

	public void setAdultCnt(int adultCnt) {
		this.adultCnt = adultCnt;
	}

	public int getChildCnt() {
		return childCnt;
	}

	public void setChildCnt(int childCnt) {
		this.childCnt = childCnt;
	}

	public boolean isCanceled() {
		return isCanceled;
	}

	public void setCanceled(boolean isCanceled) {
		this.isCanceled = isCanceled;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBeforeTable() {
		return beforeTable;
	}

	public void setBeforeTable(String beforeTable) {
		this.beforeTable = beforeTable;
	}

	

	
	
}
