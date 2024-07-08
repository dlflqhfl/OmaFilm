package main.java.web.mybatis.vo;

public class AudienceVO {
	private int a_code //관객코드 인덱스
	, a_price; //관객 가격
	private String a_name; //관객구분
	
	public AudienceVO() {}

	public AudienceVO(int a_code, int a_price, String a_name) {
		super();
		this.a_code = a_code;
		this.a_price = a_price;
		this.a_name = a_name;
	}

	public int getA_code() {
		return a_code;
	}

	public void setA_code(int a_code) {
		this.a_code = a_code;
	}

	public int getA_price() {
		return a_price;
	}

	public void setA_price(int a_price) {
		this.a_price = a_price;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
}
