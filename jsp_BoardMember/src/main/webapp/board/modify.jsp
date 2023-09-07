<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>여기는 수정페이지입니다.</h1>
<form action = "/brd/edit"><!-- jsp페이지니까 /brd/를 써서 컨트롤러가 잡을수 있게 한다.  그중 edit케이스가 걸릴것이다. -->
<table border = "1">
	<tr>
		<th>BNO</th>
		<td><input type="text" name ="bno" value="${keybvo.bno}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>TITLE</th>
		<td><input type= "text" name = "title" value="${keybvo.title}"></td>
	</tr>
	<tr>
		<th>WRITER</th>
		<td>${keybvo.writer}</td>
	</tr>
	<tr>
		<th>REGDATE</th>
		<td>${keybvo.regdate}</td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td><textarea rows="4" cols="33" name="content">${keybvo.content}</textarea></td>
	</tr>
</table>
<button type= submit>수정</button>
</form>
</body>
</html>