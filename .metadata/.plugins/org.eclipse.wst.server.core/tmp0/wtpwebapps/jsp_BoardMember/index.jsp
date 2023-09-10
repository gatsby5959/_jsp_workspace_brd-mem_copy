<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Index Page(기본?페이지개념 인덱스페이지)</h1>

	<form action="/mem/login" method="post">
		ID : <input type="text" name="id"> 
		PWD : <input type="text"  name="pwd">
		<button type="submit">login</button>
	</form>

<%-- 
<ul>
	<li><!-- .jsp파일에서는 컨트롤러를 거치게 하려면 /brd/를 일단 쓴다 컨트롤러에 @WebServlet("/brd/*") 써놓았다. .jsp파일중 모든 /brd/는 잡히면 컨트롤러가 읽을 예정이다. -->
		<a href="/brd/register">게시판 글쓰기로 이동... (컨트롤로의 케이스 경로를 주는것 a href="/brd/register)  </a> 
	</li>
	<li>     
		<a href="/brd/list">게시판 리스트로 이동...</a>
	</li>
	<li>     
		<a href="#">회원정보수정</a>
	</li>
	<li>     
		<a href="#">회원리스트보기</a>
	</li>
	<li>     
		<a href="#">로그아웃</a>
	</li>
	<li>     
		<a href="#">회원가입</a>
	</li>
</ul>
--%>

<br>
<hr>

<c:if test = "${ses.id ne null}">
	${ses.id} login 하였습니다. <br>
	계정생성일 :  ${ses.regdate} <br>
	마지막접속 :  ${ses.lastlogin} <br>

	<a href="#"><button>회원정보수정</button></a>
	<a href="/mem/list"><button>회원리스트보기</button></a>
	<a href="/mem/logout"><button>로그아웃</button></a> 
	<br>
	
	<!-- .jsp파일에서는 컨트롤러를 거치게 하려면 /brd/ /mem/ 등을 씀 
	컨트롤러에 @WebServlet("/brd/*") 등 써놓았다. 
	.jsp파일중 /brd/ 등은 관련 컨트롤러에 잡히면 /brd/ /mem/ 관련 컨트롤러가 잡아낸다 
	못 잡아내면 서버설정을 봐라 이클립스 등에 / 가 바뀌어 있을수도 있다. -->
	<a href="/brd/register"><button>게시판 글쓰기로 이동 (컨트롤로의 케이스 경로를 주는것 a href="/brd/register)</button> </a> <br>
	
</c:if>

	<a href="/mem/join"><button>회원가입</button></a>
	<br>
	<br>
	<hr>
	<br>
	<a href="/brd/list"><button>게시판 리스트로 이동</button></a>	<br>
<%--<c:out value="${msg_login}"></c:out>  --%>


<script type="text/javascript">
const msg_login = `<c:out value="${msg_login}"/>`;
if(msg_login === '0'){
	alert("로그인 정보가 일치하지 않습니다.");
}
</script>




</body>
</html>