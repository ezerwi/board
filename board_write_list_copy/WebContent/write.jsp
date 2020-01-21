<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.wjh.board.DB, com.wjh.board.ChangeEncode, java.sql.SQLException, java.sql.PreparedStatement" %>

<%
String writer = request.getParameter("writer");
String title = request.getParameter("title");
String contents = request.getParameter("contents");

out.print("<h1>최종 확인 합니다</h1>");

out.print("Writer : <br>"+writer+"<p>");
out.print("Title : <br>"+title+"<p>");
out.print("Contents : <br>"+contents);

DB.datatInsert(writer, title, contents);

%>

<p><a href = "list.jsp">글목록으로 돌아가기</a>
<p><a href = "index.html">홈으로 돌아가기</a>