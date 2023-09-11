package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import handler.PagingHandler;
import service.BoardServiceImpl;
import service.Service;


@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //로그 객체 선언
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	//reqeustDespatcher객체
	private RequestDispatcher rdp;
	//service interface
	private Service bsv;
	//destPage : 목적지 주소 저장변수
	private String destPage;
	//isOk
	private int isOk;
    
	public BoardController() {
		//bsv의 객체 연결
		bsv = new BoardServiceImpl();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//encoding 설정, contentType 설정, 요청경로 파악
		log.info("서비스함수타기시작");
		log.info("111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//jsp에서 오는 요청 주소
		String uri = request.getRequestURI(); //  /brd/register
		String path = uri.substring(uri.lastIndexOf("/")+1);//
		log.info("path>>>>>"+path);
		log.info("switch문 바로 위");
		switch(path) {////////////////////////////////////////////////////////////////////////////////////
		
		case "register":
			log.info(" 여기까지옴1");
			//글쓰기 페이지로 이동해서 페이지가 나오도록 설정
			//목적지 주소 설정
			destPage = "/board/register.jsp";  //register.jsp로이동해 주세요 하기위한 변수에 쏙 넣음            등록페이지(DB에 insert관련 버튼이 이 안에 있음)
		break; //케이스register끝
		
		case "insert":
			try {
				log.info("인서트 1옴");	
				String title = request.getParameter("title");
				String writer = request.getParameter("writer");
				String content = request.getParameter("content1234");
				log.info(">>>>> insert check 1");
				BoardVO bvo = new BoardVO(title, writer, content);
				log.info("bvo >>>>>" + bvo);
				isOk =bsv.add(bvo);
				log.info((isOk>0)? "OK" : "Fail");
				
				destPage = "/index.jsp";
				
				log.info("인서트 잘 된듯 "+" isOk값은 "+isOk+" 임");
			} catch (Exception e) {
				log.info("인서트 에러");
				e.printStackTrace();
			}
		break;//insert 끝
		
		case "list":
			try {
				log.info("리스트 1옴");
				log.info(">>>>> list check 1");
				List<BoardVO> listBoardVO =bsv.getlist();
				request.setAttribute("req_set_list", listBoardVO); //받아온 리스트를 리퀘스트 객체 일단 짱박는듯
				destPage = "/board/list.jsp";
				log.info("list 케이스문 까진  잘 된듯");
			} catch (Exception e) {
				log.info("리스트 에러");
				e.printStackTrace();
			}
		break;//list 끝
		
		case "pageList":
			try {
				//jsp에서 파라미터 받기
				PagingVO pgvo = new PagingVO();
				log.info("페이징 직전임니다");
				if(request.getParameter("pageNo") != null) {
					log.info("페이징에 들어왔습니다.");
					int pageNo = Integer.parseInt(request.getParameter("pageNo")); // 정확히 pageNo 가 맞아야 함   http://localhost:8088/brd/pageList?pageNo=7&qty=10
					int qty = Integer.parseInt(request.getParameter("qty"));
					log.info("pageNo "+pageNo+" qty "+qty);
					pgvo = new PagingVO(pageNo,qty); //값이 있으면...
				}
				
				int totalCount = bsv.getTotalCount(); //DB에서 전체 카운트 요청   뭐 주는건 없지만 전체 카운트 가져왕
				log.info("전체 게시글 수 "+totalCount);		
				//bsv pgvo 주고, limit 적용한 리스트 10개 가져오기.
				List<BoardVO> list = bsv.getPageList(pgvo);
				log.info("pagestart "+pgvo.getPageStart());
				request.setAttribute("req_set_list", list); //여기에 set을의 키를 보드list.jsp페이지와 일치 시켜야 함
				//페이지 정보를 list.jsp로 보내기
				PagingHandler ph = new PagingHandler(pgvo, totalCount);
				request.setAttribute("ph", ph);
				log.info("paging 성공~!!");
				destPage="/board/list.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;//pageList 끝
		
		case "detail":
			try {
				log.info("디테일잘들어옴");
				int bno = Integer.parseInt((request.getParameter("bno")));
				BoardVO bvo = bsv.detailview(bno);
				request.setAttribute("keybvo", bvo); // 이렇게 셋하면 키값으로 옴겨진 jsp페지에서 뽑아옴 ex)${keybvo.bno}
				destPage = "/board/detail.jsp";
			} catch (Exception e) {
				log.info("디테일에러");
				e.printStackTrace();
			}
			break;
		
		case "modify":
			try {
				log.info("모디파이 들어옴");
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardVO bvo = bsv.getdetailformodi(bno);
				request.setAttribute("keybvo", bvo); //여기서 keybvo 라는 키이름을 사용해봤다.
				destPage = "/board/modify.jsp";
			} catch (NumberFormatException e) {
				log.info("모디파이케이스 에러");
				e.printStackTrace();
			}
			break;
		
		case "edit":
			try {
				log.info("컨트롤로 edit case 시작");
				int bno = Integer.parseInt(request.getParameter("bno"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				BoardVO bvo = new BoardVO(bno,title,content);
				log.info("bvo는 " + bvo);
				isOk = bsv.modifForEdit(bvo);
				log.info((isOk>0)?"OK":"Fail");
				destPage = "detail?bno="+bno;

			} catch (Exception e) {
				log.info("에디트 에러");
				e.printStackTrace();
			}
			break;
			
		case "remove":
			try {
				log.info("리무브 들어옴");
				int bno = Integer.parseInt(request.getParameter("bno"));  //이건  a태그로 ?get방식으로받아서 옴
				int isOk = bsv.remove(bno);
				log.info(      (isOk>0)?"OK":"Fail"         );
				destPage = "pageList";
			} catch (NumberFormatException e) {
				e.printStackTrace();
				log.info("remove error");
			}
			break;
		
		
		}//스위치문의 끝///////////////////////////////////////////////////////////////////////////////
		
		
		//.jsp파일이 아니라면 다시 case 잇는거 찾아보고.. 있으면 다시 컨트롤러 동작...     list등 .jsp가 없는 상황에서 컨트롤러 재동작
		rdp= request.getRequestDispatcher(destPage);//둘이 한 세트
		rdp.forward(request, response);//둘이 한 세트      
		
		
		log.info("222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		service(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request,response);
	}

}
