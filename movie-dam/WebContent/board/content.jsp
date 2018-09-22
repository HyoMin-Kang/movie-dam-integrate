<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="moviedam.board.ArticleDBBean"%>
<%@ page import="moviedam.board.ArticleDataBean"%>
<%@ page import="moviedam.board.CommentDBBean"%>
<%@ page import="moviedam.board.CommentDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>


<%
	request.setCharacterEncoding("utf-8");
	String title = "게시글 상세보기";
	String userid = (String)session.getAttribute("userid");
	int count = 0;
%>

<%
	int article_id = Integer.parseInt(request.getParameter("article_id"));
	String pageNum = request.getParameter("pageNum");
	
	if (pageNum == null) {
        pageNum = "1";
    }

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		ArticleDBBean article_db = ArticleDBBean.getInstance();
		ArticleDataBean article = article_db.getArticle(article_id);
%>

<%
	ArrayList<CommentDataBean> commentList = null;
		CommentDBBean cmt_db = CommentDBBean.getInstance();
		count = cmt_db.getCommentCount(article_id);
		if (count > 0) {
			commentList = cmt_db.getComments(article_id);
		}
		
	try{
		  if(session.getAttribute("userid")==null)
			  userid="not";
		  else
			  userid= (String)session.getAttribute("userid");    
		}catch(Exception e){}	
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title%>" />
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false" />

<div class="container">
	<h3>
		게시판명
		<small class="text-muted">Detail View</small>
	</h3>
	<div class="row">
		<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='free_board.jsp?pageNum=<%=pageNum%>'">글목록</button>
		<table class="table table-bordered">
			<tr>
				<td>글번호</td>
				<td><%=article.getArticle_id() %></td>
				<td>조회수</td>
				<td><%=article.getArticle_hits() %></td>
				<td>추천수</td>
				<td><%=article.getArticle_gets() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=article.getArticle_writer()%>님</td>
				<td>작성일</td>
				<td><%=sdf.format(article.getReg_date())%></td>
				<td>카테고리</td>
				<td><%=article.getCategory()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5"><%=article.getArticle_title()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5"><%=article.getArticle_content().replace("\r\n", "<br>") %></td>
			</tr>
<%
if(article.getArticle_file() != null) {
%>
			<tr>
				<td colspan="6"><img src="/movie-dam/imageFolder/<%=article.getArticle_file()%>" width="250px"></td>
			</tr>
			<tr>
				<td colspan="6">첨부된 파일 : <a href="#"><%=article.getArticle_file() %></a></td>
			</tr>
<%
}
%>
		</table>
	</div>

	<div class="row">

		<form action="contentPro.jsp?article_id=<%=article_id%>">
			<input type="hidden" name="cmt_ref" value="<%=article.getArticle_id()%>"> 
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<input type="hidden" name="cmt_writer" value="<%=userid %>">
			
			<table class="table">
				<tr>
					<td colspan="3" align="center"></td>
				</tr>

				<tr>
					<td colspan="3" align="center">comment(<%=count%>)
					</td>
				</tr>

				<tr>
					<td height="100" align="center"><%=userid%></td>
					<td colspan="2" align="right" style="font-size: 14px;">
						<textarea class="form-control" rows="3" cols="160" name="cmt_content"></textarea>
						<input class="btn btn-outline-secondary btn-sm" type="submit" name="register" value="댓글 작성"> 
						<input class="btn btn-outline-secondary btn-sm" type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>	
				<%
					if (commentList != null && commentList.size() > 0) {
							for (int i = 0; i < commentList.size(); i++) {
								CommentDataBean comment = commentList.get(i);
				%>
		<form name="updatecomment" method="post" action="updateCommentPro.jsp"> 
		
			<table class="table">		
				<tr>
					<td rowspan=2 align="center">img</td>
					<td colspan=2 align="left" style="font-size: 14px;">
						<b><%=comment.getCmt_writer()%></b> (<%=comment.getCmt_date()%>)
					</td>
				</tr>
				<tr height="75">
					<td colspan=2 style="font-size: 14px;"><%=comment.getCmt_content()%></td>
				</tr>
<% 
	if(userid.equals(comment.getCmt_writer())) {
%>					
				<tr>
					<td colspan=3 align="right">
						<button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateOpen(<%=comment.getCmt_id()%>, <%=article_id%>, <%=pageNum%>);">수정</button>
						<button type="button" class="btn btn-sm btn-outline-danger" 
							onclick="document.location.href='deleteCommentPro.jsp?article_id=<%=article_id%>&cmt_id=<%=comment.getCmt_id()%>&userid=<%=userid%>&pageNum=<%=pageNum%>&cmt_ref=<%=article_id%>'">삭제</button>
					</td>
				</tr>	
<%
	} else {
	
%>
				<tr>
					<td colspan=3 align="right">
						<button type="button" class="btn btn-sm btn-outline-secondary" disabled="disabled">수정</button>
						<button type="button" class="btn btn-sm btn-outline-danger" disabled="disabled">삭제</button>
					</td>
				</tr>	
<%
	}
%>
				
				<%
					}
						}

					} catch (Exception e) {

					}
				%>

			</table>
		</form>

	</div>

</div>

<script>
function updateOpen(cmt_id, article_id, pageNum) {
	url = 'updateCommentForm.jsp?cmt_id=' + cmt_id + '&article_id=' + article_id + '&pageNum=' + pageNum;
	window.open(url, '댓글 수정', 'height=200, width=400, scrollbars=no, resizable=no');
}
</script>	


</body>
</html>