package web.mybatis.vo;

public class PointItemVO {
	private String pi_code //포인트 코드
	, pi_amount //포인트 금액
	, pi_cotent; //포인트 지급 내용
	
	public PointItemVO() {}

	public PointItemVO(String pi_code, String pi_amount, String pi_cotent) {
		super();
		this.pi_code = pi_code;
		this.pi_amount = pi_amount;
		this.pi_cotent = pi_cotent;
	}

	String getPi_code() {
		return pi_code;
	}

	void setPi_code(String pi_code) {
		this.pi_code = pi_code;
	}

	String getPi_amount() {
		return pi_amount;
	}

	void setPi_amount(String pi_amount) {
		this.pi_amount = pi_amount;
	}

	String getPi_cotent() {
		return pi_cotent;
	}

	void setPi_cotent(String pi_cotent) {
		this.pi_cotent = pi_cotent;
	}
	
	
}
