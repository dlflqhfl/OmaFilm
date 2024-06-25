package web.mybatis.vo;

public class TheaterVO {
	private int t_seat_count; //좌석개수
	private String t_name; //상영관 이름
	
	public TheaterVO() {}

	public TheaterVO(int t_seat_count,  String t_name) {
		super();
		this.t_seat_count = t_seat_count;
		this.t_name = t_name;
	}

	public int getT_seat_count() {
		return t_seat_count;
	}

	public void setT_seat_count(int t_seat_count) {
		this.t_seat_count = t_seat_count;
	}
	
	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

}
