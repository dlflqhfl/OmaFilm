package web.mybatis.vo;

public class NoticeVO {
	private int n_idx, n_status; //공지사항 번호, 상태
	private String nt_ct_code, //카테고리코드
	n_title, //제목
	n_content, //내용
	n_imgString, //이미지경로
	n_time, //작성시간 
	n_banner, //배너 이미지
	n_img; //상세 이미지
	
	
	public String getN_banner() {
		return n_banner;
	}

	public void setN_banner(String n_banner) {
		this.n_banner = n_banner;
	}

	public String getN_img() {
		return n_img;
	}

	public void setN_img(String n_img) {
		this.n_img = n_img;
	}
	
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

	public int getN_idx() {
		return n_idx;
	}

	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}

	public int getN_status() {
		return n_status;
	}

	public void setN_status(int n_status) {
		this.n_status = n_status;
	}

	public String getNt_ct_code() {
		return nt_ct_code;
	}

	public void setNt_ct_code(String nt_ct_code) {
		this.nt_ct_code = nt_ct_code;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_imgString() {
		return n_imgString;
	}

	public void setN_imgString(String n_imgString) {
		this.n_imgString = n_imgString;
	}

	public String getN_time() {
		return n_time;
	}

	public void setN_time(String n_time) {
		this.n_time = n_time;
	}
}
