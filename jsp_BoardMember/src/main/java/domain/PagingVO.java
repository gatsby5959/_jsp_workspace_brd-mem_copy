package domain;

public class PagingVO {
	private int pageNo; //현재 화면에 출력되는 페이지네이션 번호
	private int qty; // 한페이지당 보여줄 게시글 수
	
	public PagingVO() { //페이지네이션을 클릭하기 전 기본리스트 출력값
		this(1,10);
	}
	
	public PagingVO(int pageNo, int qty){ //클릭하면 자동으로 담아주는 값
		this.pageNo=pageNo;
		this.qty=qty;
	}
	
	public int getPageStart() {
		return (pageNo-1)*qty; //DB에서 조회할 시작페이지 구하기
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "PagingVO [pageNo=" + pageNo + ", qty=" + qty + "]";
	}
	
}
