package web.mybatis.vo;

public class ReviewVO {
	private int r_idx,r_status;// 리뷰번호, 상태
	private String u_code,// 회원코드
	r_grade, // 평점
	r_content,// 내용
	r_date,// 리뷰날짜
	r_recomm;// 추천
	
	public ReviewVO() {}

	public ReviewVO(int r_idx, int r_status, String u_code, String r_grade, String r_content, String r_date,
			String r_recomm) {
		super();
		this.r_idx = r_idx;
		this.r_status = r_status;
		this.u_code = u_code;
		this.r_grade = r_grade;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_recomm = r_recomm;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getR_status() {
		return r_status;
	}

	public void setR_status(int r_status) {
		this.r_status = r_status;
	}

	public String getU_code() {
		return u_code;
	}

	public void setU_code(String u_code) {
		this.u_code = u_code;
	}

	public String getR_grade() {
		return r_grade;
	}

	public void setR_grade(String r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_recomm() {
		return r_recomm;
	}

	public void setR_recomm(String r_recomm) {
		this.r_recomm = r_recomm;
	}
}
