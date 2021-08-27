package spring.web.model;

public class Management_Sub {
	private String codeSmall;
	private String nameSmall;


	public Management_Sub(){}


	public Management_Sub(String codeSmall, String nameSmall) {
		super();
		this.codeSmall = codeSmall;
		this.nameSmall = nameSmall;
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

}
