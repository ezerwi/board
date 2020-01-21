<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = 
"com.wjh.board.DB, java.sql.SQLException, java.sql.ResultSet, com.wjh.board.ChangeEncode" %>

<%

String no = request.getParameter("no");

ResultSet rs = DB.oneRS(no);

String title = null;
String writer = null;
String contents = null;

rs.beforeFirst();

while(rs.next()){
	title = ChangeEncode.toUnicode(rs.getString("title"));
	writer = ChangeEncode.toUnicode(rs.getString("writer"));
	contents = ChangeEncode.toUnicode(rs.getString("contents"));
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>!수정!</title>
</head>
<body>

<form action="modify.jsp" method="get">
<h1>Modify</h1>

<%=no%>번 글을 수정합니다.

<table>

<tr>
	<td>TITLE</td>
	<td><input type = "text" size = "60" name = "title" required= required value = "<%=title%>" ></td>
</tr>

<tr>
	<td>WRITER</td>
	<td><input type = "text" name = "writer" size = "60" readonly = "readonly" value = '<%=writer %>' /></td>
</tr>

<tr>
	<td>CONTENTS</td>
	<td><textarea rows = "10" cols="60" name = "contents" required= required ><%=contents%></textarea></td>

</tr>

<tr>
<td><input type = 'submit' value="COMPLETE" /></td>
<td><input type ="reset" value = "RESET">
<input type="hidden" size="20" readonly="readonly" name="no"  value=<%=no %> /></td>
</tr>

<tr>
<td>
<input type = "button" value = "LIST" onclick = "location.href='list.jsp'" />
<input type = "button" value = "HOME" onclick = "location.href='index.html'" />
</td>
</tr>
</table>
</form>


</body>
</html>