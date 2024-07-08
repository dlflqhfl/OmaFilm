package main.java.web.mybatis.vo;

public class ScreeningScheduleVO {
	private String ss_code, //상영시간표코드
	movieCd, //상영영화코드
	t_name, //상영관 이름
	ss_time,//시작시간
	ss_date;//시작날짜
	
	private MovieListVO mvo;
	
	public ScreeningScheduleVO() {}
	
	@Override
	public String toString() {
		return "ScreeningScheduleVO [ss_code=" + ss_code + ", movieCd=" + movieCd + ", t_name=" + t_name + ", ss_time="
				+ ss_time + "]";
	}
	
	public ScreeningScheduleVO(String ss_code, String movieCd, String t_name, String ss_time) {
		super();
		this.ss_code = ss_code;
		this.movieCd = movieCd;
		this.t_name = t_name;
		this.ss_time = ss_time;
	}

	public String getSs_date() {
		return ss_date;
	}

	public void setSs_date(String ss_date) {
		this.ss_date = ss_date;
	}

	public String getSs_code() {
		return ss_code;
	}

	public void setSs_code(String ss_code) {
		this.ss_code = ss_code;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getSs_time() {
		return ss_time;
	}

	public void setSs_time(String ss_time) {
		this.ss_time = ss_time;
	}

	public MovieListVO getMvo() {
		return mvo;
	}

	public void setMvo(MovieListVO mvo) {
		this.mvo = mvo;
	}

	
}
