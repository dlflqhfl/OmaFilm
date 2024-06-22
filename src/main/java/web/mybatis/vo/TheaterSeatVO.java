package web.mybatis.vo;

public class TheaterSeatVO {
	private String s_code, ts_row; //좌석 코드, 좌석 행
	private int t_code, ts_column; //상영관 코드, 좌석 열
	
	public TheaterSeatVO() {}

	public TheaterSeatVO(int t_code, String ts_row, int ts_column) {
		super();
		this.t_code = t_code;
		this.ts_row = ts_row;
		this.ts_column = ts_column;
	}

	
	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getTs_row() {
		return ts_row;
	}

	public void setTs_row(String ts_row) {
		this.ts_row = ts_row;
	}

	public int getTs_column() {
		return ts_column;
	}

	public void setTs_column(int ts_column) {
		this.ts_column = ts_column;
	}

	
}
