package spring.web.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class Article {
	private int no;
	private String writer;
	private String title;
	private String contents;
	private int hits;
	private double grade;
	private int recommend;
	private String image;
	private String image1;
	private String image2;
	private String image3;
	private MultipartFile eventImg;
	private List<MultipartFile> images;
	private String uploadDate;
	private boolean visible;
	private boolean secret;
	private String category;
	private boolean answer;
	private String startDate;
	private String endDate;
	private boolean isClosed;

	public Article(){}

	public Article(int no, String writer, String title, String contents, int hits, double grade, int recommend,
			String image, String image1, String image2, String image3, List<MultipartFile> images,
			List<MultipartFile> img, String uploadDate, boolean visible, boolean secret, String category,
			boolean answer, String startDate, String endDate, boolean isClosed, MultipartFile img1, MultipartFile img2,
			MultipartFile img3) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.hits = hits;
		this.grade = grade;
		this.recommend = recommend;
		this.image = image;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.images = images;
		this.uploadDate = uploadDate;
		this.visible = visible;
		this.secret = secret;
		this.category = category;
		this.answer = answer;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isClosed = isClosed;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public int getHits() {
		return hits;
	}



	public void setHits(int hits) {
		this.hits = hits;
	}



	public double getGrade() {
		return grade;
	}



	public void setGrade(double grade) {
		this.grade = grade;
	}



	public int getRecommend() {
		return recommend;
	}



	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	public String getUploadDate() {
		return uploadDate;
	}



	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}



	public boolean isVisible() {
		return visible;
	}



	public void setVisible(boolean visible) {
		this.visible = visible;
	}



	public boolean isSecret() {
		return secret;
	}



	public void setSecret(boolean secret) {
		this.secret = secret;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public boolean isAnswer() {
		return answer;
	}



	public void setAnswer(boolean answer) {
		this.answer = answer;
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



	public boolean isClosed() {
		return isClosed;
	}



	public void setClosed(boolean isClosed) {
		this.isClosed = isClosed;
	}


	public List<MultipartFile> getImages() {
		return images;
	}


	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}


	public String getImage1() {
		return image1;
	}


	public void setImage1(String image1) {
		this.image1 = image1;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public String getImage3() {
		return image3;
	}


	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public MultipartFile getEventImg() {
		return eventImg;
	}

	public void setEventImg(MultipartFile eventImg) {
		this.eventImg = eventImg;
	}

}
