package web.mybatis.vo;

public class CouponItemVO {
	private String ci_code// 쿠폰코드
	, ci_discount// 할인내용
	,ci_content;//쿠폰내용
	
	public CouponItemVO() {}

	public CouponItemVO(String ci_code, String ci_discount, String ci_content) {
		super();
		this.ci_code = ci_code;
		this.ci_discount = ci_discount;
		this.ci_content = ci_content;
	}

	String getCi_code() {
		return ci_code;
	}

	void setCi_code(String ci_code) {
		this.ci_code = ci_code;
	}

	String getCi_discount() {
		return ci_discount;
	}

	void setCi_discount(String ci_discount) {
		this.ci_discount = ci_discount;
	}

	String getCi_content() {
		return ci_content;
	}

	void setCi_content(String ci_content) {
		this.ci_content = ci_content;
	}
	
	
}
