<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "영화관 맛집";
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title%>" />
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false" />

<div class="container">
	<h3>
		<%=title%>
		<small class="text-muted">Cinema Restaurant</small>
	</h3>
	<div class="list_serch form-inline" align="center">
		<form>
			<select class="form-control" name="option">
				<option value="all">전체글</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> 
			<input class="form-control" type="text" name="search" size="30" placeholder="궁금한 것을 검색해보세요"> 
			<input class="btn btn-outline-secondary" type="submit" value="검색" />
		</form>
	</div>
	<div class="row">
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="selectRegion" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">지역 선택</button>
			<div class="dropdown-menu" aria-labelledby="selectRegion">
				<a class="dropdown-item" href="#">서울</a> 
				<a class="dropdown-item" href="#">경기도</a> 
				<a class="dropdown-item" href="#">경상도</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="selectCinema" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화관 선택</button>
			<div class="dropdown-menu" aria-labelledby="selectCinema">
				<a class="dropdown-item" href="#">CGV</a> 
				<a class="dropdown-item" href="#">롯데시네마</a> 
				<a class="dropdown-item" href="#">메가박스</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="selectCinema" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">정렬 순서</button>
			<div class="dropdown-menu" aria-labelledby="selectCinema">
				<a class="dropdown-item" href="#">최신순</a> 
				<a class="dropdown-item" href="#">댓글순</a> 
				<a class="dropdown-item" href="#">추천순</a>
				<a class="dropdown-item" href="#">조회순</a>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="/movie-dam/assets/images/pic/my-pic.png">
				<div class="caption">
					<h3>맛집제목</h3>
					<p>맛집설명</p>
				</div>
			</div>
		</div>
		
	</div>

	<a class="btn btn-sm btn-outline-secondary" href="writeForm.jsp?board_id=2&article_writer=${sessionScope.userid}" role="button" ><i class="fas fa-edit"></i>글쓰기</a>
</div>


<jsp:include page="/module/footer.jsp" flush="false" />

</body>
</html>