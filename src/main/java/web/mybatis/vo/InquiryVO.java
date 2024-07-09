package web.mybatis.vo;

public class InquiryVO {
	private int iq_idx,u_code; //문의번호, 회원코드
	private String iq_title, //문의 제목
	iq_content, //문의 내용
	iq_time; //문의 시간
	
	private IqCommentVO icvo;
	
	public InquiryVO() {}

	public InquiryVO(int iq_idx, int u_code, String iq_title, String iq_content, String iq_time) {
		super();
		this.iq_idx = iq_idx;
		this.u_code = u_code;
		this.iq_title = iq_title;
		this.iq_content = iq_content;
		this.iq_time = iq_time;
	}

	public int getIq_idx() {
		return iq_idx;
	}

	public void setIq_idx(int iq_idx) {
		this.iq_idx = iq_idx;
	}

	public int getU_code() {
		return u_code;
	}

	public void setU_code(int u_code) {
		this.u_code = u_code;
	}

	public String getIq_title() {
		return iq_title;
	}

	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}

	public String getIq_content() {
		return iq_content;
	}

	public void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}

	public String getIq_time() {
		return iq_time;
	}

	public void setIq_time(String iq_time) {
		this.iq_time = iq_time;
	}

	public IqCommentVO getIcvo() {
		return icvo;
	}

	public void setIcvo(IqCommentVO icvo) {
		this.icvo = icvo;
	}

	
	
	
}
