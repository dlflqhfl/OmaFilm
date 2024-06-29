package web.mybatis.vo;

public class SelectSeatVO {
	private int idx //인덱스
	, p_code //결제코드
	,a_code; //관객코드
	private String rs_num //예매번호
	, s_code; //좌석코드
	
	public SelectSeatVO() {}
	
	

	@Override
	public String toString() {
		return "SelectSeatVO [idx=" + idx + ", p_code=" + p_code + ", a_code=" + a_code + ", rs_num=" + rs_num
				+ ", s_code=" + s_code + "]";
	}


	public SelectSeatVO(int idx, int p_code, int a_code, String rs_num, String s_code) {
		super();
		this.idx = idx;
		this.p_code = p_code;
		this.a_code = a_code;
		this.rs_num = rs_num;
		this.s_code = s_code;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getA_code() {
		return a_code;
	}

	public void setA_code(int a_code) {
		this.a_code = a_code;
	}

	public String getRs_num() {
		return rs_num;
	}

	public void setRs_num(String rs_num) {
		this.rs_num = rs_num;
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
}
