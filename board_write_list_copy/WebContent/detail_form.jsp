<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= 
"com.wjh.board.DB, java.sql.SQLException, java.sql.ResultSet,
com.wjh.board.ChangeEncode" %>

<%

String no = request.getParameter("no");

String number ="";
String title = "";
String writer = "";
String contents = "";

ResultSet rs = DB.oneRS(no);

rs.beforeFirst();

while(rs.next()) {
	number = rs.getString("idx"); 
	title = ChangeEncode.toUnicode(rs.getString("title"));
	writer = ChangeEncode.toUnicode(rs.getString("writer"));
	contents = ChangeEncode.toUnicode(rs.getString("contents"));
}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONTENTS</title>
</head>
<body bgcolor = #898E8C>

<h1><font color = #672E3B >글 상세 보기</font></h1>

<p>
<table>

<tr>
<td><font color = white>no = "<%=number%>"</font></td>
</tr>

<tr>
	<td><FONT COLOR = WHITE>TITLE</FONT></td>
	<td><input type = "text" size = "59" readonly = "readonly" value = "<%=title%>" /></td>

</tr>

<tr >
	<td><font color = white>writer</font></td>
	<td><input type = "text" size = "20" readonly = "readonly" value = "<%=writer%>" /></td>
</tr>

<tr>
	<td><font color = white>contents</font></td>
	<td><textarea rows = "10" cols = "60" readonly = "readonly"><%=contents%></textarea></td>
</tr>

</table>

<p>

<table>
<tr>
	<td></td>

	<td><input type = "button" value = "NEW" onclick="location.href='write_form.jsp' " />
	<input type = "button" value = "MODIFY" onclick="location.href='modify_form.jsp?no=<%=number%>'  "/>
	<input type = "button" value = "LIST" onclick="location.href='list.jsp' "/>
	</td>
</tr>

<tr>
	<td></td>
	
	<td><input type = "button" value = "HOME" onclick="location.href='index.html' "  />	</td>
</tr>

</table>


</body>
</html>