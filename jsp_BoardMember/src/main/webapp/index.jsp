<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Index Page(기본?페이지개념 인덱스페이지)</h1>
<ul>
	<li><!-- .jsp파일에서는 컨트롤러를 거치게 하려면 /brd/를 일단 쓴다 컨트롤러에 @WebServlet("/brd/*") 써놓았다. .jsp파일중 모든 /brd/는 잡히면 컨트롤러가 읽을 예정이다. -->
		<a href="/brd/register">게시판 글쓰기로 이동... (컨트롤로의 케이스 경로를 주는것 a href="/brd/register)  </a> 
	</li>
	<li>     
		<a href="/brd/list">게시판 리스트로 이동...</a>
	</li>
</ul>
</body>
</html>