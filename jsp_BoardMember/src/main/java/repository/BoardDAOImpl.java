package repository;

import java.util.List;

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

	@Override
	public List<BoardVO> selectList() {
		log.info("daoImpl list start");
		List<Object> isOk = sql.selectList(NS+"alllist");
		if(isOk!=null) {
			return sql.selectList(NS+"alllist");
		}else {
			log.info("게시판의 글 개수 등이 0 또는 뭔가가 null 인것 같은데?");
			return sql.selectList(NS+"alllist");
		}
		
	}

	@Override
	public BoardVO selectOne(int bno) {
		log.info("dao 셀렉트원 들어옴");
		return sql.selectOne(NS+"one", bno);
	}

	@Override
	public int update(BoardVO bvo) {
		log.info("dao 업데이트 들어옴");
		int isOk = sql.update(NS+"upd", bvo);
		if (isOk>0) {
			sql.commit();
		}
		return isOk;	
		}

	@Override
	public int delete(int bno) {
		log.info("dao delete들어옴");
		int isOk = sql.delete(NS+"del", bno);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}
	
}
