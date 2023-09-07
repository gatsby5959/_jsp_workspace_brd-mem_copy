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
		<c:forEach items="${req_set_list}" var="varbvo">
			<tr>
				<td><a href="/brd/detail?bno=${varbvo.bno}">${varbvo.bno}</a></td>
				<td><a href="/brd/detail?bno=${varbvo.bno}">${varbvo.title}</a></td>
				<td>${varbvo.writer}</td>
				<td>${varbvo.regdate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>