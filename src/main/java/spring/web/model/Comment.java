package spring.web.model;

public class Comment {
	private int no;
	private int bNo;
	private String writer;
	private String contents;
	private String uploadDate;
	private boolean visible;

	public Comment(){}

	public Comment(int no, int bNo, String writer, String contents, String uploadDate, boolean visible) {
		super();
		this.no = no;
		this.bNo = bNo;
		this.writer = writer;
		this.contents = contents;
		this.uploadDate = uploadDate;
		this.visible = visible;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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
	};
	
	
	
}
