package main.java.web.mybatis.vo;

public class WeeklyBoxOfficeVO {
	private int idx;//인덱스
	private String boxofficeType,//박스오피스 종류
	showRange,// 대상 상영기간
	yearWeekTime,// 조회일자에 해당하는 연도와 주차
	rnum,// 순번
	rank,// 해당일자의 박스오피스 순위
	rankInten,// 전일대비 순위의 증감분
	rankOldAndNew,// 랭킹에 신규진입여부를 출력합니다.“OLD” : 기존 , “NEW” : 신규
	movieCd,// 영화의 대표코드
	movieNm,// 영화명(국문)
	openDt,// 영화의 개봉일
	salesAmt,// 해당일의 매출액
	salesShare,// 해당일자 상영작의 매출총액 대비 해당 영화의 매출비율
	salesAcc,// 누적매출액
	audiCnt,// 해당일의 관객수
	audiAcc,// 누적관객수
	scrnCnt,// 해당일자에 상영한 스크린수
	showCnt;// 해당일자에 상영된 횟수
	
	public WeeklyBoxOfficeVO() {}

	public WeeklyBoxOfficeVO(int idx, String boxofficeType, String showRange, String yearWeekTime, String rnum,
			String rank, String rankInten, String rankOldAndNew, String movieCd, String movieNm, String openDt,
			String salesAmt, String salesShare, String salesAcc, String audiCnt, String audiAcc, String scrnCnt,
			String showCnt) {
		super();
		this.idx = idx;
		this.boxofficeType = boxofficeType;
		this.showRange = showRange;
		this.yearWeekTime = yearWeekTime;
		this.rnum = rnum;
		this.rank = rank;
		this.rankInten = rankInten;
		this.rankOldAndNew = rankOldAndNew;
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.openDt = openDt;
		this.salesAmt = salesAmt;
		this.salesShare = salesShare;
		this.salesAcc = salesAcc;
		this.audiCnt = audiCnt;
		this.audiAcc = audiAcc;
		this.scrnCnt = scrnCnt;
		this.showCnt = showCnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getBoxofficeType() {
		return boxofficeType;
	}

	public void setBoxofficeType(String boxofficeType) {
		this.boxofficeType = boxofficeType;
	}

	public String getShowRange() {
		return showRange;
	}

	public void setShowRange(String showRange) {
		this.showRange = showRange;
	}

	public String getYearWeekTime() {
		return yearWeekTime;
	}

	public void setYearWeekTime(String yearWeekTime) {
		this.yearWeekTime = yearWeekTime;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getRankInten() {
		return rankInten;
	}

	public void setRankInten(String rankInten) {
		this.rankInten = rankInten;
	}

	public String getRankOldAndNew() {
		return rankOldAndNew;
	}

	public void setRankOldAndNew(String rankOldAndNew) {
		this.rankOldAndNew = rankOldAndNew;
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

	public String getSalesAmt() {
		return salesAmt;
	}

	public void setSalesAmt(String salesAmt) {
		this.salesAmt = salesAmt;
	}

	public String getSalesShare() {
		return salesShare;
	}

	public void setSalesShare(String salesShare) {
		this.salesShare = salesShare;
	}

	public String getSalesAcc() {
		return salesAcc;
	}

	public void setSalesAcc(String salesAcc) {
		this.salesAcc = salesAcc;
	}

	public String getAudiCnt() {
		return audiCnt;
	}

	public void setAudiCnt(String audiCnt) {
		this.audiCnt = audiCnt;
	}

	public String getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}

	public String getScrnCnt() {
		return scrnCnt;
	}

	public void setScrnCnt(String scrnCnt) {
		this.scrnCnt = scrnCnt;
	}

	public String getShowCnt() {
		return showCnt;
	}

	public void setShowCnt(String showCnt) {
		this.showCnt = showCnt;
	}
	
	
	
	
	
}
