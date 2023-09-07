package repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import orm.DatabaseBuilder;
import service.BoardServiceImpl;

public class BoardDAOImpl implements BoardDAO {

    //로그 객체 선언
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	//DB와 연결
	private SqlSession sql;
	private final String NS = "BoardMapper."; //namespace.id
			
	public BoardDAOImpl(){
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(BoardVO bvo) {
		log.info("dao insert start");
		int isOk = sql.insert(NS+"add", bvo);  //BoardMapper.add를실행해 라는뜻 ("add" 바꿔서쓰면 될듯)    //bvo를 함꼐 넘김
		if(isOk>0) { // insert update delete 시 commit이 필요
			sql.commit();
		}
		return isOk;
	}
	
}
