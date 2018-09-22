<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "영화담";
%>

<jsp:include page="/module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>" />
</jsp:include>

<jsp:include page="/module/nav.jsp" flush="false" />

<div class="container">
	<div class="row">
		<!--Post Stasrt -->
		<div class="col-md-15">
			<div class="col-md-12 page=body">
				<div class="row">
					<div class="col-md-12 content-page">
						<!-- Default panel contents -->
						<h2>영화토론</h2>
						<div class="col-md-6">
							<div class="thumbnail">
								<h2>찬반토론</h2>
								<a target="_blank" href=""><img
									src="/movie-dam/assets/img/movie_image(4).png"></a>
								<div class="caption">
									<a href="">인간과 OS는 사랑에 빠질 수 있을까?</a>
								</div>
								<div class="caption">
									<a href="">폭력으로 유지되는 법질서에 동의하는가?</a>
								</div>
								<div class="caption">
									<a href="">모성애는 만들어지는 것인가?</a>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="thumbnail">
								<h2>토론배틀</h2>
								<a target="_blank" href=""><img
									src="/movie-dam/assets/img/movie_image%20(5).jpg"></a>
								<div class="caption">
									<a href="">'파수꾼' 속 기태는 학교폭력의 가해자일 뿐인가?</a>
								</div>
								<div class="caption">
									<a href="">'위플래쉬'의 폭군 교수 플랫처의 가르침은 옳은가?</a>
								</div>
								<div class="caption">
									<a href="">나를 찾아줘'의 에이미의 감정은 사랑인가 집착인가?</a>
								</div>
							</div>
						</div>

						<h2>영화이슈</h2>
						<div class="col-md-3">
							<div class="thumbnail">
								<a target="_blank" href=""><img
									src="http://placehold.it/200x150"></a> <a href="">기사 제목</a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="thumbnail">
								<a target="_blank" href=""><img
									src="http://placehold.it/200x150"></a> <a href="">기사 제목</a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="thumbnail">
								<a target="_blank" href=""><img
									src="http://placehold.it/200x150"></a> <a href="">기사 제목</a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="thumbnail">
								<a target="_blank" href=""><img
									src="http://placehold.it/200x150"></a> <a href="">기사 제목</a>
							</div>
						</div>

						<h2>영화수다</h2>
						<div class="col-md-6">
							<div class="thumbnail">
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="thumbnail">
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
								<div>
									<a href="">커뮤니티 글</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/module/footer.jsp" flush="false" />

</body>
</html>