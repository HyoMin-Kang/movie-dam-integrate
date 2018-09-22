<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>    
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="moviedam.board.CommentDBBean" %>
<%@ page import="moviedam.board.CommentDataBean" %>
<%@ page import="moviedam.board.ArticleDBBean" %>
<%@ page import="moviedam.board.ArticleDataBean" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = "자유게시판";	
	String pageNum = request.getParameter("pageNum");
    String option = request.getParameter("option");
    String search = request.getParameter("search");
    String category = request.getParameter("category");
    
%>
<%!
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int ccount = 0;
	int number = 0;
	int total_page = 0;
	List<ArticleDataBean> articleList = null; 
    
    ArticleDBBean article_db = ArticleDBBean.getInstance();
    
    ArrayList<CommentDataBean> commentList = null;
	CommentDBBean comment_db = CommentDBBean.getInstance();
	
    count = article_db.getArticleCount(option,search,category); //전체 글 수
    if (count > 0) {
       	articleList = article_db.getArticles(startRow, endRow, option, search, category);
	}    
    
	number = count-(currentPage-1)*pageSize;
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false"/>

<div class="container">
	<h3>
		<%=title %>
		<small class="text-muted">Free board</small>
	</h3>
	<p>
		검색된 글 : <%=count%>개
	</p>
	<div class="row">
		<div class="col-lg-8 offset-lg-2 form-group">
		<form>
			<input type="hidden" name="category" value="<%=category %>">
			<label class="control-label">게시글 검색</label>
			<div class="form-group">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<select class="form-control" name="option">
					        <option value="all">전체글</option>
					        <option value="article_title">제목</option>
					        <option value="article_content">내용</option>
					        <option value="article_writer">작성자</option>
				        </select>
					</div>
					<input class="form-control" type="text" name="search" placeholder="궁금한 것을 검색해보세요">
					<div class="input-group-append">
						<input class="btn btn-outline-secondary" type="submit" value="검색"/> 
					</div>
				</div>
			</div>
		</form>
		</div>
	    <div class="col-lg-2 form-group">
			<label class="control-label">정렬</label>
			<select class="form-control" name="sort">
				<option value="sort_recent">최신순</option>
	        	<option value="sort_comment">댓글순</option>
	        	<option value="sort_gets">추천순</option>
	        	<option value="sort_hits">조회순</option>
	      	</select>
	    </div>
	</div>

	<div class="row">
		<div class="col-lg-2">
			<div class="list-group">
				<a href="free_board.jsp?category=all" class="list-group-item list-group-item-action">전체
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a> 
				<a href="free_board.jsp?category=talk" class="list-group-item list-group-item-action">사담
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a> 
				<a href="free_board.jsp?category=movietalk" class="list-group-item list-group-item-action">영화후기
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a>
				<a href="free_board.jsp?category=spoiler" class="list-group-item list-group-item-action">스포일러
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a>
				<a href="free_board.jsp?category=movietmi" class="list-group-item list-group-item-action">영화TMI
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a>
				<a href="free_board.jsp?category=boast" class="list-group-item list-group-item-action">자랑하기
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a>
				<a href="free_board.jsp?category=hobby" class="list-group-item list-group-item-action">덕질공간
					<span class="badge badge-primary badge-pill" style="float:right">14</span>
				</a>
			</div>
		</div>
		
		<div class="col-lg-10">
		

	
<% if (count == 0) { %>

		<div class="alert alert-danger" role="alert">
		  게시판에 저장된 글이 없습니다.
		</div>

<% } else {%>

<table class="table table-bordered table-hover">
	<colgroup>
		<col width="8%">
		<col width="8%">
		<col width="*">
		<col width="10%">
		<col width="20%">
		<col width="8%">
		<col width="8%">
		<col width="8%">
		
	</colgroup>
	<thead >
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">분류</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">댓글수</th>
	      <th scope="col">추천수</th>
	      <th scope="col">조회수</th>
	      
	    </tr>
	  </thead>
	  <tbody>
<%  
	int a = count / pageSize + (count % pageSize == 0 ? 0 : 1); //전체페이지 수 
	
	if(Integer.parseInt(pageNum) > a){ %>
		<jsp:forward page="error.jsp"/>
	<% }
	
   for (int i = 0 ; i < articleList.size() ; i++) {
	   ArticleDataBean article = articleList.get(i);
	   
       ccount = comment_db.getCommentCount(article.getArticle_id());
%>
   <tr>
    <td> <%=number--%></td>
    <td> <%=article.getCategory()%></td>

           
      <td><a href="content.jsp?article_id=<%=article.getArticle_id()%>&pageNum=<%=currentPage%>"><%=article.getArticle_title()%></a> </td>
<% if(article.getArticle_gets()>=20){%>
         <span class="badge badge-danger">N</span><%}%> </td>
    <td> 
       <%=article.getArticle_writer()%></a></td>
    <td class="text-center"><%=sdf.format(article.getReg_date())%></td>
     <td class="text-center"><%=ccount%></td>
      <td class="text-center"><%=article.getArticle_gets() %></td>
    <td class="text-right"><%=article.getArticle_hits()%></td>
    
  </tr>
<%}%>
</tbody>
</table>
</div>
<%}%>

<nav aria-label="Page navigation">
  <ul class="pagination justify-content-center">
<%
    if (count > 0) {
    	//전체 페이지수 구하기//50개=>5페이지, 51~59개=>6페이지
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        
    	if(pageCount < currentPage){
    		currentPage = pageCount;
    	}
       //한 페이지에 보여지는 시작페이지 구하기
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1; 
           
        int pageBlock = 10; //한 페이지에 보여줄 페이지수 설정
        
		//한 페이지에 보여지는 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) {
        	endPage = pageCount; 
        } 
        
        
        if (startPage > 10) { %>
    	<li class="page-item"><a class="page-link" href="free_board.jsp?pageNum=<%=startPage - 10 %>&category=<%=category%>">이전</a></li>
<%      }
    
    for (int i = startPage ; i <= endPage ; i++) {
    	if(i == currentPage) {
%>
		<li class="page-item active">
	      <a class="page-link" href="free_board.jsp?pageNum=<%=i %>&category=<%=category%>"><%=i %> <span class="sr-only">(current)</span></a>
	    </li>
<%        		
    	} else {
%>	
		<li class="page-item"><a class="page-link" href="free_board.jsp?pageNum=<%=i %>&category=<%=category%>"><%=i %></a></li>
<%        		
    	}
  }
    
    if (endPage < pageCount) {  %>
    <li class="page-item"><a class="page-link" href="free_board.jsp?pageNum=<%=startPage + 10 %>&category=<%=category%>">다음</a></li>
<%
    }
}
%>
	</ul>
</nav>

	<a class="btn btn-sm btn-outline-secondary" href="writeForm.jsp?board_id=1&article_writer=${sessionScope.userid}" role="button" >글쓰기</a>
		
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />
</body>
</html>