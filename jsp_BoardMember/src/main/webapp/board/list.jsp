<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글리스트페이지</h1>
	<table border="1">
		<tr>
			<th>BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REG_DATE</th>
		</tr>
		<c:forEach items="${req_set_list}" var="varbvo"> <!-- 컨트롤러에서의 request.setAttribute("req_set_list", list); -->
			<tr>
				<td><a href="/brd/detail?bno=${varbvo.bno}">${varbvo.bno}</a></td>
				<td><a href="/brd/detail?bno=${varbvo.bno}">${varbvo.title}</a></td>
				<td>${varbvo.writer}</td>
				<td>${varbvo.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지네이션 표시 구역 -->
	<div>
		<!-- prev(이전페이지 -->
		<c:if test="${ph.prev}">
		<a href="/brd/pageList?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}">◁|</a>
		</c:if>
		<c:forEach begin="${ph.startPage}" end = "${ph.endPage}" var="i">
			<a href="/brd/pageList?pageNo=${i}&qty=${ph.pgvo.qty}">${i}</a> <!-- 여기서 파라미터 pageNo가 정확히 맞아야  데이터를 가져옴 -->
		</c:forEach>
		<!-- next (다음페이지)-->
		<c:if test="${ph.next}">
		<a href="/brd/pageList?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}">|▷ </a>
		</c:if>
	</div>
	
	<a href="/index.jsp"><button type="button">index</button></a>
   <a href="/brd/register"><button type="button">register</button></a>
	
</body>
</html>