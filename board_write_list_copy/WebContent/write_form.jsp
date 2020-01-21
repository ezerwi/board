<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board write form</title>
</head>
<body bgcolor = #FF6F61>

<h1><FONT COLOR = #FFD662>글쓰기</FONT></h1>

<% // 같은 form tag으로 묶이면 한 묶음으로 인식 %>

<table>
<tr>
<td>
	<form action = "write.jsp"  method = "get">
	<font COLOR = WHITE>Writer</font><br>
</td>
<td>
	<input type = "text" size="50" name="writer"  required="required"	/>

</td>
</tr>

<tr>
<td>
	<font COLOR = WHITE>Title</font><br>
</td>
<td>

	<input type = "text" size="100" name="title"  required="required"	/>
</td>
</tr>

<tr>
<td>
	<font COLOR = WHITE>Contents</font> <br>
</td>
<td>
	<textarea rows="10" 	cols="100" 	name="contents"  required="required" ></textarea>

</td>
</tr>

<tr>
<td></td>
<td>
	<input type = "submit"  value = "글저장" />
	<input type = "reset"  value = "초기화" />
</td>
</tr>
	</form>
<p>
<tr>
<td></td>
<td>
	<input type = "button" value = "HOME" onclick="location.href='index.html' " />
	<input type = "button" value = "LIST" onclick="location.href='list.jsp' " />
</td>
</table>
</body>
</html>