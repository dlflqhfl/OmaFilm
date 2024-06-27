package web.mybatis.vo;

public class TheaterVO {
	private int t_seat_count; //좌석개수
	private String t_code //상영관코드
	, t_name; //상영관 이름
	
	public TheaterVO() {}

	public TheaterVO(int t_seat_count, String t_code, String t_name) {
		super();
		this.t_seat_count = t_seat_count;
		this.t_code = t_code;
		this.t_name = t_name;
	}

	int getT_seat_count() {
		return t_seat_count;
	}

	void setT_seat_count(int t_seat_count) {
		this.t_seat_count = t_seat_count;
	}

	String getT_code() {
		return t_code;
	}

	void setT_code(String t_code) {
		this.t_code = t_code;
	}

	String getT_name() {
		return t_name;
	}

	void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	
}
