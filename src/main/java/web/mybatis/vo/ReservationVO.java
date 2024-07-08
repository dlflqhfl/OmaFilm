package web.mybatis.vo;

public class ReservationVO {
	private int p_code //예매번호
	, rsvr_code //예매자코드
	, rs_count //선택좌석개수
	, rs_status; //예매 상태
	
	private String ss_code, rs_num //예매번호
	, s_code // 상영시간표 코드
	, rs_time //예매시간
	, rs_cancel_time; //취소시간
	
	private PaymentVO pvo;
	private ScreeningScheduleVO ssvo;
	
	public ReservationVO() {}

	public ReservationVO(int p_code, int rsvr_code, int rs_count, int rs_status, String ss_code, String rs_num,
			String s_code, String rs_time, PaymentVO pvo, ScreeningScheduleVO ssvo) {
		super();
		this.p_code = p_code;
		this.rsvr_code = rsvr_code;
		this.rs_count = rs_count;
		this.rs_status = rs_status;
		this.ss_code = ss_code;
		this.rs_num = rs_num;
		this.s_code = s_code;
		this.rs_time = rs_time;
		this.pvo = pvo;
		this.ssvo = ssvo;
	}

	@Override
	public String toString() {
		return "ReservationVO [p_code=" + p_code + ", rsvr_code=" + rsvr_code + ", rs_count=" + rs_count
				+ ", rs_status=" + rs_status + ", ss_code=" + ss_code + ", rs_num=" + rs_num + ", s_code=" + s_code
				+ ", rs_time=" + rs_time + ", pvo=" + pvo + ", ssvo=" + ssvo + "]";
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getRsvr_code() {
		return rsvr_code;
	}

	public void setRsvr_code(int rsvr_code) {
		this.rsvr_code = rsvr_code;
	}

	public int getRs_count() {
		return rs_count;
	}

	public void setRs_count(int rs_count) {
		this.rs_count = rs_count;
	}

	public int getRs_status() {
		return rs_status;
	}

	public void setRs_status(int rs_status) {
		this.rs_status = rs_status;
	}

	public String getSs_code() {
		return ss_code;
	}

	public void setSs_code(String ss_code) {
		this.ss_code = ss_code;
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

	public String getRs_time() {
		return rs_time;
	}

	public void setRs_time(String rs_time) {
		this.rs_time = rs_time;
	}

	public PaymentVO getPvo() {
		return pvo;
	}

	public void setPvo(PaymentVO pvo) {
		this.pvo = pvo;
	}

	public ScreeningScheduleVO getSsvo() {
		return ssvo;
	}

	public void setSsvo(ScreeningScheduleVO ssvo) {
		this.ssvo = ssvo;
	}

	public String getRs_cancel_time() {
		return rs_cancel_time;
	}

	public void setRs_cancel_time(String rs_cancel_time) {
		this.rs_cancel_time = rs_cancel_time;
	}

	
	
	
	
}
