<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.sql.ResultSet, java.sql.SQLException, com.wjh.board.ChangeEncode, com.wjh.board.DB"%>

<%
	ResultSet rs = DB.showRS();
	rs.beforeFirst();
 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>BOARD</title>
</head>

<body bgcolor=#343148>

	<h1><font color = #F0EAD6>List of Articles</font></h1>

	<table border=30 bgcolor=#F3E0BE>
		<tr>
			<th>번호</th>
			<th>Title</th>
			<th>Writer</th>
			<th>hit</th>
		</tr>

		<%
			int no = 0;
			String title = null;
			String writer = null;
			int hit = 0;
			
			while(rs.next()) {
			
			no = rs.getInt("idx");
			title = ChangeEncode.toUnicode(rs.getString("title"));
			writer = ChangeEncode.toUnicode(rs.getString("writer"));
			hit = rs.getInt("hit");
		%>
		<tr>
			<td><%=no%></td>
			<td><a href = hit.jsp?no=<%= no%>><%=title%></a></td>
			<td><%=writer%></td>
			<td><%=hit%></td>
		</tr>
		<%
			}
		%>
	</table>
<p>
<input type = "button" value = "NEW" onclick="location.href='write_form.jsp' " />

<p>
<input type = "button" value = "HOME" onclick="location.href='index.html' "  />
	
</body>
</html>