<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "moviedam.board.CommentDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>


<% 
	String pageNum = request.getParameter("pageNum");
	
	int article_id = Integer.parseInt(request.getParameter("cmt_ref"));
	int cmt_id = Integer.parseInt(request.getParameter("cmt_id"));
	String id = request.getParameter("userid");
	
	CommentDBBean dbPro = CommentDBBean.getInstance(); 
	int check = dbPro.deleteComment(cmt_id, id);
	
%>
<head>
	<meta http-equiv="Refresh" content="0;url=content.jsp?article_id=<%=article_id%>&pageNum=<%=pageNum%>">
</head>
<body>

</body>
</html>