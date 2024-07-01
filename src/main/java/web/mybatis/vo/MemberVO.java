package web.mybatis.vo;

public class MemberVO {
	private int u_code; //회원번호
	private String u_id, //아이디
	u_pw,// 비밀번호
	u_authority,// 권한
	u_social,// 소셜여부
	u_name,// 이름
	u_phone,// 전화번호
	u_postcode,// 우편번호
	u_address,// 주소
	u_email,// 이메일
	u_email_rcv,// 이메일 수신여부
	u_birth,// 생년월일
	u_status,// 상태
	u_join_date,// 가입일
	u_none;

	public MemberVO() {}

	public MemberVO( String u_id, String u_pw, String u_authority, String u_social, String u_name, String u_phone, String u_postcode, String u_address, String u_email, String u_email_rcv, String u_birth, String u_status, String u_join_date, String u_none) {
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_authority = u_authority;
		this.u_social = u_social;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_postcode = u_postcode;
		this.u_address = u_address;
		this.u_email = u_email;
		this.u_email_rcv = u_email_rcv;
		this.u_birth = u_birth;
		this.u_status = u_status;
		this.u_join_date = u_join_date;
		this.u_none = u_none;
	}

	public int getU_code() {
		return u_code;
	}

	public void setU_code(int u_code) {
		this.u_code = u_code;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_authority() {
		return u_authority;
	}

	public void setU_authority(String u_authority) {
		this.u_authority = u_authority;
	}

	public String getU_social() {
		return u_social;
	}

	public void setU_social(String u_social) {
		this.u_social = u_social;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_postcode() {
		return u_postcode;
	}

	public void setU_postcode(String u_postcode) {
		this.u_postcode = u_postcode;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_email_rcv() {
		return u_email_rcv;
	}

	public void setU_email_rcv(String u_email_rcv) {
		this.u_email_rcv = u_email_rcv;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}

	public String getU_join_date() {
		return u_join_date;
	}

	public void setU_join_date(String u_join_date) {
		this.u_join_date = u_join_date;
	}

	public String getU_none() {
		return u_none;
	}

	public void setU_none(String u_none) {
		this.u_none = u_none;
	}
}
