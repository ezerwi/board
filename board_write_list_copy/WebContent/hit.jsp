<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= 
"com.wjh.board.DB" %>

<%

String no = request.getParameter("no");
String status = DB.hitUp(no);

// out.print(status);

if(status.equals("SUCCESS")) {
	response.sendRedirect("detail_form.jsp?no="+no);
}

%>