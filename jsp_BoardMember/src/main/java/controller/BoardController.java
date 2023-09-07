package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//jsp에서 오는 요청 주소
		String uri = request.getRequestURI(); //  /brd/register
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info("path>>>>>"+path);
		
		switch(path) {////////////////////////////////////////////////////////////////////////////////////
		case "register":
			log.info(" 여기까지옴1");
			//글쓰기 페이지로 이동해서 페이지가 나오도록 설정
			//목적지 주소 설정
			destPage = "/board/register.jsp";  //register.jsp로이동해 주세요 하기위한 변수에 쏙 넣음            등록페이지(DB에 insert관련 버튼이 이 안에 있음)
		break; //케이스register끝
		
		case "insert":
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
		break;
		
		}//스위치문의 끝///////////////////////////////////////////////////////////////////////////////
		
		rdp= request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		service(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request,response);
	}

}
