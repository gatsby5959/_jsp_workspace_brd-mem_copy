<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Board List Page 게시글리스트페이지</h1>
	<!-- search구역 -->
	<div>
	<c:set value="${ph.pgvo.type }" var="typed"></c:set>
	<form action="/brd/pageList" method="get">
		<div>
			<select name="type">
				<option ${typed == null? 'selected':'' }>Choose...</option>
				<option value="t"  ${typed eq 't'? 'selected':'' } >title</option>
				<option value="w"  ${typed eq 'w'? 'selected':'' }>writer</option>
				<option value="c"  ${typed eq 'c'? 'selected':'' }>content</option>
				<option value="tw"  ${typed eq 'tw'? 'selected':'' }>title+writer</option>
				<option value="tc"  ${typed eq 'tc'? 'selected':'' }>title+content</option>
				<option value="wc"  ${typed eq 'wc'? 'selected':'' }>writer+content</option>
				<option value="twc"  ${typed eq 'twc'? 'selected':'' }>title+writer+content</option>
			</select>
			<input type="text" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search...">
			<input type="hidden" name="pageNO" value="${ph.pgvo.pageNo }">
			<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			${ph.totalCount}
			<button type="submit" class="btn btn-outline-success">검색search</button>
		</div>
	</form>
	</div>
	<br>
	<table border="1" class="table table-dark">
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
		<a href="/brd/pageList?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">◁|</a>
		</c:if>
		<c:forEach begin="${ph.startPage}" end = "${ph.endPage}" var="i">
			<a href="/brd/pageList?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i}</a> <!-- 여기서 파라미터 pageNo가 정확히 맞아야  데이터를 가져옴 -->
		</c:forEach>
		<!-- next (다음페이지)-->
		<c:if test="${ph.next}">
		<a href="/brd/pageList?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">|▷ </a>
		</c:if>
	</div>
	
	<a href="/index.jsp"><button type="button"  class="btn btn-outline-primary">index</button></a>
   <a href="/brd/register"><button type="button"  class="btn btn-outline-secondary">register</button></a>
	
</body>
</html>