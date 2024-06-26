package web.mybatis.vo;

public class PaymentVO {
	private int p_code //결제 코드
	,u_code //회원코드
	,p_ex_price //할인 전 금액
	,p_tt_price //할인 후 금액
	, p_status; //결제 상태
	private String p_no //포인트발급번호 
	, cp_no //쿠폰 발급번호
	, p_method //결제수단
	, p_time // 결제시간
	, p_content; //결제 내용
	
	public PaymentVO() {}

	public PaymentVO(int p_code, int u_code, int p_ex_price, int p_tt_price, int p_status, String p_no, String cp_no,
			String p_method, String p_time, String p_content) {
		super();
		this.p_code = p_code;
		this.u_code = u_code;
		this.p_ex_price = p_ex_price;
		this.p_tt_price = p_tt_price;
		this.p_status = p_status;
		this.p_no = p_no;
		this.cp_no = cp_no;
		this.p_method = p_method;
		this.p_time = p_time;
		this.p_content = p_content;
	}

	int getP_code() {
		return p_code;
	}

	void setP_code(int p_code) {
		this.p_code = p_code;
	}

	int getU_code() {
		return u_code;
	}

	void setU_code(int u_code) {
		this.u_code = u_code;
	}

	int getP_ex_price() {
		return p_ex_price;
	}

	void setP_ex_price(int p_ex_price) {
		this.p_ex_price = p_ex_price;
	}

	int getP_tt_price() {
		return p_tt_price;
	}

	void setP_tt_price(int p_tt_price) {
		this.p_tt_price = p_tt_price;
	}

	int getP_status() {
		return p_status;
	}

	void setP_status(int p_status) {
		this.p_status = p_status;
	}

	String getP_no() {
		return p_no;
	}

	void setP_no(String p_no) {
		this.p_no = p_no;
	}

	String getCp_no() {
		return cp_no;
	}

	void setCp_no(String cp_no) {
		this.cp_no = cp_no;
	}

	String getP_method() {
		return p_method;
	}

	void setP_method(String p_method) {
		this.p_method = p_method;
	}

	String getP_time() {
		return p_time;
	}

	void setP_time(String p_time) {
		this.p_time = p_time;
	}

	String getP_content() {
		return p_content;
	}

	void setP_content(String p_content) {
		this.p_content = p_content;
	}
	
}
