package main.java.web.mybatis.vo;

public class OpenMovieListVO {

	private String movieNm,openDt,movieCd;

	
	@Override
	public String toString() {
		return "OpenMovieListVO [movieNm=" + movieNm + ", openDt=" + openDt + ", movieCd=" + movieCd + "]";
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	
}
