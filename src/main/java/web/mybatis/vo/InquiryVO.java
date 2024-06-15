package web.mybatis.vo;

public class InquiryVO {
	private int iq_idx,u_code; //문의번호, 회원코드
	private String iq_title, //문의 제목
	iq_content, //문의 내용
	iq_time; //문의 시간
	
	public InquiryVO() {}

	public InquiryVO(int iq_idx, int u_code, String iq_title, String iq_content, String iq_time) {
		super();
		this.iq_idx = iq_idx;
		this.u_code = u_code;
		this.iq_title = iq_title;
		this.iq_content = iq_content;
		this.iq_time = iq_time;
	}

	int getIq_idx() {
		return iq_idx;
	}

	void setIq_idx(int iq_idx) {
		this.iq_idx = iq_idx;
	}

	int getU_code() {
		return u_code;
	}

	void setU_code(int u_code) {
		this.u_code = u_code;
	}

	String getIq_title() {
		return iq_title;
	}

	void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}

	String getIq_content() {
		return iq_content;
	}

	void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}

	String getIq_time() {
		return iq_time;
	}

	void setIq_time(String iq_time) {
		this.iq_time = iq_time;
	}
	
	
}
