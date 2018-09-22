<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Button -->
<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<a href="/movie-dam/member/profile.jsp" class="btn btn-default" role="button">마이페이지</a> -->

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/movie-dam/main.jsp">영화담</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/movie-dam/main.jsp">홈 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화 소개</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
        	<a class="dropdown-item" href="/movie-dam/movie/movie_list.jsp">영화목록</a>
        	<a class="dropdown-item" href="/movie-dam/movie/movie_boxoffice.jsp">박스오피스</a> 
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화 토론</a>
      	<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
      		<a class="dropdown-item" href="/movie-dam/debate/debate_chanban.jsp">찬반토론</a>
      		<a class="dropdown-item" href="/movie-dam/debate/debate_battle.jsp">토론배틀</a>
      	</div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화 수다</a>
      	<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
      		<a class="dropdown-item" href="/movie-dam/board/free_board.jsp?category=all">자유게시판</a>
      		<a class="dropdown-item" href="/movie-dam/board/movie_quiz.jsp">영화퀴즈</a>
      		<a class="dropdown-item" href="/movie-dam/board/cinema_restaurant.jsp">영화관 맛집</a>
      		<a class="dropdown-item" href="#">영화굿즈 정보</a>
      	</div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화 소식</a>
      	<div class="dropdown-menu" aria-labelledby="navbarDropdown4">
      		<a class="dropdown-item" href="/movie-dam/board/movie_preview.jsp">시사회</a>
      		<a class="dropdown-item" href="/movie-dam/board/movie_stage.jsp">무대인사</a>
      		<a class="dropdown-item" href="/movie-dam/board/movie_issue.jsp">영화 이슈</a>
      	</div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    	<c:if test="${sessionScope.userid eq null }"> <!-- 비로그인 상태 -->
	    	<a class="btn btn-outline-info" href="/movie-dam/member/login_form.jsp">로그인</a>
	    	<a class="btn btn-outline-secondary" href="/movie-dam/member/signup_form.jsp">회원가입</a>
    	</c:if>
    	<c:if test="${sessionScope.userid ne null }"> <!-- 로그인 상태 -->
    		<a class="btn btn-outline-secondary" href="/movie-dam/member/logout.jsp">로그아웃</a>
	    	<a class="btn btn-outline-info" href="/movie-dam/member/profile.jsp?mem_userid=${sessionScope.userid }">마이페이지</a>
    	</c:if>
    </form>
    <form class="form-inline my-2 my-lg-0">
		<input class="form-control mr-sm-2" type="text" placeholder="Search">
		<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>