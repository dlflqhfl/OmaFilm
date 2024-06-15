package web.mybatis.vo;

public class NoticeVO {
	private int n_idx, n_status; //공지사항 번호, 상태
	private String nt_ct_code, //카테고리코드
	n_title, //제목
	n_content, //내용
	n_imgString; //이미지경로
	
	public NoticeVO() {}

	public NoticeVO(int n_idx, int n_status, String nt_ct_code, String n_title, String n_content, String n_imgString) {
		super();
		this.n_idx = n_idx;
		this.n_status = n_status;
		this.nt_ct_code = nt_ct_code;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_imgString = n_imgString;
	}

	int getN_idx() {
		return n_idx;
	}

	void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}

	int getN_status() {
		return n_status;
	}

	void setN_status(int n_status) {
		this.n_status = n_status;
	}

	String getNt_ct_code() {
		return nt_ct_code;
	}

	void setNt_ct_code(String nt_ct_code) {
		this.nt_ct_code = nt_ct_code;
	}

	String getN_title() {
		return n_title;
	}

	void setN_title(String n_title) {
		this.n_title = n_title;
	}

	String getN_content() {
		return n_content;
	}

	void setN_content(String n_content) {
		this.n_content = n_content;
	}

	String getN_imgString() {
		return n_imgString;
	}

	void setN_imgString(String n_imgString) {
		this.n_imgString = n_imgString;
	}
	
	
}
