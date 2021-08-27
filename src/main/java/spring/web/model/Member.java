package spring.web.model;

import java.util.Date;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String grade;
	private String addrNo;
	private String addr;
	private String tel;
	private String gender;
	private String email;
	private Date joindate;
	private int mileage;
	private boolean dropped;

	public Member(String id, String pw){
		this.id = id;
		this.pw = pw;
	};

	public Member(){}

	public Member(String id, String pw, String name, String grade, String addrNo, String addr, String tel, String gender,
			String email, Date joindate, int mileage, boolean dropped) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.grade = grade;
		this.addrNo = addrNo;
		this.addr = addr;
		this.tel = tel;
		this.gender = gender;
		this.email = email;
		this.joindate = joindate;
		this.mileage = mileage;
		this.dropped = dropped;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddrNo() {
		return addrNo;
	}

	public void setAddrNo(String addrNo) {
		this.addrNo = addrNo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
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
	};
	
	
}
