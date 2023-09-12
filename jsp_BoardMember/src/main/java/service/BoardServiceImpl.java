package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;


public class BoardServiceImpl implements Service {
    //로그 객체 선언
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	//DAO 객체 생성
	private BoardDAO bdao; //interface
	
	public BoardServiceImpl() {
		bdao = new BoardDAOImpl(); //repository -> class
	}

	@Override
	public int add(BoardVO bvo) {
	      log.info("service add check 2");
	      return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getlist() {
		 log.info("service     List<BoardVO>    check 2");
		return bdao.selectList();
	}

	@Override
	public BoardVO detailview(int bno) {
		log.info("서비스임플");
		return bdao.selectOne(bno);
	}

	@Override
	public BoardVO getdetailformodi(int bno) {
		log.info("getdetailformodi 서비스임플 시작");
		return bdao.selectOne(bno);
	}

	@Override
	public int modifForEdit(BoardVO bvo) {
		log.info("modifForEdit 서비스임플 시작");
		return bdao.update(bvo);
	}

	@Override
	public int remove(int bno) {
		log.info("remove 서비스 임플시작");
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public List<BoardVO> getPageList(PagingVO pgvo) {
		log.info("Pagelist check 2");
		return bdao.getPageList(pgvo);
	}


}
