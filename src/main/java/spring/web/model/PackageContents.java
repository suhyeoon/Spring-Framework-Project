package spring.web.model;

import org.springframework.web.multipart.MultipartFile;

public class PackageContents {
	private int no;
	private String name;
	private String oldName;
	private String startDate;
	private String endDate;
	private int maxPrice;
	private int minPrice;
	private String contents;
	private String[] arrCont;
	private MultipartFile image;
	

	public PackageContents(){}


	public PackageContents(int no, String name, String oldName, String startDate, String endDate, int maxPrice,
			int minPrice, String contents, String[] arrCont, MultipartFile image) {
		super();
		this.no = no;
		this.name = name;
		this.oldName = oldName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.maxPrice = maxPrice;
		this.minPrice = minPrice;
		this.contents = contents;
		this.arrCont = arrCont;
		this.image = image;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getOldName() {
		return oldName;
	}


	public void setOldName(String oldName) {
		this.oldName = oldName;
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


	public int getMaxPrice() {
		return maxPrice;
	}


	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}


	public int getMinPrice() {
		return minPrice;
	}


	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String[] getArrCont() {
		return arrCont;
	}


	public void setArrCont(String[] arrCont) {
		this.arrCont = arrCont;
	}


	public MultipartFile getImage() {
		return image;
	}


	public void setImage(MultipartFile image) {
		this.image = image;
	}


	

	
}
