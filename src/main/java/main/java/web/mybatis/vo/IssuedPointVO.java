package main.java.web.mybatis.vo;

public class IssuedPointVO {
	private String p_no,// 포인트 발급 번호
	u_code, //회원코드
	pi_code, //포인트 코드
	p_date, //날짜
	p_before, //회원지급 전 잔여포인트
	p_after; //회원 지급후 잔여포인트
	
	public IssuedPointVO() {}

	public IssuedPointVO(String p_no, String u_code, String pi_code, String p_date, String p_before, String p_after) {
		super();
		this.p_no = p_no;
		this.u_code = u_code;
		this.pi_code = pi_code;
		this.p_date = p_date;
		this.p_before = p_before;
		this.p_after = p_after;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getU_code() {
		return u_code;
	}

	public void setU_code(String u_code) {
		this.u_code = u_code;
	}

	public String getPi_code() {
		return pi_code;
	}

	public void setPi_code(String pi_code) {
		this.pi_code = pi_code;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public String getP_before() {
		return p_before;
	}

	public void setP_before(String p_before) {
		this.p_before = p_before;
	}

	public String getP_after() {
		return p_after;
	}

	public void setP_after(String p_after) {
		this.p_after = p_after;
	}

}
