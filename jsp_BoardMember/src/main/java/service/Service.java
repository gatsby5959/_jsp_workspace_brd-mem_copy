package service;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface Service {

	int add(BoardVO bvo);

	List<BoardVO> getlist();

	BoardVO detailview(int bno);

	BoardVO getdetailformodi(int bno);

	int modifForEdit(BoardVO bvo);

	int remove(int bno);

	int getTotalCount();

	List<BoardVO> getPageList(PagingVO pgvo);

	

}
