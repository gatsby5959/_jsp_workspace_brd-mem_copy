package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
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
	      log.info("service register check 2");
	      return bdao.insert(bvo);
	}
}
