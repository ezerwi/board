<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@
page import = "com.wjh.board.DB, com.wjh.board.ChangeEncode, java.sql.SQLException, java.sql.ResultSet"
 %>
 
 <%
 String num = request.getParameter("no");
 
 String title = ChangeEncode.toLatin(request.getParameter("writer"));
 String contents = ChangeEncode.toLatin(request.getParameter("contents"));
 
 
 boolean status = DB.modRS(num, title, contents);
 
 if(status==true) {
	 response.sendRedirect("list.jsp");
 }
 
 %>