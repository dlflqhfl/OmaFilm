package main.java.web.mybatis.vo;

public class TheaterSeatVO {
	private int t_code,//좌석코드
	ts_row,//좌석행
	ts_column; //좌석 열
	
	public TheaterSeatVO() {}

	public TheaterSeatVO(int t_code, int ts_row, int ts_column) {
		super();
		this.t_code = t_code;
		this.ts_row = ts_row;
		this.ts_column = ts_column;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public int getTs_row() {
		return ts_row;
	}

	public void setTs_row(int ts_row) {
		this.ts_row = ts_row;
	}

	public int getTs_column() {
		return ts_column;
	}

	public void setTs_column(int ts_column) {
		this.ts_column = ts_column;
	}
}
