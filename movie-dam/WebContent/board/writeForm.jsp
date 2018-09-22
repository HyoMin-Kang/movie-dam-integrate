<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="moviedam.board.BoardDBBean"%>
<%@ page import="moviedam.board.BoardDataBean"%>
<%@ page import="moviedam.member.MemberDBBean"%>
<%@ page import="moviedam.member.MemberDataBean"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "게시글 작성";
	int board_id = Integer.parseInt(request.getParameter("board_id"));
	String userid = request.getParameter("article_writer");
	BoardDBBean board_db = BoardDBBean.getInstance();
	BoardDataBean board = board_db.getBoard(board_id);
	MemberDBBean member_db = MemberDBBean.getInstance();
	MemberDataBean profile = member_db.getProfile(userid);
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title%>" />
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false" />

<div class="container">
	<h3>
		<%=title%>
		<small class="text-muted">Write Article</small>
	</h3>

	<div class="row">
		<form method="post" name="writeform" action="writePro.jsp?board_id=<%=board.getBoard_id()%>" onsubmit="return writeSave()" enctype="multipart/form-data">
			<div class="form-group col">
				<label for="inputWriter" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputWriter" name="article_writer" value="<%=profile.getMem_nickname() %>" readonly="readonly">
				</div>
			</div>
<c:if test="<%=board_id == 1 %>">
			<div class="form-group col">
				<label for="inputCategory">카테고리</label> 
				<select class="form-control" id="inputCategory" name="category">
					<option value="talk" selected="selected">사담</option>
					<option value="movietalk">영화후기</option>
					<option value="spoiler">스포일러</option>
					<option value="movietmi">영화TMI</option>
					<option value="boast">자랑하기</option>
					<option value="hobby">덕질공간</option>
				</select>
			</div>
</c:if>
<c:if test="<%=board_id == 4 %>">
			<div class="form-group">
				<label for="inputCategory">영화관</label> 
				<select class="form-control" id="inputCinema" name="cinema">
					<option value="cgv" selected="selected">CGV</option>
					<option value="lottecinema">롯데시네마</option>
					<option value="megabox">메가박스</option>
					<option value="etc">기타</option>
				</select>
			</div>
			<div class="form-group col">
				<label for="inputUrl" class="col-sm-2 col-form-label">원본글 주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputUrl" name="original_url">
				</div>
			</div>
			<div class="form-group col">
				<label for="inputWriter" class="col-sm-2 col-form-label">일시</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="datepicker" name="preview_date">
				</div>
			</div>
			<div class="form-group col">
				<label for="Textarea">지역</label>
				<textarea class="form-control" id="inputContent" name="preview_region" rows="1"></textarea>
			</div>
</c:if>
<c:if test="<%=board_id == 5 %>">
			<div class="form-group col">
				<label for="inputUrl" class="col-sm-2 col-form-label">원본글 주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputUrl" name="original_url">
				</div>
			</div>
</c:if>
			<div class="form-group col">
				<label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputTitle" name="article_title" maxlength="100">
				</div>
			</div>
<c:if test="<%=board_id == 2 %>">
			<div class="form-group col">
				<div class="form-group">
					<label for="inputLoc" class="col-sm-2 col-form-label">장소</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="searchLoc" name="search_loc" placeholder="위치를 입력하세요.">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchLocation();">검색</button>
						</div>
					</div>
				</div>
				<div class="map_wrap">
					<div id="map" style="width: 500px; height: 400px;"></div>
				  	<div class="hAddr">
				        <span class="title">지도중심기준 주소정보</span>
				        <span id="centerAddr"></span>
			    	</div>
			    </div>
			</div>
</c:if>
			<div class="form-group col">
				<label for="exampleTextarea">내용</label>
				<textarea class="form-control" id="inputContent" name="article_content" rows="3"></textarea>
			</div>
			<div class="form-group col">
				<label for="exampleInputFile">첨부파일</label> 
				<input type="file" class="form-control-file" id="inputFile" name="article_file" aria-describedby="fileHelp" accept="image/*"> 
				<small id="fileHelp" class="form-text text-muted">이미지 파일만 첨부 가능합니다.</small>
			</div>

			<button type="submit" class="btn btn-primary">작성하기</button>
			<button type="reset" class="btn btn-secondary">다시작성</button>
<c:choose>
	<c:when test="<%=board_id == 1 %>">
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='./free_board.jsp'">목록으로</button>
	</c:when>
	<c:when test="<%=board_id == 2 %>">
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='./cinema_restaurant.jsp'">목록으로</button>
	</c:when>
	<c:when test="<%=board_id == 4 %>">
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='./movie_preview.jsp'">목록으로</button>
	</c:when>
	<c:when test="<%=board_id == 5 %>">
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='./movie_issue.jsp'">목록으로</button>
	</c:when>
</c:choose>
			
		</form>
	</div>

</div>


<jsp:include page="/module/footer.jsp" flush="false" />

<jsp:include page="getMap.jsp" flush="false" />

<script>
$(function() {
	$( "#datepicker" ).datepicker({
		dateFormat: 'yy-mm-dd'
	});
});
</script>
</body>
</html>