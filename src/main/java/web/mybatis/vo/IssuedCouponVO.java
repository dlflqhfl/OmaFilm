package web.mybatis.vo;

public class IssuedCouponVO {
	private String cp_no,//쿠폰발급번호
	u_code,// 회원코드
	ci_code,// 쿠폰코드
	cp_date,// 발급날짜
	cp_use;// 사용날짜
	private int cp_status;// 상태
	
	public IssuedCouponVO() {}

	public IssuedCouponVO(String cp_no, String u_code, String ci_code, String cp_date, String cp_use, int cp_status) {
		super();
		this.cp_no = cp_no;
		this.u_code = u_code;
		this.ci_code = ci_code;
		this.cp_date = cp_date;
		this.cp_use = cp_use;
		this.cp_status = cp_status;
	}

	String getCp_no() {
		return cp_no;
	}

	void setCp_no(String cp_no) {
		this.cp_no = cp_no;
	}

	String getU_code() {
		return u_code;
	}

	void setU_code(String u_code) {
		this.u_code = u_code;
	}

	String getCi_code() {
		return ci_code;
	}

	void setCi_code(String ci_code) {
		this.ci_code = ci_code;
	}

	String getCp_date() {
		return cp_date;
	}

	void setCp_date(String cp_date) {
		this.cp_date = cp_date;
	}

	String getCp_use() {
		return cp_use;
	}

	void setCp_use(String cp_use) {
		this.cp_use = cp_use;
	}

	int getCp_status() {
		return cp_status;
	}

	void setCp_status(int cp_status) {
		this.cp_status = cp_status;
	}
	
	
}
