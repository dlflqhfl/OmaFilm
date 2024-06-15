package web.mybatis.vo;

public class ReserverVO {
	private int rsvr_code,u_code; //예매자 코드, 회원코드
	private String non_name,//비회원이름
	non_phone, //비회원 전화번호
	non_address, //비회원 주소
	non_postal_code, //비회원 우편번호
	non_email; //비회원 이메일
	
	public ReserverVO() {}

	public ReserverVO(int rsvr_code, int u_code, String non_name, String non_phone, String non_address,
			String non_postal_code, String non_email) {
		super();
		this.rsvr_code = rsvr_code;
		this.u_code = u_code;
		this.non_name = non_name;
		this.non_phone = non_phone;
		this.non_address = non_address;
		this.non_postal_code = non_postal_code;
		this.non_email = non_email;
	}

	int getRsvr_code() {
		return rsvr_code;
	}

	void setRsvr_code(int rsvr_code) {
		this.rsvr_code = rsvr_code;
	}

	int getU_code() {
		return u_code;
	}

	void setU_code(int u_code) {
		this.u_code = u_code;
	}

	String getNon_name() {
		return non_name;
	}

	void setNon_name(String non_name) {
		this.non_name = non_name;
	}

	String getNon_phone() {
		return non_phone;
	}

	void setNon_phone(String non_phone) {
		this.non_phone = non_phone;
	}

	String getNon_address() {
		return non_address;
	}

	void setNon_address(String non_address) {
		this.non_address = non_address;
	}

	String getNon_postal_code() {
		return non_postal_code;
	}

	void setNon_postal_code(String non_postal_code) {
		this.non_postal_code = non_postal_code;
	}

	String getNon_email() {
		return non_email;
	}

	void setNon_email(String non_email) {
		this.non_email = non_email;
	}
	
	
}
