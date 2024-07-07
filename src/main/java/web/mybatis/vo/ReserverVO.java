package web.mybatis.vo;

public class ReserverVO {
	private int rsvr_code,u_code; //예매자 코드, 회원코드
	private String non_name,//비회원이름
	non_phone, //비회원 전화번호
	non_address, //비회원 주소
	non_postal_code, //비회원 우편번호
	non_email, //비회원 이메일
	non_pw,
	rsvr_time;
	
	private ReservationVO rvo;
	private PaymentVO pvo;
	private ScreeningScheduleVO ssvo;
	private SelectSeatVO svo;
	private MovieListVO mvo;
	public ReserverVO() {}
	@Override
	public String toString() {
		return "ReserverVO [rsvr_code=" + rsvr_code + ", u_code=" + u_code + ", non_name=" + non_name + ", non_phone="
				+ non_phone + ", non_address=" + non_address + ", non_postal_code=" + non_postal_code + ", non_email="
				+ non_email + ", non_pw=" + non_pw + ", rsvr_time=" + rsvr_time + ", rvo=" + rvo + ", pvo=" + pvo
				+ ", ssvo=" + ssvo + ", svo=" + svo + ", mvo=" + mvo + "]";
	}
	public int getRsvr_code() {
		return rsvr_code;
	}
	public void setRsvr_code(int rsvr_code) {
		this.rsvr_code = rsvr_code;
	}
	public int getU_code() {
		return u_code;
	}
	public void setU_code(int u_code) {
		this.u_code = u_code;
	}
	public String getNon_name() {
		return non_name;
	}
	public void setNon_name(String non_name) {
		this.non_name = non_name;
	}
	public String getNon_phone() {
		return non_phone;
	}
	public void setNon_phone(String non_phone) {
		this.non_phone = non_phone;
	}
	public String getNon_address() {
		return non_address;
	}
	public void setNon_address(String non_address) {
		this.non_address = non_address;
	}
	public String getNon_postal_code() {
		return non_postal_code;
	}
	public void setNon_postal_code(String non_postal_code) {
		this.non_postal_code = non_postal_code;
	}
	public String getNon_email() {
		return non_email;
	}
	public void setNon_email(String non_email) {
		this.non_email = non_email;
	}
	public String getNon_pw() {
		return non_pw;
	}
	public void setNon_pw(String non_pw) {
		this.non_pw = non_pw;
	}
	public String getRsvr_time() {
		return rsvr_time;
	}
	public void setRsvr_time(String rsvr_time) {
		this.rsvr_time = rsvr_time;
	}
	public ReservationVO getRvo() {
		return rvo;
	}
	public void setRvo(ReservationVO rvo) {
		this.rvo = rvo;
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
	public SelectSeatVO getSvo() {
		return svo;
	}
	public void setSvo(SelectSeatVO svo) {
		this.svo = svo;
	}
	public MovieListVO getMvo() {
		return mvo;
	}
	public void setMvo(MovieListVO mvo) {
		this.mvo = mvo;
	}

	
	
}
