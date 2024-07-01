package web.mybatis.vo;

public class CouponItemVO {
	private String ci_code// 쿠폰코드
	, ci_discount// 할인내용
	, ci_content//쿠폰내용
	, ci_time; //만료일자
	
	public CouponItemVO() {}

	public CouponItemVO(String ci_code, String ci_discount, String ci_content) {
		super();
		this.ci_code = ci_code;
		this.ci_discount = ci_discount;
		this.ci_content = ci_content;
	}

	public String getCi_code() {
		return ci_code;
	}

	public void setCi_code(String ci_code) {
		this.ci_code = ci_code;
	}

	public String getCi_discount() {
		return ci_discount;
	}

	public void setCi_discount(String ci_discount) {
		this.ci_discount = ci_discount;
	}

	public String getCi_content() {
		return ci_content;
	}

	public void setCi_content(String ci_content) {
		this.ci_content = ci_content;
	}

	public String getCi_time() {
		return ci_time;
	}

	public void setCi_time(String ci_time) {
		this.ci_time = ci_time;
	}
	
	
}
