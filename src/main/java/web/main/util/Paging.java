package web.main.util;

public class Paging {
	int nowPage = 1; //현재페이지 이걸로 startPage랑 endPage가 정해진다.
	int numPerPage = 10; // 한 페이지당 표현할 게시물 수
	int totalRecode; //총 게시물 수
	int pagePerBlock = 3; // 페이지 묶음(한 블럭당 보여질 페이지 수)
	
	int totalPage;// 총 페이지 수
	int begin; //현재 페이지 값에 따라 bbs_t테이블에서 가져올
				//게시물의 시작 행번호
	int end; //현재 페이지 값에 따라 bbs_t테이블에서 가져올
			// 게시물의 마지막 행번호
	int startPage;// 한 블럭의 시작페이지 값
	int endPage; // 한 블럭의 마지막페이지 값
	
	public Paging() {} //기본 생성자
	
	public Paging(int numPerPage, int pagePerBlock) {
		//인자인 지역변수를 멤버변수에 저장
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		//현재 페이지 값이 변경되고 있으니 begin과 end 그리고
		// startPage와 endPage값을 구한다.
		// 먼저 무슨 페이지든 간에 총 페이지 값을 넘어서는 안된다.
		// 그래서 현재페이지에 총 페이지 값을 넣는다.
		if( nowPage > totalPage) {
			nowPage = totalPage;
		}
		// 각 페이지의 시작레코드의 행번호와 마지막 레코드의 행번호 지정!
		// 현재 페이지 값이 1 : begin : 1 , end : 10
		// 현재 페이지 값이 2 : begin : 11 , end : 20
		begin = (nowPage-1) * numPerPage + 1;
		end = nowPage* numPerPage;
		
		//현재페이지 값에 의해 블럭의 시작페이지 값 구하기
		//((nowPage-1)/pagePerBlock) 이게 연산값이 소수점이 나와서 int로 캐스팅한다
		// 만약 현재 페이지가 5면 시작 페이지 번호는 1 이여야한다 또 6이면 시작 번호는 6페이지여야하고 
		startPage = 
				(int)((nowPage-1)/pagePerBlock)* pagePerBlock+1;
		
		//시작 페이지에 1이 더해져서 마지막 페이지가 1증가떄문에 1을 뺴준다.
		endPage = startPage+pagePerBlock - 1;
		
		//마지막 페이지 값이 총 페이지 값보다 크면 안됩니다.
		if( endPage > totalPage) {
			endPage = totalPage;
		}
		
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getTotalRecode() {
		return totalRecode;
	}

	public void setTotalRecode(int totalRecode) {
		//총 게시물의 수가 변경될 때 총 페이지 값도 변경되도록 하자!
		this.totalRecode = totalRecode;
		/*
		this.totalPage = totalRecode/numPerPage;
		if((totalRecode%numPerPage) != 0) {
			this.totalPage++;
		}
		*/
		//Math.ceil = 가장 가까운 자연수로 바꾼다 ( 올림 ,반올림 x)
		//Math.ceil 반환형이 double인데 totalRecode랑 numPerPage는
		//int형이라 에러가 날수있어 totalRecode를 double로 바꾼다 -> 그럼더블로 형변환이 된다
		this.totalPage = 
				(int)(Math.ceil((double)totalRecode/numPerPage));
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
}
