package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;


public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);  //클래스명.class
	private SqlSession sql;
	private final String NS = "MemberMapper."; //네임스페이스. 메퍼.xml파일의 id임...
	
	public MemberDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(MemberVO mvo) {
		log.info("join check 3");
		int isOk = sql.insert(NS+"add", mvo); //select 빼고 다 isOk필요
		if(isOk>0) {
			sql.commit();  //이걸 줘야 정확히 적용됨 인서트 등이
		}
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		log.info("login check 3");
		return sql.selectOne(NS+"login",mvo);
	}

	@Override
	public int listLogin(String id) {
		log.info("listLogin check 3");
		int isOk = sql.update(NS+"last", id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList check 3");
		return sql.selectList(NS+"list");
	}

	@Override
	public int update(MemberVO mvo) {
		log.info("update check 3");
		int isOk = sql.update(NS+"update",mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int delete(String id) {
		log.info("delete check 3");
		int isOk = sql.update(NS+"delete",id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
}
