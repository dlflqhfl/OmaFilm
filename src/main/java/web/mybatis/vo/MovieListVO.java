package web.mybatis.vo;

public class MovieListVO {
	private String  
	movieCd,// 영화코드
	movieNm,//영화명(국문)
	movieNmEn,// 영화명(영문)
	prdtYear,// 제작연도
	showTm,// 상영시간
	openDt,// 개봉연도
	typeNm,// 영화유형명
	nations,// 제작국가
	nationNm,// 제작국가명
	genreNm,// 장르명
	directors,// 감독
	peopleNm,// 배우명
	peopleNmEn,// 배우명(영문)
	actors,// 배우
	cast,// 배우명
	castEn,// 배우명(영문)
	showTypes,// 상영형태 구분
	showTypeGroupNm,// 상영형태 구분
	showTypeNm,// 상영형태명
	audits,// 심의정보
	auditNo,// 심의번호
	watchGradeNm,// 관람등급 명칭
	m_plot, //줄거리
	audiAcc,//누적관람객수
	m_file; //파일명
	
	private int reviewCount;
	private DailyBoxOfficeVO dvo;
	private ReviewVO rvo;
	
	
	
	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public DailyBoxOfficeVO getDvo() {
		return dvo;
	}

	public void setDvo(DailyBoxOfficeVO dvo) {
		this.dvo = dvo;
	}

	public ReviewVO getRvo() {
		return rvo;
	}

	public void setRvo(ReviewVO rvo) {
		this.rvo = rvo;
	}

	public MovieListVO() {}

	@Override
	public String toString() {
		return "MovieListVO [movieCd=" + movieCd + ", movieNm=" + movieNm + ", movieNmEn=" + movieNmEn + ", prdtYear="
				+ prdtYear + ", showTm=" + showTm + ", openDt=" + openDt + ", typeNm=" + typeNm + ", nations=" + nations
				+ ", nationNm=" + nationNm + ", genreNm=" + genreNm + ", directors=" + directors + ", peopleNm="
				+ peopleNm + ", peopleNmEn=" + peopleNmEn + ", actors=" + actors + ", cast=" + cast + ", castEn="
				+ castEn + ", showTypes=" + showTypes + ", showTypeGroupNm=" + showTypeGroupNm + ", showTypeNm="
				+ showTypeNm + ", audits=" + audits + ", auditNo=" + auditNo + ", watchGradeNm=" + watchGradeNm
				+ ", m_plot=" + m_plot + ", audiAcc=" + audiAcc + ", m_file=" + m_file + "]";
	}

	public MovieListVO(String movieCd, String movieNm, String movieNmEn, String prdtYear, String showTm, String openDt,
			String typeNm, String nations, String nationNm, String genreNm, String directors, String peopleNm,
			String peopleNmEn, String actors, String cast, String castEn, String showTypes, String showTypeGroupNm,
			String showTypeNm, String audits, String auditNo, String watchGradeNm, String m_plot, String audiAcc,
			String m_file) {
		super();
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.movieNmEn = movieNmEn;
		this.prdtYear = prdtYear;
		this.showTm = showTm;
		this.openDt = openDt;
		this.typeNm = typeNm;
		this.nations = nations;
		this.nationNm = nationNm;
		this.genreNm = genreNm;
		this.directors = directors;
		this.peopleNm = peopleNm;
		this.peopleNmEn = peopleNmEn;
		this.actors = actors;
		this.cast = cast;
		this.castEn = castEn;
		this.showTypes = showTypes;
		this.showTypeGroupNm = showTypeGroupNm;
		this.showTypeNm = showTypeNm;
		this.audits = audits;
		this.auditNo = auditNo;
		this.watchGradeNm = watchGradeNm;
		this.m_plot = m_plot;
		this.audiAcc = audiAcc;
		this.m_file = m_file;
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

	public String getMovieNmEn() {
		return movieNmEn;
	}

	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}

	public String getPrdtYear() {
		return prdtYear;
	}

	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}

	public String getShowTm() {
		return showTm;
	}

	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getTypeNm() {
		return typeNm;
	}

	public void setTypeNm(String typeNm) {
		this.typeNm = typeNm;
	}

	public String getNations() {
		return nations;
	}

	public void setNations(String nations) {
		this.nations = nations;
	}

	public String getNationNm() {
		return nationNm;
	}

	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}

	public String getGenreNm() {
		return genreNm;
	}

	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getPeopleNm() {
		return peopleNm;
	}

	public void setPeopleNm(String peopleNm) {
		this.peopleNm = peopleNm;
	}

	public String getPeopleNmEn() {
		return peopleNmEn;
	}

	public void setPeopleNmEn(String peopleNmEn) {
		this.peopleNmEn = peopleNmEn;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getCastEn() {
		return castEn;
	}

	public void setCastEn(String castEn) {
		this.castEn = castEn;
	}

	public String getShowTypes() {
		return showTypes;
	}

	public void setShowTypes(String showTypes) {
		this.showTypes = showTypes;
	}

	public String getShowTypeGroupNm() {
		return showTypeGroupNm;
	}

	public void setShowTypeGroupNm(String showTypeGroupNm) {
		this.showTypeGroupNm = showTypeGroupNm;
	}

	public String getShowTypeNm() {
		return showTypeNm;
	}

	public void setShowTypeNm(String showTypeNm) {
		this.showTypeNm = showTypeNm;
	}

	public String getAudits() {
		return audits;
	}

	public void setAudits(String audits) {
		this.audits = audits;
	}

	public String getAuditNo() {
		return auditNo;
	}

	public void setAuditNo(String auditNo) {
		this.auditNo = auditNo;
	}

	public String getWatchGradeNm() {
		return watchGradeNm;
	}

	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}

	public String getM_plot() {
		return m_plot;
	}

	public void setM_plot(String m_plot) {
		this.m_plot = m_plot;
	}

	public String getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}

	public String getM_file() {
		return m_file;
	}

	public void setM_file(String m_file) {
		this.m_file = m_file;
	}
	

	
	
	
	
	
}
