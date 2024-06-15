package web.mybatis.vo;

public class ReservationVO {
	private int p_code //예매번호
	, rsvr_code //예매자코드
	, rs_count //선택좌석개수
	, rs_status; //예매 상태
	private String rs_num //예매번호
	, s_code // 상영시간표 코드
	, rs_time; //예매시간
	
	public ReservationVO() {}

	public ReservationVO(int p_code, int rsvr_code, int rs_count, int rs_status, String rs_num, String s_code,
			String rs_time) {
		super();
		this.p_code = p_code;
		this.rsvr_code = rsvr_code;
		this.rs_count = rs_count;
		this.rs_status = rs_status;
		this.rs_num = rs_num;
		this.s_code = s_code;
		this.rs_time = rs_time;
	}

	int getP_code() {
		return p_code;
	}

	void setP_code(int p_code) {
		this.p_code = p_code;
	}

	int getRsvr_code() {
		return rsvr_code;
	}

	void setRsvr_code(int rsvr_code) {
		this.rsvr_code = rsvr_code;
	}

	int getRs_count() {
		return rs_count;
	}

	void setRs_count(int rs_count) {
		this.rs_count = rs_count;
	}

	int getRs_status() {
		return rs_status;
	}

	void setRs_status(int rs_status) {
		this.rs_status = rs_status;
	}

	String getRs_num() {
		return rs_num;
	}

	void setRs_num(String rs_num) {
		this.rs_num = rs_num;
	}

	String getS_code() {
		return s_code;
	}

	void setS_code(String s_code) {
		this.s_code = s_code;
	}

	String getRs_time() {
		return rs_time;
	}

	void setRs_time(String rs_time) {
		this.rs_time = rs_time;
	}
	
	
}
