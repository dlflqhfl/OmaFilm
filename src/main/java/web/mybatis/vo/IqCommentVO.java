package web.mybatis.vo;

public class IqCommentVO {
	private int comm_idx, iq_idx; //댓글 번호, 문의번호
	private String comm_title,//댓글 제목
	comm_content, //댓글 내용
	comm_time; //댓글 작성 시간
	
	public IqCommentVO() {}

	public IqCommentVO(int comm_idx, int iq_idx, String comm_title, String comm_content, String comm_time) {
		super();
		this.comm_idx = comm_idx;
		this.iq_idx = iq_idx;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_time = comm_time;
	}

	public int getComm_idx() {
		return comm_idx;
	}

	public void setComm_idx(int comm_idx) {
		this.comm_idx = comm_idx;
	}

	public int getIq_idx() {
		return iq_idx;
	}

	public void setIq_idx(int iq_idx) {
		this.iq_idx = iq_idx;
	}

	public String getComm_title() {
		return comm_title;
	}

	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getComm_time() {
		return comm_time;
	}

	public void setComm_time(String comm_time) {
		this.comm_time = comm_time;
	}

	
	
}
