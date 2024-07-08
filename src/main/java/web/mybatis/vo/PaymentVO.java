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
	

	@Override
	public String toString() {
		return "PaymentVO [p_code=" + p_code + ", u_code=" + u_code + ", p_ex_price=" + p_ex_price + ", p_tt_price="
				+ p_tt_price + ", p_status=" + p_status + ", p_no=" + p_no + ", cp_no=" + cp_no + ", p_method="
				+ p_method + ", p_time=" + p_time + ", p_content=" + p_content + "]";
	}



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

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getU_code() {
		return u_code;
	}

	public void setU_code(int u_code) {
		this.u_code = u_code;
	}

	public int getP_ex_price() {
		return p_ex_price;
	}

	public void setP_ex_price(int p_ex_price) {
		this.p_ex_price = p_ex_price;
	}

	public int getP_tt_price() {
		return p_tt_price;
	}

	public void setP_tt_price(int p_tt_price) {
		this.p_tt_price = p_tt_price;
	}

	public int getP_status() {
		return p_status;
	}

	public void setP_status(int p_status) {
		this.p_status = p_status;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getCp_no() {
		return cp_no;
	}

	public void setCp_no(String cp_no) {
		this.cp_no = cp_no;
	}

	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public String getP_time() {
		return p_time;
	}

	public void setP_time(String p_time) {
		this.p_time = p_time;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
}
